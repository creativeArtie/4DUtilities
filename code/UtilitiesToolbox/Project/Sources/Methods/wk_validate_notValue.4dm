//%attributes = {"shared":true}
#DECLARE($checkerParam : Object)->$answer : cs:C1710.Checker


var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $checker
If (wk_assertLocalParameter($assert; ->$checker))
	$checker:=$checkerParam
	ASSERT:C1129(OB Instance of:C1731($checkerParam; cs:C1710.Checker))
End if 

wk_assertParameterCount($assert)

$answer:=cs:C1710.CheckNot.new($checker)
