//%attributes = {}
#DECLARE($input1Param : Text; $input2Param : Text)->$result : Object

var $input1; $input2 : Text
var $assert : Object
$assert:=setupParameterAsserts(Count parameters:C259)

If (assertLocalParameter($assert; ->$input1))
	$input1:=$input1Param
End if 
If (assertLocalParameter($assert; ->$input2; "World"))
	$input2:=$input2Param
End if 
assertParameterCount($assert)

$result:=New object:C1471("param1"; $input1; "param2"; $input2)
