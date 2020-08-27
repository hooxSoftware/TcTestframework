#
# CodeCoverage.ps1
#
# eigenes Verzeichnis ermitteln

cls

$Invocation = (Get-Variable MyInvocation -Scope 0).Value
$WorkDir = Split-Path -Parent $Invocation.MyCommand.Path
$WorkDir = Split-Path -Parent $WorkDir

$strProject = "UnitTestSample"
$strTestfolder = "Testobject"

$strPrj = "$WorkDir\$strProject"
$strDst = "$WorkDir\$strTestfolder"
$SrcDir = "$strDst\$strProject\Sample\POUs"

Push-Location $WorkDir

[Int]$LineNumber = 0
[Int]$PouId = 0
[Int]$ExitCode = 0

$PouInfoMap = @{}
$MethodInfoMap = @{}


# Regex für den Hexadezimaldarstellung 16#xxx
$RegExHexCode   = '[0-9][0-9]#[0-9]*' 

# Regex für den Implementierungsteil
$RegExCodeBegin = '<ST><!\[CDATA\['
$RegExCodeEnd   = '\]\]></ST>'

# Regex für CASE Anweisungen
$RegExCaseBegin = 'CASE.*OF'
$RegExCaseClose = 'END_CASE'
$RegExCaseZahl = '[0-9]*\..[0-9]* *:'
$RegExCaseName = '(\w)?:(?!=) *'
$RegExCodeCASE  = "($RegExZahl|$RegExCaseName)"
# Regex für IF Abfragen
$RegExCodeThen  = "IF.*THEN"
# Regex für ELSE Zweig (Case und IF)
$RegExCodeELSE  = "ELSE"
# Vorlage für Coverage Call
$AddLineCovered    = "`n`tPRG_UnitTest.LineCovered(%id,%nb);`n"

$strLine = ""

# METHOD PUBLIC xxxxx :
$RegExMethodBegin = '<(METHOD|ACTION|TRANSITION|PROPERTY) Name="'
$RegExMethodName  = '(?s)(.*?)'
$RegExMethodEnd   = '" Id='
$RegExMethod      = "(?m)(?<=($RegExMethodBegin))($RegExMethodName)(?=($RegExMethodEnd))"


#+++++++++++++++++++++++++++++++++++++++++++++
# Ende des Skripts mit Fehlercode
#
#+++++++++++++++++++++++++++++++++++++++++++++
function ExitWithCode 
{ 
    param 
    ( 
        $InputCode
    ) 

    exit($InputCode)
} 


#+++++++++++++++++++++++++++++++++++++++++++++
# Funktion um Quellcode zu instrumentieren
#
#+++++++++++++++++++++++++++++++++++++++++++++
function Create-Coverage ([string] $strPath, [string] $strFile, [Int]$result)
{

	if(test-path $strPath -pathtype container)
	{
				
		try
		{				
			$strSrcFile = "$strPath\$strFile"
			$strDstFile = $strSrcFile.Replace(".TcPOU", "Exp.TcPOU")				

			$file = Get-Content $strSrcFile
			$newFile = ""
			# erster Methodenname = Bausteinname
			# danach werden die entsprechenden Methodennamen ermitteln
			# falls welche gefunden werden.
			$strMethodName = $strFile.Replace(".TcPOU","")

			# aktuelle Id des Quellcodes speichern
			$script:PouId++
			$strLineTemplate = $AddLineCovered.Replace("%id", $script:PouId)

			$MethodInfoMap = @{}
			$LineInfo = @()
			$LineNb = 1;
			$ValidCase = $false;

			# gehen wir mal auf die Suche 
			foreach ($line in $file)
			{		
				$LineNb++;		
				$strLine = $strLineTemplate.Replace("%nb", $LineNb)

				#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				# Unterfunktionen ermitteln
				#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				$line | 
				Select-String $RegExMethod -AllMatches |
					%{ $_.Matches } |
					%{ 
						# vorherige Methode speichern und Lineinfo zurücksetzen
						$MethodInfoMap.Add($strMethodName, $LineInfo)
						$LineInfo = @()
						$strMethodName = $_.Value 
					 }	
				
				#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				# Funktionsanfang
				#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				$strCase = Select-String -InputObject $line -Pattern $RegExCodeBegin 

				if($strCase)
				{
					$line = $line.Replace($strCase, "$strCase $strLine")
					$LineInfo += ,( @($LineNb, "false"))
				}
				
				#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				# Case Anweisungen
				#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				$strCase = Select-String -InputObject $line -Pattern $RegExCaseBegin
				if($strCase)
				{
					$ValidCase = $true
				}

				$strCase = Select-String -InputObject $line -Pattern $RegExCaseClose
				if($strCase)
				{
					$ValidCase = $false
				}

				$strCase = Select-String -InputObject $line -Pattern $RegExCodeCASE 
				if($strCase -and ($ValidCase -eq $true))
				{
					$line = $line.Replace($strCase, "$strCase $strLine")
					$LineInfo += ,( @($LineNb, "true"))
				}

				#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				# if Abfragen 
				#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				$strCase = Select-String -InputObject $line -Pattern $RegExCodeThen 

				if($strCase)
				{
					$line = $line.Replace($strCase, "$strCase $strLine")
					$LineInfo += ,( @($LineNb, "true"))
				}

				#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				# Else-Zweig 
				#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				$strCase = Select-String -InputObject $line -Pattern $RegExCodeElse

				if($strCase)
				{
					$line = $line.Replace($strCase, "$strCase $strLine")
					$LineInfo += ,( @($LineNb, "true"))
				}

				$newFile = $newFile + "$line`n"		
				
			}

			# falls die MethodenInfo hier noch nicht gespeichert wurde... speichern
			# passiert z.B. nach dem letzten Durchlauf.
			if($MethodInfoMap.contains($strMethodName) -eq $false)
			{
				$MethodInfoMap.Add($strMethodName, $LineInfo);
			}
				
			# geänderten Quellcode speichern
			Set-Content -Path $strSrcFile -Value $newFile
			# Daten für die spätere Info.xml speichern
			# - Id des Bausteins
			# - Name der Datei xxx.TcPou
			# - Pfad zur Datei
			# - Liste der Methoden und instrumentierten Zeilen
			$script:PouInfoMap.Add($script:PouId, @($strFile, $strSrcFile, $MethodInfoMap))	
				
		}
		catch
		{
			Write-Host "Fehler bei Dateizugriff"
			Write-Host $_.Exception.Message
			$result = -1
		}
		
	}
	else
	{
		Write-Host "Pfad $strPath nicht gefunden!"
		$result = -1
	}
	# Write-Host "++++++++++++++++++++++++"

}

