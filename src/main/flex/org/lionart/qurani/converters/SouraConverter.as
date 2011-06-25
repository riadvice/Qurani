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
package org.lionart.qurani.converters
{

    import flash.utils.Dictionary;

    import org.lionart.qurani.Soura;
    import org.lionart.qurani.quran_internal;

    use namespace quran_internal;

    public class SouraConverter
    {
        public function convertArray( resultArray : Array ) : Array
        {
            var souraObj : Object;
            var soura : Soura;
            var souraIdByName : Dictionary = new Dictionary(true);
            var souraInfoById : Dictionary = new Dictionary(true);
            for each (souraObj in resultArray)
            {
                soura = new Soura();
                soura.orderInMushaf = souraObj.rowid;
                soura.makkia = souraObj.makki;
                soura.name = souraObj.sura_name;
                soura.startingAyaId = souraObj.starting_row;
                // TODO : add other_names and comment
                souraIdByName[soura.name] = soura;
                souraInfoById[soura.orderInMushaf] = soura;
            }
            return [souraIdByName, souraInfoById];
        }
    }
}
