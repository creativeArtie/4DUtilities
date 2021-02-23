//%attributes = {}
#DECLARE($passed : Boolean; $message : Text; $method : Text)->$thrown : cs:C1710.Exception

$passed:=utils_getRequireValue($1; Is boolean:K8:9)
$message:=utils_getOptionValue($2; ""; Is text:K8:3)  /// message
$method:=utils_getOptionValue($3; Current method name:C684; Is text:K8:3)
utils_countParams(1; Count parameters:C259)

If (Not:C34($passed))
	except_throw($message; $method)
End if 