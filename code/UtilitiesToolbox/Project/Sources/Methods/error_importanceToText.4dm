//%attributes = {}
#DECLARE($importanceParam : Real)->$answer : Text


var $assert : Object
$assert:=assertParameterSetup(Count parameters:C259)

var $importance
If (assertLocalParameter($assert; ->$importance))
	$importance:=$importanceParam
End if 
assertParameterCount($assert)

Case of 
	: ($importance=Information message:K38:1)
		$answer:="Informational"
	: ($importance=Warning message:K38:2)
		$answer:="Warning"
	: ($importance=Error message:K38:3)
		$answer:="Error"
End case 