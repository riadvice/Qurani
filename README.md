# Qurani AIR API

Furqan is a Quran API for Adobe AIR.

The library contains an embedded SQLite Holy Quran database. The database itself contains uthmanic text and imlai
text.

Uthmanic text uses Uhtmanic HAFS official font from King Fahd Glorious Quran Printing Complex.

## Why this API is only for AIR and not for Flex ?

The anwser to this question is detaild in two points :

* The library contains an embedded SQLite databse. SQLite databases are available only for Adobe AIR Runtime.
* Flex do not handle arabic text direction when it is loaded from an XML file, so the text is inverted.

## Using Qurani AIR API

Simple create an instance of *Quran* class

quran = new Quran();

#### getSuwarCount()

quran.getSuwarCount() : Returns the number of Sura in Quran => 114

#### getAyatCount()

quran.getAyatCount() : Returns the number of Ayat in Quran => 6236

#### getBasmalah()

quran.getBasmalah() : Returns an Aya instance containing the Basmalah.

#### getAya( suraNumber : int, ayaNumber : int ) 

quran.getAya( 1, 1 ) : Returns an Aya by specifying its sura number and its number.

#### getAllAyat()

quran.getAllAyat() : Returns an array containign all Ayat of Quran.

#### getSura(suraNumber : int)

quran.getSura(1) : Returns a Sura and all its Aya.

#### getSuraByName(suraName : String)

quran.getSuraByName("الفاتحة") : Returns a Sura and all its Aya.

#### getSuwarNames()

quran.getSuwarNames() : Retursn an array containing names of all Surat in Arabic.
