.\nuget install Microsoft.Data.Tools.MSBuild -version 10.0.61710.120

$WWI = $PSScriptRoot
$WWI_DAC = Join-Path $WWI "\Microsoft.Data.Tools.Msbuild.10.0.61710.120\lib\net46"

$ServerName = "localhost"
$DatabaseName = "AdventureWorks"
$TargetDacpac = $DatabaseName + ".dacpac"


$SQLpackageCmd = $WWI_DAC + "\sqlpackage.exe /a:extract /ssn:" + $ServerName + " /sdn:" + $DatabaseName + " /tf:" + $TargetDacpac


Invoke-Expression $SQLpackageCmd
