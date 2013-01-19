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

    [ExcludeClass]
    public class Queries
    {
        public static const GET_AYA_SQL : String = "SELECT othmani, imlai FROM Quran WHERE id >= :ayaId ORDER BY id LIMIT :ayatLength";
        public static const GET_SUWAR_INFO : String = "SELECT rowid, sura_name, other_names, makki, starting_row, comment FROM SuraInfo ORDER BY rowid";
        public static const GET_PAGE : String = "SELECT id, sura, aya FROM Page where id = :pageId";
        public static const GET_HIZB : String = "SELECT sura, aya FROM Tahzeeb limit :hizbStartIndex,4";
    }
}
