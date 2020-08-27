

param(

    [Parameter(Mandatory=$True)]
    [ValidateLength(5,500)]
	[string]$Path = $null,
    [Parameter(Mandatory=$True)]
    [ValidateLength(5,500)]
    [string]$File = $null

)

if ($Path -eq $null) 
{
    Write-Host "Ungültiger Pfad (NULL)!"
    Exit -1
}
if ($File -eq $null) 
{
    Write-Host "Ungültige Datei (NULL)!"
	Exit -1
}

if ($File.EndsWith(".sln") -eq $false)
{
    $File = $File+".sln"
}

# ------------------------------------------------------------------------------
# Hilfsfunktion für Visualstudio
# ------------------------------------------------------------------------------
function Get-VsVersion
{
    $VsVersions = @("10.0", "11.0", "12.0", "14.0")
    
    foreach ($version in $VsVersions | Sort-Object -Descending)
    {
        If (Test-Path "C:\Program Files (x86)\Microsoft Visual Studio $version")
        {
            $VsVersion = "VisualStudio.DTE.$version"
            break
        }
    }

    if ($VsVersion -eq $null)
    {
        Write-Output "Versionsabfrage von Visual Studio fehlgeschlagen"
        exit -1
    }
    else
    {
        return $VsVersion
    }

}

Import-Module C:\TwinCAT\AdsApi\Powershell\TcXaeMgmt\TcXaeMgmt.psd1

$TcVersion = Get-TcVersion

$VisualStudio = $null

$WorkDir = $Path

Write-Host "Baue Projekt unter $WorkDir"

Push-Location $WorkDir 

$VsVersion = Get-VsVersion
$VisualStudio = new-object -com $VsVersion

$VisualStudio.SuppressUI = $true
$VisualStudio.MainWindow.Visible = $true
$solution = $VisualStudio.Solution
$solution.open("$Path\$File")
$sysManager = $project.Object

#$solution.solutionBuild.Clean($true)

$solution.solutionBuild.Build($true)

$solution.close();

$VisualStudio.Quit()



Pop-Location
