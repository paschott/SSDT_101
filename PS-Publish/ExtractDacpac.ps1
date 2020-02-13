#Adapted from https://github.com/RichieBzzzt/PoshSSDTBuildDeploy/

.\nuget install Microsoft.Data.Tools.MSBuild -x -o .\

$SSDTPath = $PSScriptRoot
$SSDTPath_DAC = Join-Path $SSDTPath "\Microsoft.Data.Tools.Msbuild\lib\net46"

$ServerName = "localhost"
$DatabaseName = "AdventureWorks"
$TargetDacpac = $DatabaseName + ".dacpac"


$SQLpackageCmd = $SSDTPath_DAC + "\sqlpackage.exe /a:extract /ssn:" + $ServerName + " /sdn:" + $DatabaseName + " /tf:" + $TargetDacpac


Invoke-Expression $SQLpackageCmd
