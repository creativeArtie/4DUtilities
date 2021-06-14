//%attributes = {"shared":true}
#DECLARE($passedParam : Boolean; $messageParam : Text)->$thrown : Object

var $assert : Object
$assert:=assertParameterSetup(Count parameters:C259)

var $passed : Boolean
If (assertLocalParameter($assert; ->$passed))
	$passed:=$passedParam
End if 

var $message
If (assertLocalParameter($assert; ->$message))
	$message:=$messageParam
End if 

assertParameterCount($assert)

If (Not:C34($passed))
	$thrown:=error_throw($message)
End if 