//%attributes = {}
#DECLARE($methodFileParam : cs:C1710.RawFile)->$method : Object
$method:=New object:C1471

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $methodFile
If (wk_assertLocalParameter($assert; ->$methodFile; doc_parseFile))
	$methodFile:=$methodFileParam
End if 

wk_assertParameterCount($assert)

var $methodBrief : Text
var $methodDoc; $methodVariables : Collection
var $parsed : Object
var $line : cs:C1710.RawLine
$methodBrief:=""
$methodDoc:=New collection:C1472
$methodVariables:=New collection:C1472
var $pos; $length : Integer
For each ($line; $methodFile.lines)
	$parsed:=doc_parseLine($line.doc)
	Case of 
		: ($parsed.tag="brief")
			$methodBrief:=$parsed.text
		: (Match regex:C1019("^#DECLARE\\("; $line.code; 1; $pos; $length))
			doc_parseDeclareLine($line; $pos; $length; $methodVariables)
		: (Match regex:C1019("^[ \t]*var "; $line.code; 1; $pos; $length))
			doc_parseVarLine($line; $pos; $length; $methodVariables)
		: ($parsed.text#"")
			$methodDoc.push($parsed.text)
	End case 
End for each 
$method:=New object:C1471()