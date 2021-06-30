//%attributes = {}
#DECLARE($input1Param : Text; $input2Param : Text)->$result : Object

var $input1; $input2 : Text
var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

If (wk_assertLocalParameter($assert; ->$input1))
	$input1:=$input1Param
End if 
If (wk_assertLocalParameter($assert; ->$input2; "World"))
	$input2:=$input2Param
End if 
/*
var $_local
If (wk_assertLocalParameter($assert; ->$_local; "World"))
$_local:=$_localParam
End if 
*/
wk_assertParameterCount($assert)

$result:=New object:C1471("param1"; $input1; "param2"; $input2)
