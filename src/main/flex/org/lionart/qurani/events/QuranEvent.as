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
package org.lionart.qurani.events
{
    import flash.events.Event;

    /**
     *
     * @author Ghazi Triki
     *
     */
    public class QuranEvent extends Event
    {
        public static const GET_AYA : String = "getAya";
        public static const GET_ALL_AYAT : String = "getAllAyat";
        public static const GET_SURA : String = "getSura";

        private var _result : Object;

        /**
         *
         * @param type
         * @param bubbles
         * @param cancelable
         *
         */
        public function QuranEvent( result : Object, type : String, bubbles : Boolean = false, cancelable : Boolean = false )
        {
            _result = result;
            super(type, bubbles, cancelable);
        }

        public function get result() : Object
        {
            return _result;
        }

        /**
         *
         * @inheritDoc
         *
         */
        override public function clone() : Event
        {
            return new QuranEvent(result, type, bubbles, cancelable);
        }
    }
}
