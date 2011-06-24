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
    
    import org.lionart.qurani.events.QuranEvent;
    import org.lionart.qurani.exceptions.QuranException;

    [Event(name="getAya", type="org.lionart.qurani.events.QuranEvent")]
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
                QuranHelper.executeQuery( Queries.GET_SUWAR_INFO, onSuwarQueryResult );
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
            QuranHelper.executeQuery( Queries.GET_AYA_SQL, getAyaResultHandler, [":ayaId",":ayatLength"], [1,1]);
        }
        
        private function validateSura( souraNumber : int ) : void
        {
            if ( souraNumber < 1 || souraNumber > 114 )
            {
                throw new QuranException();
            }
        }
        
        public function getAyaResultHandler( event : SQLEvent ) : void
        {
            // TODO : convert result to Aya
            dispatchEvent( new QuranEvent(null, QuranEvent.GET_AYA) );
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
        private static function onSuwarQueryResult(event:SQLEvent):void
        {
            var resultObj : Object;
            var soura : Soura;
            for each( resultObj in event.target.getResult().data )
            {
                soura = new Soura();
                soura.orderInMushaf = resultObj.rowid;
                soura.makkia = resultObj.makki;
                soura.name = resultObj.soura_name;
                _quran.souraIdByName[soura.name] = soura;
                _quran.souraInfoById[soura.orderInMushaf] = soura;
                // TODO : to add later other_names, comment
            }
        }

    }
}
