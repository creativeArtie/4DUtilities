//%attributes = {"shared":true}
#DECLARE($messageParam : Text)


var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $message
If (wk_assertLocalParameter($assert; ->$message))
	$message:=$messageParam
End if 

wk_assertParameterCount($assert)

error_addException(error_create($message; Information message:K38:1); False:C215; True:C214)
