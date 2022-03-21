//%attributes = {}
#DECLARE($inputParam; $defaultParam; $nameParam : Text)->$result : Text

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

// Check parameters with wk_localParam or wk_objectParam

var $input
If (wk_assertLocalParameter($assert; ->$input))
	$input:=$inputParam
End if 

var $default
If (wk_assertLocalParameter($assert; ->$default))
	$default:=$defaultParam
End if 

var $name
If (wk_assertLocalParameter($assert; ->$name; ""))
	$name:=$nameParam
End if 

wk_assertParameterCount($assert)
