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
package org.lionart.qurani
{
    import flash.data.SQLConnection;
    import flash.events.EventDispatcher;
    import flash.events.SQLEvent;
    import flash.utils.Dictionary;

    import mx.resources.ResourceManager;

    import org.lionart.qurani.converters.AyaConverter;
    import org.lionart.qurani.converters.SuraConverter;
    import org.lionart.qurani.exceptions.QuranException;

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
         *
         */
        private static var _quran : Quran;

        /**
         *
         */
        private var connection : SQLConnection;

        /**
         *
         */
        private var suraIdByName : Dictionary;

        /**
         *
         */
        private var suraInfoById : Dictionary;

        private var selectedSurNumber : int;

        private var ayaConverter : AyaConverter;

        //--------------------------------------------------------------------------
        //
        //  Singleton accessor
        //
        //--------------------------------------------------------------------------

        /**
         *
         * @return
         *
         */
        public static function getInstance() : Quran
        {
            if (_quran == null)
            {
                _quran = new Quran();
                _quran.suraIdByName = new Dictionary(true);
                _quran.suraInfoById = new Dictionary(true);
                _quran.connection = QuranHelper.getConnection();
                QuranHelper.executeQuery(Queries.GET_SUWAR_INFO, onSuwarQueryResult);
            }
            return _quran;
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
        public function getSuwarCount() : int
        {
            return QuranConstants.QURAN_SUWAR_NUMBER;
        }

        /**
         * Get the number of ayat in the Holy Quran.
         * @return 6236, the number of ayat in the Holy Quran
         *
         */
        public function getAyatCount() : int
        {
            return QuranConstants.QURAN_SUWAR_NUMBER;
        }

        /**
         *
         * @param suraNumber
         * @param ayaNumber
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
         * Extracts a sura with all of its ayat.
         * @param suraNumber
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
        public function getSuraByName( suraName : String ) : void
        {
            try
            {
                getSura(suraIdByName[suraName].orderInMushaf);
            }
            catch ( e : Error )
            {
                throw new QuranException(ResourceManager.getInstance().getString("quran", "suraNameError", [suraName]));
            }
        }

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

        //--------------------------------------------------------------------------
        //
        //  Validation methods
        //
        //--------------------------------------------------------------------------

        private function validateSura( suraNumber : int ) : void
        {
            if (suraNumber < 1 || suraNumber > QuranConstants.QURAN_SUWAR_NUMBER)
            {
                throw new QuranException(ResourceManager.getInstance().getString("quran", "suraNumberError", [suraNumber]));
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

            _quran.suraIdByName = result[0];
            _quran.suraInfoById = result[1];

            suraConverter = null;
        }

        //--------------------------------------------------------------------------
        //
        //  Converters
        //
        //--------------------------------------------------------------------------

        public function getAyaConverter() : AyaConverter
        {
            if (!ayaConverter)
            {
                ayaConverter = new AyaConverter();
            }
            return ayaConverter;
        }

    }
}
