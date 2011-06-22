package org.lionart.qurani
{
    import flash.data.SQLConnection;

    [ExcludeClass]
    public class QuranConnection
    {
        [Embed(source="/../resources/dba/quran.db",mimeType="application/octet-stream")]
        private static var quranDatabase: Class;
        
        private static var connection : SQLConnection;
        
        private static function getConnection() : SQLConnection
        {
            if ( !connection )
            {
                connection = new SQLConnection();
                connection.open(quranDatabase);
            }
            return connection
        }
    }
}