
# Remove-Item -Path "C:\Users\patrickdressel\Documents\result.xml" -Force

Push-Location "C:\Users\patrickdressel\Documents" 

[xml]$xmlInfo    = Get-Content Info.xml
[xml]$xmlTestRun = Get-Content Coverage.xml

$PouInfoMap = @{}
$PouMethodMap = @{}
$PouResultMap = @{}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
# Einlesen der Daten aus der Instrumentierung
# vor dem Testlauf
#
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$PouList = $xmlInfo.Info.POU

foreach($Pou in $PouList)
{
	Write-Host "Found $PouId : $PouName"

    $PouMethodMap = @{}
    $LineInfo = @()

    # Zeilen der möglichen Methoden/Actions...
    foreach($Method in $Pou.Method)
    {
        foreach($Line in $Method.Line)
        {
            $LineInfo += ,( @($Line.Nb, $Line.Branch))
        } 
        $PouMethodMap.Add($Method.Name, $LineInfo)
    }

    # Alles zusammen zur Baustein Id
    $PouInfoMap.Add($Pou.Id, @($Pou.Name, $Pou.Path, $PouMethodMap))	
}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
# Einlesen der tatsächlichen Ergebnisse aus dem
# Testlauf
#
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$PouList = $xmlTestRun.Result.POU

foreach($Pou in $PouList)
{
    $PouId    = $Pou.Id
    $LineNb   = 0
    $LineCnt  = 0

	Write-Host "Found Result for Id $PouId"

    $LineInfo = @()

    foreach($Line in $Pou.Line)
    {
        $LineInfo += ,( @($Line.Nb, $Line.Count) )
    }

    $PouResultMap.Add($PouId, $LineInfo)
}