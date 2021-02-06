//%attributes = {"shared":true}
// assert the paramters

$atMost:=utils_setParam($1;Is real:K8:4)
$actual:=utils_setParam($2;Is longint:K8:6)

C_REAL:C285($1;$atMost)  // at most count
C_LONGINT:C283($2;$actual)  // actual count
C_OBJECT:C1216($caller)
$caller:=utils_getMethodCaller(Current method name:C684)

ASSERT:C1129($atMost>=$actual;"Method "+$caller.name+" needs at most "\
+String:C10($atMost)+" parameters")
