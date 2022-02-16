param 
(
   [string] $scriptDirectory,
   [string] $server,
   [string] $database
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

foreach ($s in $scripts)
    {
        Write-Host "Test file: " $s.Name -BackgroundColor White -ForegroundColor Black
        $script = $s.FullName
        Invoke-Sqlcmd -ServerInstance $server -Database $database -InputFile $script
    }
