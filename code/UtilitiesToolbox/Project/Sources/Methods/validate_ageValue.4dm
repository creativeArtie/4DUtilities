//%attributes = {"shared":true}
#DECLARE($minParam : Real; $maxParam : Real)->$checker : cs:C1710.Checker


var $assert : Object
$assert:=assertParameterSetup(Count parameters:C259)

var $min : Real
If (assertLocalParameter($assert; ->$min; 18))
	$min:=$minParam
End if 
var $max : Real
If (assertLocalParameter($assert; ->$max; 100))
	$max:=$maxParam
End if 

assertParameterCount($assert)

$checker:=cs:C1710.CheckAge.new($min; $max)
