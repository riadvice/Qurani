package org.lionart.qurani
{
    import flash.data.SQLConnection;
    import flash.data.SQLStatement;
    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;
    import flash.utils.ByteArray;

    [ExcludeClass]
    public class QuranHelper
    {
        [Embed(source = "/../resources/dba/quran.db", mimeType = "application/octet-stream")]
        private static var quranDatabase : Class;

        private static var connection : SQLConnection;

        public static function getConnection() : SQLConnection
        {
            if (!connection)
            {
                connection = new SQLConnection();
                // We will save the database in the temporary file
                // because the open method of SQLConnection can accept a File type only
                var file : File = File.createTempFile();
                var fileStream : FileStream = new FileStream();
                var byteArray : ByteArray = new quranDatabase();
                fileStream.open(file, FileMode.WRITE);
                fileStream.writeBytes(byteArray);
                fileStream.close();
                connection.open(file);
            }
            return connection
        }
        
        public static function constructStatement( query : String ) : SQLStatement
        {
            var statement : SQLStatement = new SQLStatement();
            statement.sqlConnection = getConnection();
            statement.text = query;
            return statement;
        }
    }
}
