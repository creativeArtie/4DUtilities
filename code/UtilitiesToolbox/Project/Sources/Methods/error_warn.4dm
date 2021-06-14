//%attributes = {"shared":true}
#DECLARE($messageParam : Text)


var $assert : Object
$assert:=assertParameterSetup(Count parameters:C259)

var $message
If (assertLocalParameter($assert; ->$message))
	$message:=$messageParam
End if 

assertParameterCount($assert)

error_addException(error_create($message; Warning message:K38:2); False:C215; True:C214)