# Arbeitsverzeichnis umstellen
Push-Location $WorkDir 

Write-Host "Starte Instrumentierung : $WorkDir"

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Alte Dateien Löschen
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$PathExist = Test-Path -Path $strDst

if ($PathExist)
{
	Write-Host "Entferne altes Verzeichnis"

	try
	{
		Remove-Item -Path $strDst -Recurse -Force
	}
	catch
	{
		Write-Host "Altes Verzeichnis kann nicht gelöscht werden"

		ExitWithCode(-2)
	}
}

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Erstelle Testobjekt
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Write-Host "Erstelle Testobjekt"

try
{
	# Testverzeichnis erstellen
	Copy-Item -Path $strPrj -Destination $strDst -Recurse -Force

	# Bausteine anpassen
	Get-ChildItem $SrcDir -Recurse -filter *.TcPOU | % {
				
		$strPath = Split-Path -Parent $_.fullname
		$strFile = Split-Path -Path $_.fullname -Leaf -Resolve

		# Write-Host "`n$strFile"

		Create-Coverage $strPath $strFile $ExitCode	
	}
		
}
catch
{
	Write-Host "Testobjekt kann nicht erstellt werden"

	ExitWithCode(-1)
}


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Info speichern
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Write-Host "Erstelle Info.xml"

#Remove-Item -Path "Info.xml" -Force

$InfoXml = New-Object System.Xml.XmlTextWriter("$WorkDir\Info.xml", $null)

$InfoXml.Formatting = "Indented"
$InfoXml.Indentation = 1
$InfoXml.IndentChar = "`t"

$InfoXml.WriteStartDocument()
$InfoXml.WriteStartElement("Info")

foreach ($Id in $script:PouInfoMap.Keys)
{
	$Data = $script:PouInfoMap[$Id]
	$strFile    = $Data[0]
	$strPath    = $Data[1] -split "Testobject\\"
	$MethodInfo = $Data[2]

	$InfoXml.WriteStartElement("POU")
	$InfoXml.WriteAttributeString("Id", "$Id")
	$InfoXml.WriteAttributeString("Name", $strFile.Replace(".TcPOU", ""))
	$InfoXml.WriteAttributeString("Path", $strPath[1])

	foreach($method in $MethodInfo.keys)
	{
		$InfoXml.WriteStartElement("Method")
		$InfoXml.WriteAttributeString("Name", "$method")

		$LineInfo = $MethodInfo[$method]

		foreach($LineEntry in $LineInfo)
		{
			$InfoXml.WriteStartElement("Line")
			$InfoXml.WriteAttributeString("Nb", $LineEntry[0])
			$InfoXml.WriteAttributeString("Branch", $LineEntry[1])
			$InfoXml.WriteEndElement(); # Line
			# Write-Host "   - Line Nb= "$LineEntry[0] + " Branch = "$LineEntry[1]
		}

		$InfoXml.WriteEndElement(); # Method
	}

	$InfoXml.WriteEndElement(); # Pou
}

$InfoXml.WriteEndElement(); # Info
$InfoXml.WriteEndDocument();

$InfoXml.Flush();
$InfoXml.Close();

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Arbeitsverzeichnis wiederherstellen
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if ($ExitCode -eq 0)
{
	Write-Host "Instrumentierung erfolgreich beendet"
}
else
{
	Write-Host "Instrumentierung abgebrochen"
}

Pop-Location

ExitWithCode ($ExitCode)

