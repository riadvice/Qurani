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
    import flash.data.SQLStatement;
    import flash.events.SQLEvent;
    import flash.utils.Dictionary;
    
    import mx.controls.Alert;

    public class Quran
    {

        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------
        
        [Bindable]
        public static var basmalah : Aya;

        private static var _quran : Quran;

        private var connection : SQLConnection;
        
        private var souraIdByName : Dictionary; 
        
        private var souraInfoById : Dictionary; 

        //--------------------------------------------------------------------------
        //
        //  Singleton accessor
        //
        //--------------------------------------------------------------------------
        
        public static function getInstance() : Quran
        {
            if (_quran == null)
            {
                _quran = new Quran();
                _quran.souraIdByName = new Dictionary(true);
                _quran.souraInfoById = new Dictionary(true);
                _quran.connection = QuranHelper.getConnection();
                var suwarQuery : SQLStatement = QuranHelper.constructStatement( Queries.GET_SUWAR_INFO );
                suwarQuery.addEventListener( SQLEvent.RESULT, suwarQueryOnResult);
                suwarQuery.execute();
            }
            return _quran;
        }

        //--------------------------------------------------------------------------
        //
        //  Events handlers
        //
        //--------------------------------------------------------------------------
        private static function suwarQueryOnResult(event:SQLEvent):void
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
