//%attributes = {"shared":true}
// assert the paramters
#DECLARE($atMost : Real; $actual : Integer)
var $caller : Object

$atMost:=utils_setParam($atMost; Is real:K8:4)
$actual:=utils_setParam($actual; Is longint:K8:6)

$caller:=utils_getMethodCaller(Current method name:C684)

ASSERT:C1129($atMost>=$actual; "Method "+$caller.name+" needs at most "\
+String:C10($atMost)+" parameters")
