//%attributes = {}
#DECLARE($line : cs:C1710.RawLine; $pos : Integer; $length : Integer; $methodVariables : Collection)

var $index : Integer
var $raw; $variable : Text
var $data : Object
var $variables : Collection
$raw:=Substring:C12($line.code; $pos+$length)
If (Match regex:C1019("\\)\\-\\>"; $raw; 1; $pos; $length))
	$variable:=Substring:C12($raw; $pos+$length)
	$raw:=Substring:C12($raw; 0; $pos-1)
	$data:=doc_parseColonDeclare($variable)
	$methodVariables.push(cs:C1710.ParsedReturnVar.new($data.name; $data.type; $line))
End if 

$variables:=Split string:C1554($raw; ";")
$index:=1
For each ($variable; $variables)
	$data:=doc_parseColonDeclare($variable)
	$methodVariables.push(cs:C1710.ParsedParamVar.new($data.name; $data.type; $line; $index))
	$index:=$index+1
End for each 
