/*
   Copyright (C) 2011-2013 Ghazi Triki <ghazi.nocturne@gmail.com>

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
package com.alkiteb.qurani.converters
{
    import com.alkiteb.qurani.Aya;

    public class AyaConverter
    {
        public function convert( sqlResult : Object ) : Aya
        {
            var aya : Aya = new Aya();
            aya.imlai = sqlResult.imlai;
            aya.othmani = sqlResult.othmani;
            return aya;
        }

        public function convertArray( sqlResult : Array ) : Array
        {
            var resultArray : Array = [];
            var ayaObj : Object;
            for each (ayaObj in sqlResult)
            {
                resultArray.push(convert(ayaObj));
            }
            return resultArray;
        }
    }
}
