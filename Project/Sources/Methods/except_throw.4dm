//%attributes = {"shared":true}
C_TEXT:C284($text)
C_OBJECT:C1216($caller;$0)

$text:=utils_setParam($1;Is text:K8:3;"")
utils_countParams(1;Count parameters:C259)

$caller:=utils_getMethodCaller(Current method name:C684)
$0:=cs:C1710.Exception.new($text;Error message:K38:3;$caller)

except_addException($0)