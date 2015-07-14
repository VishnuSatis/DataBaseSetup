@echo off

CD ..\
SET ROOT_FOLDER_PATH=%CD%
SET SERVERS_FOLDER_NAME=%ROOT_FOLDER_PATH%\public

SET PGHOME=%ROOT_FOLDER_PATH%\public\pgsql
SET PGDATA=%PGHOME%\data
SET PGBIN=%PGHOME%\bin
SET PGDATABASE=postgres
SET PGUSER=postgres
SET PGPORT=5439
SET PGLOCALEDIR=%PGHOME%\share\locale
SET DBSCRIPTS_HOME=%ROOT_FOLDER_PATH%\scripts\DBScripts
SET SQL_INITDB_SCRIPT_FILE_NAME=INITDBSCRIPT.sql
SET POSTGRES_FOLDER_PATH=%SERVERS_FOLDER_NAME%\pgsql\
SET POSTGRES_ZIP_NAME=postgresql-9.4.4-win64.zip
SET POSTGRES=postgres
SET PG_LOG_FILE_NAME=pg_log.log

ECHO %POSTGRES_FOLDER_PATH%
IF NOT EXIST "%POSTGRES_FOLDER_PATH%" (
	echo %POSTGRES% NOT FOUND so extracting it
	echo %SERVERS_FOLDER_NAME%\%POSTGRES_ZIP_NAME%
	echo %SERVERS_FOLDER_NAME%
	call "%ProgramFiles%\7-Zip\7z" x "%SERVERS_FOLDER_NAME%\%POSTGRES_ZIP_NAME%" -o"%SERVERS_FOLDER_NAME%\"
) ELSE (
	REM stopping the postgres service
	"%PGBIN%\pg_ctl" -D "%PGDATA%" stop -m fast -w
	REM removing the database related folders if exists
)

REM do this only if you dont want to preserve Db
call "%PGBIN%\initdb" -U postgres -A trust -E UTF8

call "%PGBIN%\pg_ctl" -D "%PGDATA%" -l "%PGHOME%\%PG_LOG_FILE_NAME%" start -w
call "%PGBIN%\psql" -h localhost -p 5439 -U postgres -f "%DBSCRIPTS_HOME%\%SQL_INITDB_SCRIPT_FILE_NAME%"
echo.
pause
echo.