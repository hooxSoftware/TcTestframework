#
# VisualStudio.ps1
#
$dte = new-object -com "VisualStudio.DTE.12.0"

$dte.MainWindow.Visible = $true

$tool = $null

foreach ($win in $dte.Windows)
{
	Write-Host "Window : "
	$win.ToString()
}

if  ($tool -eq $null)
{
	Write-Host "Bההההההh"
}

# $dte.OpenFile("Z:\1000_Internes\1000_Testframework\Beispiel\Beckhoff\UnitTestSample\UnitTestSample.sln")

