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
    import org.lionart.qurani.converters.SouraConverter;
    import org.lionart.qurani.events.QuranEvent;
    import org.lionart.qurani.exceptions.QuranException;

    use namespace quran_internal;

    [ResourceBundle("quran")]
    
    [Event(name = "getAya", type = "org.lionart.qurani.events.QuranEvent")]
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
        private var souraIdByName : Dictionary;

        /**
         *
         */
        private var souraInfoById : Dictionary;

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
                _quran.souraIdByName = new Dictionary(true);
                _quran.souraInfoById = new Dictionary(true);
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
         *
         * @param souraNumber
         * @param ayaNumber
         *
         */
        public function getAya( souraNumber : int, ayaNumber : int ) : void
        {
            validateSura(souraNumber);
            QuranHelper.executeQuery(Queries.GET_AYA_SQL, getAyaResultHandler, [":ayaId", ":ayatLength"], [getInternalAyaNumber(souraNumber, ayaNumber), 1]);
        }

        //--------------------------------------------------------------------------
        //
        //  Validation methods
        //
        //--------------------------------------------------------------------------

        private function validateSura( souraNumber : int ) : void
        {
            if (souraNumber < 1 || souraNumber > QuranConstants.QURAN_SUWAR_NUMBER)
            {
                throw new QuranException(ResourceManager.getInstance().getString("quran", "souraNumberError", [souraNumber]));
            }
        }

        private function getInternalAyaNumber( souraNumber : int, ayaNumber : int ) : int
        {
            var foundAyaNumber : int;
            var selectedSouraStartingAyaId : int = Soura(souraInfoById[souraNumber]).startingAyaId;

            var nextSouraStartingAyaId : int = souraNumber != QuranConstants.QURAN_SUWAR_NUMBER
                ? Soura(souraInfoById[souraNumber + 1]).startingAyaId : QuranConstants.QURAN_AYAT_NUMBER + 1;

            var currentSourLength : int = nextSouraStartingAyaId - selectedSouraStartingAyaId;
            if ( currentSourLength >= ayaNumber)
            {
                foundAyaNumber = selectedSouraStartingAyaId + ayaNumber - 1;
            }
            else
            {
                // TODO : add nonExisitingAya exception
                throw new QuranException(ResourceManager.getInstance().getString("quran", "ayaNumberError", [souraInfoById[souraNumber].name, currentSourLength, ayaNumber]));
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
            var souraConverter : SouraConverter = new SouraConverter();
            var result : Array = souraConverter.convertArray(event.target.getResult().data);

            _quran.souraIdByName = result[0];
            _quran.souraInfoById = result[1];

            souraConverter = null;
        }

        public function getAyaResultHandler( event : SQLEvent ) : void
        {
            // TODO : convert result to Aya
            dispatchEvent(new QuranEvent(getAyaConverter().convert(event.target.getResult().data[0]), QuranEvent.GET_AYA));
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
