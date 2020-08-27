#
# CodeAnalysis.ps1
#
# eigenes Verzeichnis ermitteln

cls

$Invocation = (Get-Variable MyInvocation -Scope 0).Value
$ScriptDirectory  = Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $Invocation.MyCommand.Path))
$WorkDir = Split-Path -Parent $ScriptDirectory 
$HomeDir = Split-Path -Parent $WorkDir

$SourceDirectory = "Z:\1000_Internes\1000_Testframework\Beispiel\Beckhoff\UnitTestSample\UnitTestSample\Sample"
$SourceFilter    = "*.TcPOU"

[Int]$ExitCode = 0


$strLine = "-------------------------------------------------------------------"
# Auf der Suche nach xxxxx
# METHOD PUBLIC xxxxx :

# Wir suchen die Methode checkConditions 
$RexMethodBegin = '(?<=METHOD (PUBLIC|PROTECTED|INTERNAL|PRIVATE) )%Name(?= :)'
$RexMethodEnd   = '</Method>'

$RexImplBegin   = '<ST><!\[CDATA\[.*'
$RexImplEnd      = '\]\]></ST>'

$RexContent        = '(?s)(.*?)'

$RegExMethod           = "(?m)($RexMethodBegin)($RexContent)(?=($RexMethodEnd))"
$RegExImplementation   = "(?m)(?<=($RexImplBegin))($RexContent)(?=($RexImplEnd))"

$RegExCodeInParameter  = '(?m)VAR_INPUT\r?\n.*\r?\nEND_VAR'
$RegExCodeOutParameter = '(?m)VAR_OUTPUT\r?\n.*\r?\nEND_VAR'


# ----------------------------------------------------------------------------
# 
# Beginn des eigentlichen Skripts
# 
# ----------------------------------------------------------------------------
# Arbeitsverzeichnis umstellen
Push-Location $WorkDir 

Write-Host "Starte Code Check"

# ----------------------------------------------------------------------------
# 
# Auslesen aller Funktionsbausteine unter Source
# 
# ----------------------------------------------------------------------------
Get-ChildItem $SourceDirectory -Recurse -filter $SourceFilter | % {
				
	$strPath = Split-Path -Parent $_.fullname
	$strFile = Split-Path -Path $_.fullname -Leaf -Resolve

	Write-Host "`n$strFile"

	Test-Implementation $strPath $strFile $ExitCode

	if ($ExitCode -eq 0)
	{
		Write-Host "Analyse erfolgreich beendet"
	}
	else
	{
		Write-Host "Analyse abgebrochen"
	}
	
} 

# ----------------------------------------------------------------------------
# 
# Helferlein um einen Hash für einen String zu erzeugen
# 
# ----------------------------------------------------------------------------
#http://jongurgul.com/blog/get-stringhash-get-filehash/ 
Function Get-StringHash([String] $String,$HashName = "MD5") 
{ 
$StringBuilder = New-Object System.Text.StringBuilder 
[System.Security.Cryptography.HashAlgorithm]::Create($HashName).ComputeHash([System.Text.Encoding]::UTF8.GetBytes($String))|%{ 
[Void]$StringBuilder.Append($_.ToString("x2")) 
} 
$StringBuilder.ToString() 
}

# ----------------------------------------------------------------------------
# 
# Funktion zum Auslesen des Codes einer definierten Methode 
# 
# strFile : Datei in der die Methode enthalten ist
# strName : Bezeichnung der Methode
# ----------------------------------------------------------------------------
function Get-Method([string] $strFile, [string] $strName)
{

	$strSrcFile = $strFile				
    $Source  = "";

    $RegExMethod = $RegExMethod.Replace("%Name", $strName);

    try{				

    	$file    = Get-Content $strSrcFile

        Write-Host $strLine

		(Get-Content -Path $strSrcFile -Raw) | 
			Select-String $RegExMethod -AllMatches |
			%{ $_.Matches } |
			%{ 
                $Hash = Get-StringHash $_.Value "MD5" 
                $Source = $_.Value 
                }						

        Select-String -InputObject $Source -Pattern $RegExImplementation -AllMatches |
            %{ $_.Matches } |
			%{ $_.Value
                $Hash = Get-StringHash $_.Value "MD5" 
                Write-Host "`nHash = $Hash" 
                Write-Host $strLine
                }

    }
    catch
    {
	    Write-Host "Fehler bei Dateizugriff"
	    Write-Host $_.Exception.Message
	    $result = -1
    }
}

# ----------------------------------------------------------------------------
# 
# Funktion die den Quellcode einer bestimmten Datei prüfen soll 
# 
# strPath : Laufwerk und Ordnerstruktur zur Datei
# strFile : Dateiname
# result  : Ergebns der Prüfung 0 = Ok, -1 = Fehler
# ----------------------------------------------------------------------------
function Test-Implementation ([string] $strPath, [string] $strFile, [Int]$result)
{

	if(test-path $strPath -pathtype container)
	{
        Get-Method -strFile $strPath/$strFile -strName "checkConditions"
		$result = 0
	}
	else
	{
		Write-Host "Pfad $strPath nicht gefunden!"
		$result = -1
	}
	Write-Host "++++++++++++++++++++++++"

}

# ----------------------------------------------------------------------------
# 
# Hilfsfunktion zum benden des Skripts
# 
# ----------------------------------------------------------------------------
function ExitWithCode 
{ 
    param 
    ( 
        $InputCode
    ) 

    exit($InputCode)
} 

# Arbeitsverzeichnis wiederherstellen
Pop-Location

ExitWithCode ($ExitCode)

