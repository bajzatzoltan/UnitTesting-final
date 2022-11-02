param 
(
   [string] $scriptDirectory,
   [string] $server,
   [string] $database,
   [string] $userName,
   [string] $password
)

IF (!(Get-Module -Name sqlps))
    {
        Write-Host 'Loading SQLPS Module' -ForegroundColor Blue
        Push-Location
        Import-Module sqlps -DisableNameChecking
        Pop-Location
    }

$scriptPath  = $MyInvocation.MyCommand.Path
$scriptPath = $scriptPath.Substring(0, $scriptPath.LastIndexOf('\')+1)
$localScriptRoot =  $scriptPath + $scriptDirectory +"\"
$scripts = Get-ChildItem $localScriptRoot | Where-Object {$_.Extension -eq ".sql"}


if ([string]::IsNullOrWhitespace($userName) -or [string]::IsNullOrWhitespace($password))
{
    foreach ($s in $scripts)
    {
        Write-Host "Test file: " $s.Name -BackgroundColor White -ForegroundColor Black
        $script = $s.FullName
        Invoke-Sqlcmd -ServerInstance $server -Database $database -InputFile $script
    }
}
else 
{
    foreach ($s in $scripts)
    {
        Write-Host "Test file: " $s.Name -BackgroundColor White -ForegroundColor Black
        $script = $s.FullName
        Invoke-Sqlcmd -ServerInstance $server -Database $database -Username $userName -password $password -InputFile $script
    }
}



