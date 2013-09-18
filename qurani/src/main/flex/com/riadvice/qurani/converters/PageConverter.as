/*
   Copyright (C) 2011-2013 RIADVICE <ghazi.triki@riadvice.tn>

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
package com.riadvice.qurani.converters
{
    import com.riadvice.qurani.Page;

    public class PageConverter
    {
        public function convert( sqlResult : Object ) : Page
        {
            var page : Page = new Page();
            page.number = sqlResult.id;
            page.startSura = sqlResult.sura;
            page.startAya = sqlResult.aya;
            return page;
        }
    }
}
