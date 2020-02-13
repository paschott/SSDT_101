REM https://docs.microsoft.com/en-us/sql/tools/sqlpackage?view=sql-server-ver15#help-for-the-extract-action

REM Would be able to run this from the same folder as the project to reference the relative paths.
REM Adjust for appropriate paths for your project

sqlpackage.exe /a:publish /sf:.\sql\Local\Adventureworks2008.dacpac /pr:.\Publish\Local.publish.xml