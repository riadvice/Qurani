package com.alkiteb.qurani
{
    import flexunit.framework.Assert;
    
    public class QuranTest
    {		
        private var quran : Quran;
        private var basmalah : Aya;
        
        [Before]
        public function setUp():void
        {
            // Quran instance
            quran = new Quran();
            
            // Basmalah instance
            basmalah = new Aya();
            basmalah.imlai = "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ";
            basmalah.othmani = "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ ١";
        }
        
        [After]
        public function tearDown():void
        {
            quran = null;
            basmalah = null;
        }
        
        [BeforeClass]
        public static function setUpBeforeClass():void
        {
        }
        
        [AfterClass]
        public static function tearDownAfterClass():void
        {
        }
        
        [Test]
        public function testGetAllAyat():void
        {
            Assert.fail("Test method Not yet implemented");
        }
        
        [Test]
        public function testGetAya():void
        {
            Assert.fail("Test method Not yet implemented");
        }
        
        [Test]
        public function testGetAyatCount():void
        {
            Assert.fail("Test method Not yet implemented");
        }
        
        [Test]
        public function testGetBasmalah():void
        {
            var result : Aya = quran.getBasmalah();
            Assert.assertEquals(result.imlai, basmalah.imlai);
            Assert.assertEquals(result.othmani, basmalah.othmani);
        }
        
        [Test]
        public function testGetHizb():void
        {
            Assert.fail("Test method Not yet implemented");
        }
        
        [Test]
        public function testGetPage():void
        {
            Assert.fail("Test method Not yet implemented");
        }
        
        [Test]
        public function testGetSura():void
        {
            Assert.fail("Test method Not yet implemented");
        }
        
        [Test]
        public function testGetSuraByName():void
        {
            Assert.fail("Test method Not yet implemented");
        }
        
        [Test]
        public function testGetSuraLength():void
        {
            Assert.fail("Test method Not yet implemented");
        }
        
        [Test]
        public function testGetSuwarCount():void
        {
            Assert.fail("Test method Not yet implemented");
        }
        
        [Test]
        public function testGetSuwarNames():void
        {
            Assert.fail("Test method Not yet implemented");
        }
        
    }
}