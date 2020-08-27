


$Invocation = (Get-Variable MyInvocation -Scope 0).Value
$WorkDir = Split-Path -Parent $Invocation.MyCommand.Path

$WorkDir = "$Workdir\XML"

Push-Location $WorkDir

[xml]$xmlInfo   = Get-Content Info.xml
[xml]$xmlResult = Get-Content Coverage.xml



$PouList = $xmlInfo.Info.POU

foreach($Pou in $PouList)
{
    $PouName  = $Pou.Name
    $PouId    = $Pou.Id
    $PouCount = $Pou.Count

	Write-Host "Found $PouId : $PouName"
}


$PouList = $xmlResult.Result.POU

foreach($Pou in $PouList)
{
    $PouId    = $Pou.Id

	Write-Host "Found Result for Id $PouId"
}