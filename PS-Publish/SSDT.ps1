#Using specific versions to ensure that the paths are correct below without needing to find them
.\nuget install Microsoft.Data.Tools.MSBuild -version 10.0.61710.120
.\nuget install PoshSSDTBuildDeploy -version 2.0.215

Import-Module .\PoshSSDTBuildDeploy.2.0.215\PoshSSDTBuildDeploy.psm1


#Set variables for local paths and files
$DBDeploy = $PSScriptRoot
$DBDeploy_DAC = Join-Path $DBDeploy "\Microsoft.Data.Tools.Msbuild.10.0.61710.120\lib\net46"
$DBDeploy_DACFX = Join-Path $DBDeploy_DAC "\Microsoft.SqlServer.Dac.dll"



###############################################################################
#                                                                             #
# Important!  Need to install MS Build and Local DB before building will work #
#                                                                             #
# These require elevated privileges so should be run separately.              #
#                                                                             #
#                                                                             #
# Install-LocalDB2016                                                         #
# Install-VSBuildTools2017                                                    #
#                                                                             #
#  May have to just use the above to download binaries and install manually.  #
#                                                                             #
# See https://github.com/RichieBzzzt/PoshSSDTBuildDeploy for more details.    #
###############################################################################


#AdventureWorks Project Folder - used for building
#In this case the Publish binaries are stored in the same folder as all of the DB Project files
#e.g., AdventureWorks is at the same level as this "PS-Publish" folder
#Adjust accordingly for your environment
$DBProjectFolder = Join-Path (Split-Path($DBDeploy) -Parent) "\AdventureWorks"
$DBProjectFile = Join-Path $DBProjectFolder "\AdventureWorks.sqlproj"



#The following will build the SQL Project in its default build folder, e.g. "bin\debug"
#Will need to point your Dacpac and Publish variables to those if on a build server
Install-MicrosoftDataToolsMSBuild -WorkingFolder $DBDeploy
Invoke-MsBuildSSDT -DatabaseSolutionFilePath $DBProjectFile -DataToolsFilePath $DBDeploy_DAC


#These will vary based on your project/publish file names
#This demo assumes the files have been copied to this folder
#We'd use this if providing dacpacs to a client
$DBDeploy_DACPAC = Join-Path $DBDeploy '.\AdventureWorks.dacpac'
$DBDeploy_PUB = Join-Path $DBDeploy '.\Local.publish.xml'



#Required - can use https://www.connectionstrings.com/ if you need help
$ConnectionString = "Data Source=localhost;Integrated Security=True;Persist Security Info=False;Pooling=False;MultipleActiveResultSets=False;Connect Timeout=60;Encrypt=False;TrustServerCertificate=True"

#Generate Deployment Script and Report - useful for reviewing the pending changes
Publish-DatabaseDeployment -dacfxPath $DBDeploy_DACFX -dacpac '.\AdventureWorks.dacpac' -publishXml '.\Local.publish.xml' -GenerateDeploymentScript $true -GenerateDeploymentReport $false -ScriptOnly $True -ScriptPath $PSScriptRoot -targetDatabaseName AdventureWorks -targetConnectionString $ConnectionString
Publish-DatabaseDeployment -dacfxPath $DBDeploy_DACFX -dacpac '.\AdventureWorks.dacpac' -publishXml '.\Local.publish.xml' -GenerateDeploymentScript $false -GenerateDeploymentReport $True -ScriptOnly $True -ScriptPath $PSScriptRoot -targetDatabaseName AdventureWorks -targetConnectionString $ConnectionString


#Deploy changes to server
#Publish-DatabaseDeployment -dacfxPath $DBDeploy_DACFX -dacpac '.\AdventureWorks.dacpac' -publishXml '.\Local.publish.xml' -GenerateDeploymentScript $false -GenerateDeploymentReport $false -targetDatabaseName AdventureWorks -targetConnectionString $ConnectionString -ScriptPath $PSScriptRoot
