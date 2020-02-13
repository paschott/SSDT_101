Import-Module dbatools

#Extract a dacpac using the dbatools function
#Can pass in multiple databases instead of just one using 'db1','db2','db3' ...

Export-DbaDacPackage -SqlInstance localhost -Database AdventureWorks2012 -Path c:\DacPacs
