//%attributes = {"shared":true}
#DECLARE($message : Text)->$thrown : cs:C1710.Exception

$message:=utils_getOptionValue($1; ""; Is text:K8:3)  /// message
utils_countParams(1; Count parameters:C259)

$caller:=utils_getMethodCaller(Current method name:C684)
$thrown:=cs:C1710.Exception.new($message; Error message:K38:3; $caller)

except_addException_($thrown)