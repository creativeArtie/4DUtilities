//%attributes = {"shared":true}
#DECLARE($passedParam : Boolean; $messageParam : Text)->$thrown : Object

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $passed : Boolean
If (wk_assertLocalParameter($assert; ->$passed))
	$passed:=$passedParam
End if 

var $message
If (wk_assertLocalParameter($assert; ->$message))
	$message:=$messageParam
End if 

wk_assertParameterCount($assert)

If (Not:C34($passed))
	$thrown:=wk_error_throw($message)
End if 