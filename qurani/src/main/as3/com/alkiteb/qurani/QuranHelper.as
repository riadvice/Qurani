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
    import flash.data.SQLConnection;
    import flash.data.SQLMode;
    import flash.data.SQLStatement;
    import flash.events.Event;
    import flash.events.SQLEvent;
    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;
    import flash.utils.ByteArray;

    // import mx.core.FlexGlobals;

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
         * This string contains the name of the temporary database file.
         */
        private static var dbFileName : String;

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
                addCloseListenerToMainApp(file.nativePath);
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
            if (!statement)
            {
                statement = new SQLStatement();
                statement.sqlConnection = getConnection();
            }
            else
            {
                statement.clearParameters();
                statement.removeEventListener(SQLEvent.RESULT, oldResultHandler);
            }
            fillParameters(statement, paramNames, params);
            statement.text = query;
            statement.addEventListener(SQLEvent.RESULT, resultHandler);
            oldResultHandler = resultHandler;
            statement.execute();
        }

        /**
         * Fills in a statement with parameters using an Array of names and an Array of values
         * @param statement SQLStatement to fill in with parameters
         * @param paramNames An array containing the name of parameters
         * @param params An Array containing the value of parameters to add
         *
         */
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

        /**
         * Adds an event listener to the main application for the "closing" event.
         * @param tempDbFileName The temorary database file name
         *
         */
        private static function addCloseListenerToMainApp( tempDbFileName : String ) : void
        {
            dbFileName = tempDbFileName;
            //FlexGlobals.topLevelApplication.addEventListener(Event.CLOSING, mainAppClosingHandler);
        }

        /**
         * Removes the event listener for "closing" event from the main application
         * then deletes the temporary database file.
         * @param event
         *
         */
        private static function mainAppClosingHandler( event : Event ) : void
        {
            //FlexGlobals.topLevelApplication.removeEventListener(Event.CLOSING, mainAppClosingHandler);
            connection.close();
            new File(dbFileName).deleteFile();
        }
    }
}
