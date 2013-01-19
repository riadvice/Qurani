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
package com.alkiteb.qurani
{

    [ExcludeClass]
    public final class QuranConstants
    {

        [Embed(source = "/../resources/fonts/UthmanicHafs1 Ver09.otf",
            fontName = "UthmanicHafs",
            mimeType = "application/x-font-truetype",
            unicodeRange = "U+0030-0039,U+0610-0615,U+0621-063A,U+0640-065E,U+0660-0669,U+066E,U+0670-0671,U+06D6-06ED")]
        private static const uthmanHafsFont : Class;

        public static const QURAN_SUWAR_NUMBER : int = 114;
        public static const QURAN_AYAT_NUMBER : int = 6236;
        public static const QURAN_PAGE_NUMBER : int = 604;
        public static const QURAN_HIZB_NUMBER : int = 60;
    }
}
