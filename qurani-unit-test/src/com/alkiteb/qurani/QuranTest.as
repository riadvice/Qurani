package com.alkiteb.qurani
{
    import flexunit.framework.Assert;

    public class QuranTest
    {
        private const QURAN_SUWAR_NUMBER : int = 114;
        private const QURAN_AYAT_NUMBER : int = 6236;
        private const QURAN_PAGE_NUMBER : int = 604;
        private const QURAN_HIZB_NUMBER : int = 60;
        
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
            basmalah.othmani = "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ ١";
            
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
            for ( var s : int = 1; s <= QURAN_SUWAR_NUMBER; s++ )
            {
                for ( var a : int = 1; a <= suwarLength[s-1]; a++ )
                {
                    aya = quran.getAya( s, a );
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
            Assert.assertEquals(result.othmani, basmalah.othmani);
        }

        [Test]
        public function testGetHizb() : void
        {
            Assert.fail("Test method Not yet implemented");
        }

        [Test]
        public function testGetPage() : void
        {
            Assert.fail("Test method Not yet implemented");
        }

        [Test]
        public function testGetSura() : void
        {
            Assert.fail("Test method Not yet implemented");
        }

        [Test]
        public function testGetSuraByName() : void
        {
            Assert.fail("Test method Not yet implemented");
        }

        [Test]
        public function testGetSuraLength() : void
        {
            for ( var i : int = 1; i <= QURAN_SUWAR_NUMBER; i++ )
            {
                Assert.assertEquals( quran.getSuraLength(i), suwarLength[i-1] )
            }
        }

        [Test]
        public function testGetSuwarCount() : void
        {
            Assert.assertEquals(quran.getSuwarNames().length, Quran.getSuwarCount(), QURAN_SUWAR_NUMBER);
        }

        [Test]
        public function testGetSuwarNames() : void
        {
            Assert.assertEquals(quran.getSuwarNames().length, QURAN_SUWAR_NUMBER);
            Assert.fail("Test method Not yet implemented");
        }

    }
}
