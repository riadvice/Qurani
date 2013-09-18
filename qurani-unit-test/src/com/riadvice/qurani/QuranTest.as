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
package com.riadvice.qurani
{
    import flash.text.Font;

    import flexunit.framework.Assert;

    public class QuranTest
    {
        private var quran : Quran;
        private var basmalah : Aya;
        private var suwarLength : Array;

        [Before]
        public function setUp() : void
        {
            // Quran instance
            quran = new Quran();

            // Basmalah instance
            basmalah = new Aya();
            basmalah.imlai = "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ";
            basmalah.othmani = "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ";

            // Suwar length
            suwarLength = [7, 286, 200, 176, 120, 165, 206, 75, 129, 109, 123, 111, 43, 52, 99, 128, 111, 110, 98, 135, 112, 78, 118, 64, 77, 227, 93, 88, 69, 60, 34, 30, 73, 54, 45, 83, 182, 88, 75, 85, 54, 53, 89, 59, 37, 35, 38, 29, 18, 45, 60, 49, 62, 55, 78, 96, 29, 22, 24, 13, 14, 11, 11, 18, 12, 12, 30, 52, 52, 44, 28, 28, 20, 56, 40, 31, 50, 40, 46, 42, 29, 19, 36, 25, 22, 17, 19, 26, 30, 20, 15, 21, 11, 8, 8, 19, 5, 8, 8, 11, 11, 8, 3, 9, 5, 4, 7, 3, 6, 3, 5, 4, 5, 6];
        }

        [After]
        public function tearDown() : void
        {
            quran = null;
            basmalah = null;
        }

        [BeforeClass]
        public static function setUpBeforeClass() : void
        {
        }

        [AfterClass]
        public static function tearDownAfterClass() : void
        {
        }

        [Test]
        public function testGetAllAyat() : void
        {
            var allAyat : Array = quran.getAllAyat();
            Assert.assertTrue(allAyat.length > 0);
            Assert.assertEquals(allAyat.length, Quran.getAyatCount(), 6236);
        }

        [Test]
        public function testGetAya() : void
        {
            var aya : Aya;
            for (var s : int = 1; s <= QuranConstants.QURAN_SUWAR_NUMBER; s++)
            {
                for (var a : int = 1; a <= suwarLength[s - 1]; a++)
                {
                    aya = quran.getAya(s, a);
                    // Assert.assertEquals(aya.number);
                    Assert.assertTrue(aya.imlai.length > 0);
                    Assert.assertTrue(aya.othmani.length > 0);
                }
            }
        }

        [Test]
        public function testGetAyatCount() : void
        {
            Assert.assertEquals(Quran.getAyatCount(), 6236);
        }

        [Test]
        public function testGetBasmalah() : void
        {
            var result : Aya = quran.getBasmalah();
            Assert.assertEquals(result.imlai, basmalah.imlai);
            // We truncate the aya number from basmalah
            Assert.assertEquals(result.othmani, basmalah.othmani);
        }

        [Test]
        public function testGetHizb() : void
        {
            var hizb : Hizb;
            for (var i : int = 1; i <= QuranConstants.QURAN_HIZB_NUMBER; i++)
            {
                hizb = quran.getHizb(i);
                Assert.assertEquals(hizb.markers.length, 4);
            }
        }

        [Test]
        public function testGetPage() : void
        {
            var page : Page;
            for (var i : int = 1; i <= QuranConstants.QURAN_PAGE_NUMBER; i++)
            {
                page = quran.getPage(i);
                Assert.assertEquals(page.number, i);
                Assert.assertTrue(page.ayat.length > 0);
                Assert.assertTrue(page.startSura > 0);
                Assert.assertTrue(page.startAya > 0);
            }
        }

        [Test]
        public function testGetSura() : void
        {
            var sura : Sura;
            for (var i : int = 1; i <= QuranConstants.QURAN_SUWAR_NUMBER; i++)
            {
                sura = quran.getSura(i);
                validateSura(sura);
                Assert.assertEquals(sura.orderInMushaf, i);
            }
        }

        [Test]
        public function testGetSuraByName() : void
        {
            var sura : Sura;
            var suwarNames : Array = quran.getSuwarNames();
            Assert.assertEquals(suwarNames.length, QuranConstants.QURAN_SUWAR_NUMBER);

            for (var i : int = 0; i < suwarNames.length; i++)
            {
                sura = quran.getSuraByName(suwarNames[i]);
                validateSura(sura);
            }
        }

        [Test]
        public function testGetSuraLength() : void
        {
            for (var i : int = 1; i <= QuranConstants.QURAN_SUWAR_NUMBER; i++)
            {
                Assert.assertEquals(quran.getSuraLength(i), suwarLength[i - 1])
            }
        }

        [Test]
        public function testGetSuwarCount() : void
        {
            Assert.assertEquals(quran.getSuwarNames().length, Quran.getSuwarCount(), QuranConstants.QURAN_SUWAR_NUMBER);
        }

        [Test]
        public function testGetSuwarNames() : void
        {
            Assert.assertEquals(quran.getSuwarNames().length, QuranConstants.QURAN_SUWAR_NUMBER);
        }

        [Test]
        public function testUthmanicHafsFont() : void
        {
            var uthmanicHafsFont : Font = Font.enumerateFonts(false)[0];
            Assert.assertEquals(uthmanicHafsFont.fontName, "UthmanicHafs");
            Assert.assertEquals(uthmanicHafsFont.fontStyle, "regular");
            Assert.assertEquals(uthmanicHafsFont.fontType, "embeddedCFF");

            var includedChars : String = "";
            var i : int;
            for (i = 48; i <= 57; i++)
            {
                includedChars += String.fromCharCode(i);
            }
            for (i = 1552; i <= 1557; i++)
            {
                includedChars += String.fromCharCode(i);
            }
            for (i = 1569; i <= 1594; i++)
            {
                includedChars += String.fromCharCode(i);
            }
            for (i = 1600; i <= 1630; i++)
            {
                includedChars += String.fromCharCode(i);
            }
            for (i = 1632; i <= 1641; i++)
            {
                includedChars += String.fromCharCode(i);
            }
            for (i = 1646; i <= 1646; i++)
            {
                includedChars += String.fromCharCode(i);
            }
            for (i = 1648; i <= 1649; i++)
            {
                includedChars += String.fromCharCode(i);
            }
            for (i = 1750; i <= 1773; i++)
            {
                includedChars += String.fromCharCode(i);
            }
            Assert.assertTrue(uthmanicHafsFont.hasGlyphs(includedChars));
        }

        private function validateSura( sura : Sura ) : void
        {
            Assert.assertEquals(sura.ayat.length, suwarLength[sura.orderInMushaf - 1]);
            if (sura.orderInMushaf != 1 && sura.orderInMushaf != 9)
            {
                Assert.assertEquals(sura.basmalah.imlai, basmalah.imlai);
                Assert.assertEquals(sura.basmalah.othmani, basmalah.othmani);
            }
        }

    }
}
