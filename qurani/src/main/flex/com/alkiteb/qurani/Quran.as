/*
   Copyright (C) 2011 Ghazi Triki <ghazi.nocturne@gmail.com>

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
package com.alkiteb.qurani
{
    import com.alkiteb.qurani.converters.AyaConverter;
    import com.alkiteb.qurani.converters.HizbConverter;
    import com.alkiteb.qurani.converters.PageConverter;
    import com.alkiteb.qurani.converters.SuraConverter;
    import com.alkiteb.qurani.exceptions.QuranException;

    import flash.data.SQLConnection;
    import flash.events.EventDispatcher;
    import flash.events.SQLEvent;
    import flash.utils.Dictionary;

    import mx.resources.ResourceManager;

    use namespace quran_internal;

    [ResourceBundle("quran")]

    /**
     *
     * @author Ghazi Triki
     *
     */
    public class Quran extends EventDispatcher
    {

        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------

        [Bindable]
        /**
         *
         * @return
         *
         */
        public var basmalah : Aya;

        /**
         * @private
         */
        private static var connection : SQLConnection;

        /**
         * @private
         */
        private static var suraIdByName : Dictionary;

        /**
         * @private
         */
        private static var suraInfoById : Dictionary;

        /**
         * @private
         */
        private var selectedSurNumber : int;

        /**
         * @private
         */
        private var ayaConverter : AyaConverter;

        /**
         * @private
         */
        private var pageConverter : PageConverter;

        /**
         * @private
         */
        private var hizbConverter : HizbConverter;

        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         *
         *
         */
        public function Quran()
        {
            if (connection == null)
            {
                suraIdByName = new Dictionary(true);
                suraInfoById = new Dictionary(true);
                connection = QuranHelper.getConnection();
                QuranHelper.executeQuery(Queries.GET_SUWAR_INFO, onSuwarQueryResult);
            }
        }

        //--------------------------------------------------------------------------
        //
        //  API Methods
        //
        //--------------------------------------------------------------------------
        /**
         * Get the number of suwar in the Holy Quran.
         * @return 114, the number suwar in the Holy Quran
         *
         */
        public static function getSuwarCount() : int
        {
            return QuranConstants.QURAN_SUWAR_NUMBER;
        }

        /**
         * Get the number of ayat in the Holy Quran.
         * @return 6236, the number of ayat in the Holy Quran
         *
         */
        public static function getAyatCount() : int
        {
            return QuranConstants.QURAN_AYAT_NUMBER;
        }

        /**
         *
         * @return The Basmalah Aya, the first Aya in the Holy Quran.
         *
         */
        public function getBasmalah() : Aya
        {
            if (basmalah == null)
            {
                basmalah = getAya(1, 1)
            }
            return basmalah;
        }

        /**
         * Returns an Aya by specifying its sura number and its number.
         * @param suraNumber The number of the sura that contains the aya.
         * @param ayaNumber The number of the aya that will be returned.
         * @return
         *
         */
        public function getAya( suraNumber : int, ayaNumber : int ) : Aya
        {
            validateSura(suraNumber);

            var result : Aya;
            QuranHelper.executeQuery(Queries.GET_AYA_SQL, function( event : SQLEvent ) : void
            {
                result = getAyaConverter().convert(event.target.getResult().data[0]);
            }

            , [":ayaId", ":ayatLength"], [getInternalAyaNumber(suraNumber, ayaNumber), 1]);
            return result;
        }

        /**
         *
         * @return Array containing all the suwar of the Holy Quran.
         *
         */
        public function getAllAyat() : Array
        {
            var result : Array;
            QuranHelper.executeQuery(Queries.GET_AYA_SQL, function( event : SQLEvent ) : void
            {
                result = getAyaConverter().convertArray(event.target.getResult().data);
            }

            , [":ayaId", ":ayatLength"], [1, QuranConstants.QURAN_AYAT_NUMBER]);
            return result;
        }


        /**
         * Extracts a sura with all of its ayat
         * @param suraNumber The number of sura that will be retruned.
         * @return
         *
         */
        public function getSura( suraNumber : int ) : Sura
        {
            validateSura(suraNumber);
            var resultSura : Sura;
            selectedSurNumber = suraNumber;
            QuranHelper.executeQuery(Queries.GET_AYA_SQL, function( event : SQLEvent ) : void
            {
                resultSura = Sura(suraInfoById[selectedSurNumber]);
                if (!resultSura.ayat)
                {
                    resultSura.ayat = getAyaConverter().convertArray(event.target.getResult().data);
                }
            }

            , [":ayaId", ":ayatLength"], [Sura(suraInfoById[suraNumber]).startingAyaId, getSuraLength(suraNumber)]);
            return resultSura;
        }

        /**
         * Extracts a sura with all of its ayat using its arabic name.
         * @param suraName Sura arabic name.
         *
         */
        public function getSuraByName( suraName : String ) : Sura
        {
            var sura : Sura;
            try
            {
                sura = getSura(suraIdByName[suraName].orderInMushaf);
            }
            catch ( e : Error )
            {
                throw new QuranException(ResourceManager.getInstance().getString("quran", "suraNameError", [suraName]));
            }
            return sura;
        }

        /**
         *
         * @return Array of String containing all the suwar names of the Holy Quran.
         *
         */
        public function getSuwarNames() : Array
        {
            var sura : Sura;
            var result : Array = [];
            for each (sura in suraInfoById)
            {
                result.push(sura.name);
            }
            return result;
        }

        /**
         * Returns a page of the Quran.
         * @param number the page number, must be between 1 and 604.
         * @return Page object containing ayat of the page itself.
         *
         */
        public function getPage( pageNumber : int ) : Page
        {
            validatePage(pageNumber);
            var result : Page;
            QuranHelper.executeQuery(Queries.GET_PAGE, function( event : SQLEvent ) : void
            {
                result = getPageConverter().convert(event.target.getResult().data[0]);
            }

            , [':pageId'], [pageNumber]);

            // We extract the next page to know the limit of the current page
            var nextPage : Page;
            if (result.number < QuranConstants.QURAN_PAGE_NUMBER)
            {
                QuranHelper.executeQuery(Queries.GET_PAGE, function( event : SQLEvent ) : void
                {
                    nextPage = getPageConverter().convert(event.target.getResult().data[0]);
                }

                , [':pageId'], [pageNumber + 1]);
            }

            // If the there is a next page
            var pageAyatLength : int;
            var currentPageStartAyaNumber : int = getInternalAyaNumber(result.startSura, result.startAya);
            try
            {
                pageAyatLength = getInternalAyaNumber(nextPage.startSura, nextPage.startAya) - currentPageStartAyaNumber;
            }
            catch ( e : Error )
            {
                pageAyatLength = QuranConstants.QURAN_AYAT_NUMBER - currentPageStartAyaNumber + 1;
            }

            // We extract ayat here
            QuranHelper.executeQuery(Queries.GET_AYA_SQL, function( event : SQLEvent ) : void
            {
                result.ayat = getAyaConverter().convertArray(event.target.getResult().data);
            }

            , [":ayaId", ":ayatLength"], [currentPageStartAyaNumber, pageAyatLength]);

            return result;
        }

        public function getHizb( hizbNumber : int ) : Hizb
        {
            validateHizb(hizbNumber);
            var hizbStartIndex : int = (hizbNumber - 1) * 4;
            var result : Hizb;
            QuranHelper.executeQuery(Queries.GET_HIZB, function( event : SQLEvent ) : void
            {
                result = getHizbConverter().convert(event.target.getResult().data);
            }

            , [':hizbStartIndex'], [hizbStartIndex]);

            return result;
        }

        //--------------------------------------------------------------------------
        //
        //  Validation methods
        //
        //--------------------------------------------------------------------------

        /**
         *
         * @param suraNumber
         *
         */
        private function validateSura( suraNumber : int ) : void
        {
            if (suraNumber < 1 || suraNumber > QuranConstants.QURAN_SUWAR_NUMBER)
            {
                throw new QuranException(ResourceManager.getInstance().getString("quran", "suraNumberError", [suraNumber]));
            }
        }

        /**
         *
         * @param pageNumber
         *
         */
        private function validatePage( pageNumber : int ) : void
        {
            if (pageNumber < 1 || pageNumber > QuranConstants.QURAN_PAGE_NUMBER)
            {
                throw new QuranException(ResourceManager.getInstance().getString("quran", "pageNumberError", [pageNumber]));
            }
        }

        private function validateHizb( hizbNumber : int ) : void
        {
            if (hizbNumber < 1 || hizbNumber > QuranConstants.QURAN_HIZB_NUMBER)
            {
                throw new QuranException(ResourceManager.getInstance().getString("quran", "hizbNumberError", [hizbNumber]));
            }
        }

        /**
         * Returns the number of ayat of a Sura by its number in the Quran.
         * @param suraNumber
         * @return
         *
         */
        public function getSuraLength( suraNumber : int ) : int
        {
            var sura : Sura = suraInfoById[suraNumber];
            if (sura.ayat)
            {
                return sura.ayat.length;
            }
            else
            {
                var selectedSuraStartingAyaId : int = Sura(suraInfoById[suraNumber]).startingAyaId;

                var nextSuraStartingAyaId : int = suraNumber != QuranConstants.QURAN_SUWAR_NUMBER
                    ? Sura(suraInfoById[suraNumber + 1]).startingAyaId : QuranConstants.QURAN_AYAT_NUMBER + 1;

                return nextSuraStartingAyaId - selectedSuraStartingAyaId;
            }
        }

        /**
         *
         * @param suraNumber
         * @param ayaNumber
         * @return
         *
         */
        private function getInternalAyaNumber( suraNumber : int, ayaNumber : int ) : int
        {

            var foundAyaNumber : int;
            var suraLenght : int = getSuraLength(suraNumber);
            if (suraLenght >= ayaNumber)
            {
                foundAyaNumber = Sura(suraInfoById[suraNumber]).startingAyaId + ayaNumber - 1;
            }
            else
            {
                // TODO : add nonExisitingAya exception
                throw new QuranException(ResourceManager.getInstance().getString("quran", "ayaNumberError", [suraInfoById[suraNumber].name, suraLenght, ayaNumber]));
            }

            return foundAyaNumber;
        }


        //--------------------------------------------------------------------------
        //
        //  Events handlers
        //
        //--------------------------------------------------------------------------
        /**
         *
         * @param event
         *
         */
        private static function onSuwarQueryResult( event : SQLEvent ) : void
        {
            var suraConverter : SuraConverter = new SuraConverter();
            var result : Array = suraConverter.convertArray(event.target.getResult().data);

            suraIdByName = result[0];
            suraInfoById = result[1];

            suraConverter = null;
        }

        //--------------------------------------------------------------------------
        //
        //  Converters
        //
        //--------------------------------------------------------------------------

        /**
         *
         * @private
         *
         */
        private function getAyaConverter() : AyaConverter
        {
            if (!ayaConverter)
            {
                ayaConverter = new AyaConverter();
            }
            return ayaConverter;
        }

        /**
         *
         * @private
         *
         */
        private function getPageConverter() : PageConverter
        {
            if (!pageConverter)
            {
                pageConverter = new PageConverter();
            }
            return pageConverter;
        }

        /**
         *
         * @private
         *
         */
        private function getHizbConverter() : HizbConverter
        {
            if (!hizbConverter)
            {
                hizbConverter = new HizbConverter();
            }
            return hizbConverter;
        }

    }
}
