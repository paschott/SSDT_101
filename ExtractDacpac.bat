REM https://docs.microsoft.com/en-us/sql/tools/sqlpackage?view=sql-server-ver15#help-for-the-extract-action

sqlpackage.exe /a:extract /SourceDatabaseName:AdventureWorks2012 /SourceServerName:localhost /TargetFile:.\AdventureWorks2012.dacpac