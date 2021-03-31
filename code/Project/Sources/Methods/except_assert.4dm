//%attributes = {}
#DECLARE($passed : Boolean; $message : Text; $method : Text)->$thrown : cs:C1710.Exception

var $count : Real
$passed:=utils_assertParameter($1; ->$count; Count parameters:C259)
$message:=utils_assertParameter($2; ->$count; Count parameters:C259; "")  //! message
$method:=utils_assertParameter($3; ->$count; Count parameters:C259; Current method name:C684)
utils_assertParameterCount($count; Count parameters:C259)

If (Not:C34($passed))
	except_throw($message; $method)
End if 