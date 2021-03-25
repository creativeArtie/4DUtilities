//%attributes = {}
// assert the paramters
#DECLARE($atMost : Real; $actual : Integer)

var $caller : Object
var $method : Object
$method:=Get call chain:C1662[0]
$caller:=Get call chain:C1662[1]
var $error : Text
$error:=$caller.name+":"+String:C10($caller.line)+" requires at most "\
+String:C10($atMost)+" paramters for "+$method.name+"."

ASSERT:C1129($atMost>=$actual; $error)