//%attributes = {"shared":true}
#DECLARE($onlyWhenParam : 4D:C1709.Function; $checkerParam : Object)->$answer : cs:C1710.Checker


var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $onlyWhen : 4D:C1709.Function
If (wk_assertLocalParameter($assert; ->$onlyWhen))
	ASSERT:C1129(OB Instance of:C1731($onlyWhenParam; 4D:C1709.Function))
	$onlyWhen:=$onlyWhenParam
End if 
var $checker
If (wk_assertLocalParameter($assert; ->$checker; wk_validate_fillValue))
	$checker:=$checkerParam
	ASSERT:C1129(OB Instance of:C1731($checkerParam; cs:C1710.Checker))
End if 

wk_assertParameterCount($assert)

$answer:=cs:C1710.CheckIf.new($onlyWhen; $checker)
