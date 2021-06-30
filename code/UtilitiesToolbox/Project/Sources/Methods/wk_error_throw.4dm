//%attributes = {"shared":true}
#DECLARE($messageParam : Text; $reasonParam : Object)->$thrown : Object


var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)
var $thrown : Object

var $message : Text
If (wk_assertLocalParameter($assert; ->$message))
	$message:=$messageParam
End if 

var $reason : Object
If (wk_assertLocalParameter($assert; ->$reason; New object:C1471))
	$reason:=$reasonParam
	$thrown:=error_create($message; Error message:K38:3; $reason)
Else 
	$thrown:=error_create($message; Error message:K38:3)
End if 

var $process : Text
var $save : Boolean
$process:=String:C10(Current process:C322)
Use (Storage:C1525.utils_except.escape)
	$save:=Storage:C1525.utils_except.escape.indexOf($process)=-1
End use 

wk_assertParameterCount($assert)
error_addException($thrown; True:C214; $save)