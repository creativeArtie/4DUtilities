//%attributes = {"shared":true}
#DECLARE($messageParam : Text)


var $assert : Object
$assert:=assertParameterSetup(Count parameters:C259)

var $message
If (assertLocalParameter($assert; ->$message))
	$message:=$messageParam
End if 

assertParameterCount($assert)

error_addException(error_create($message; Information message:K38:1); False:C215; True:C214)
