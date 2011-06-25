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
package org.lionart.qurani
{
    import flash.data.SQLConnection;
    import flash.data.SQLMode;
    import flash.data.SQLStatement;
    import flash.events.SQLEvent;
    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;
    import flash.utils.ByteArray;

    [ExcludeClass]
    /**
     *
     * @author Ghazi Triki
     *
     */
    public class QuranHelper
    {
        [Embed(source = "/../resources/dba/quran.db", mimeType = "application/octet-stream")]
        /**
         * Emdedd Quran SQLite database.
         */
        private static var quranDatabase : Class;

        /**
         * Quran database default connection.
         */
        private static var connection : SQLConnection;

        /**
         * Unique statement that will be used to execute queries.
         */
        private static var statement : SQLStatement;

        /**
         * The last result handler function is stored here in order
         * to be removed in the next call.
         */
        private static var oldResultHandler : Function;

        /**
         *
         * @return SQLConnection that opens the database.
         * This method does also copy the databse the temporary
         * folder to be corretly opened.
         *
         */
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
                connection.open(file, SQLMode.READ);
            }
            return connection
        }

        /**
         *
         * @param query Query string.
         * @param resultHandler The method that will handle result in Quran class.
         * @return SQLStatement containing query.
         *
         */
        public static function executeQuery( query : String, resultHandler : Function, paramNames : Array = null, params : Array = null ) : void
        {
            if (statement == null)
            {
                statement = new SQLStatement();
                statement.sqlConnection = getConnection();
            }
            if (oldResultHandler != null)
            {
                statement.removeEventListener(SQLEvent.RESULT, oldResultHandler);
            }
            fillParameters(statement, paramNames, params);
            statement.text = query;
            statement.addEventListener(SQLEvent.RESULT, resultHandler);
            oldResultHandler = resultHandler;
            statement.execute();
        }

        public static function fillParameters( statement : SQLStatement, paramNames : Array, params : Array ) : void
        {
            if (!paramNames || !params)
            {
                return;
            }

            for (var i : int = 0; i < paramNames.length; i++)
            {
                statement.parameters[paramNames[i]] = params[i];
            }
        }

        /**
         *
         * @return Returns true if the connection is in transaction.
         *
         */
        public static function inTransaction() : Boolean
        {
            return connection.inTransaction;
        }
    }
}
