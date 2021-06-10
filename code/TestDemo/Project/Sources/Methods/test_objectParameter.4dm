//%attributes = {}
#DECLARE($input1Param : Text; $input2Param : Text)->$result : Object

$result:=New object:C1471
var $assert : Object
$assert:=setupParameterAsserts(Count parameters:C259)

If (assertObjectParameter($assert; $result; "param1"))
	$result.param1:=$input1Param
End if 
If (assertObjectParameter($assert; $result; "param2"; "World"))
	$result.param2:=$input2Param
End if 
/*
var $_local
If (assertLocalParameter($assert; $_object; "_key"))
$_object_key:=$_keyParam
End if 
*/
assertParameterCount($assert)
