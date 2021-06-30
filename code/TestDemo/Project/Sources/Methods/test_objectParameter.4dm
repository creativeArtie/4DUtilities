//%attributes = {}
#DECLARE($input1Param : Text; $input2Param : Text)->$result : Object

$result:=New object:C1471
var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

If (wk_assertObjectParameter($assert; $result; "param1"))
	$result.param1:=$input1Param
End if 
If (wk_assertObjectParameter($assert; $result; "param2"; "World"))
	$result.param2:=$input2Param
End if 
/*
var $_local
If (wk_assertLocalParameter($assert; $_object; "_key"))
$_object._key:=$_keyParam
End if 
*/
wk_assertParameterCount($assert)
