#Adapted from https://github.com/RichieBzzzt/PoshSSDTBuildDeploy/

.\nuget install Microsoft.Data.Tools.MSBuild -version 10.0.61710.120

$SSDTPath = $PSScriptRoot
$SSDTPath_DAC = Join-Path $SSDTPath "\Microsoft.Data.Tools.Msbuild.10.0.61710.120\lib\net46"

$ServerName = "localhost"
$DatabaseName = "AdventureWorks"
$TargetDacpac = $DatabaseName + ".dacpac"


$SQLpackageCmd = $SSDTPath_DAC + "\sqlpackage.exe /a:extract /ssn:" + $ServerName + " /sdn:" + $DatabaseName + " /tf:" + $TargetDacpac


Invoke-Expression $SQLpackageCmd
