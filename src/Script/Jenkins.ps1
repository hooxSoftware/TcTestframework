#
# Jenkins.ps1
#
Import-Module C:\TwinCAT\AdsApi\Powershell\TcXaeMgmt\TcXaeMgmt.psd1


$NetId = "192.168.102.121.1.1"
$PortNumber = 851
$Variable = "PRG_UnitTestLib.i_bStart"
$Variable2 = "PRG_UnitTestLib.o_eState"

$TestReady = 0

$AdsRoute = Test-AdsRoute -NetId $NetId


if ($AdsRoute)
{
	
	Write-TcValue -Force -NetId $NetId `
						 -Port $PortNumber `
						 -Value $true `
						 -Path $Variable



    while ($TestReady -ne 7)
    {
        $TestReady = 
	    Read-TcValue -Force -NetId $NetId `
						     -Port $PortNumber `
						     -Path $Variable2        
    }


	Write-TcValue -Force -NetId $NetId `
						 -Port $PortNumber `
						 -Value $false `
						 -Path $Variable


								 
}	



$Destination = 'C:\Users\Jenkins\Documents\BuildServer\workspace\1000_CoverageTest\Coverage'
$Source1 = 'C:\Users\Administrator\Desktop\TestResult\Coverage.xml'
$Source2 = 'C:\Users\Administrator\Desktop\TestResult\Info.xml'
$Source3 = 'C:\Users\Administrator\Desktop\TestResult\UnitTest.xml'
$Temp1   = 'C:\Users\Jenkins\Documents\BuildServer\workspace\1000_CoverageTest\Coverage\Coverage.xml'
$Temp2   = 'C:\Users\Jenkins\Documents\BuildServer\workspace\1000_CoverageTest\Coverage\Info.xml'
$Temp3   = 'C:\Users\Jenkins\Documents\BuildServer\workspace\1000_CoverageTest\Coverage\unittestResult.xml'


Push-Location $Destination


try 
{

    Copy-AdsFile -Address CX-41C4F6 -Path $Source1 -Destination $Temp1 -Directory Generic -Force

    Copy-AdsFile -Address CX-41C4F6 -Path $Source2 -Destination $Temp2 -Directory Generic -Force

    Copy-AdsFile -Address CX-41C4F6 -Path $Source3 -Destination $Temp3 -Directory Generic -Force




}
catch
{
    $_.Exception.Message;
}

# $data = Get-Content -path Coverage/UnitTest.xml 
# Set-Content -Path Coverage/unittestResult.xml -Value $data