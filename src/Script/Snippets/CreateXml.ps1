

Remove-Item -Path "C:\Users\patrickdressel\Documents\Info.xml" -Force

$InfoXml = New-Object System.Xml.XmlTextWriter("C:\Users\patrickdressel\Documents\Info.xml", $null)

$InfoXml.Formatting = "Indented"
$InfoXml.Indentation = 1
$InfoXml.IndentChar = "`t"

$InfoXml.WriteStartDocument()
$InfoXml.WriteStartElement("Info")

$InfoXml.WriteStartElement("POU")
$InfoXml.WriteAttributeString("Id", "1")
$InfoXml.WriteAttributeString("Name", "FB_Test.tcPou")
$InfoXml.WriteAttributeString("Path", "POUs/FB_Test.tcPou")

$InfoXml.WriteStartElement("Line")
$InfoXml.WriteAttributeString("Nb", "1")
$InfoXml.WriteAttributeString("Branch", "false")
$InfoXml.WriteEndElement(); # Line
$InfoXml.WriteStartElement("Line")
$InfoXml.WriteAttributeString("Nb", "41")
$InfoXml.WriteAttributeString("Branch", "true")
$InfoXml.WriteEndElement(); # Line

$InfoXml.WriteStartElement("Method")
$InfoXml.WriteAttributeString("Name", "calc_Something")

$InfoXml.WriteStartElement("Line")
$InfoXml.WriteAttributeString("Nb", "1")
$InfoXml.WriteAttributeString("Branch", "false")
$InfoXml.WriteEndElement(); # Line
$InfoXml.WriteStartElement("Line")
$InfoXml.WriteAttributeString("Nb", "41")
$InfoXml.WriteAttributeString("Branch", "true")
$InfoXml.WriteEndElement(); # Line

$InfoXml.WriteEndElement(); # Method

$InfoXml.WriteStartElement("Method")
$InfoXml.WriteAttributeString("Name", "act_DoSomething")

$InfoXml.WriteStartElement("Line")
$InfoXml.WriteAttributeString("Nb", "1")
$InfoXml.WriteAttributeString("Branch", "false")
$InfoXml.WriteEndElement(); # Line

$InfoXml.WriteEndElement(); # Method


$InfoXml.WriteEndElement(); # Pou


$InfoXml.WriteStartElement("POU")
$InfoXml.WriteAttributeString("Id", "2")
$InfoXml.WriteAttributeString("Name", "FB_Worschd.tcPou")
$InfoXml.WriteAttributeString("Path", "POUs/FB_Worschd.tcPou")

$InfoXml.WriteStartElement("Line")
$InfoXml.WriteAttributeString("Nb", "321")
$InfoXml.WriteAttributeString("Branch", "false")
$InfoXml.WriteEndElement(); # Line
$InfoXml.WriteStartElement("Line")
$InfoXml.WriteAttributeString("Nb", "534")
$InfoXml.WriteAttributeString("Branch", "false")
$InfoXml.WriteEndElement(); # Line

$InfoXml.WriteEndElement(); # Pou



$InfoXml.WriteEndElement(); # Info
$InfoXml.WriteEndDocument();

$InfoXml.Flush();
$InfoXml.Close();