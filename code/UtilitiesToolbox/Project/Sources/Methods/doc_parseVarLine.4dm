//%attributes = {}
#DECLARE($line : cs:C1710.RawLine; $pos : Integer; $length : Integer; $methodVariables : Collection)

var $raw; $variables : Collection
var $type; $variable : Text

$raw:=Split string:C1554(Substring:C12($line.code; $pos+$length); ":")

If ($raw.length=2)
	$type:=$raw[1]
Else 
	$type:="variant"
End if 
$variables:=Split string:C1554($raw[0]; ";")
For each ($variable; $variables)
	$methodVariables.push(cs:C1710.ParsedVariable.new($variable; $type; $line))
End for each 