//%attributes = {}
var $randomer : Object
var $exception : cs:C1710.Exception

TRACE:C157
var $pass : Integer
var $exception : cs:C1710.Exception
If (except_try(Formula:C1597($pass:=2); ->$exception))
	ALERT:C41("Passed")
Else 
	ALERT:C41($exception.message)
End if 

If (except_try(Formula:C1597($randomer.hello:="Hello"); ->$exception))
	ALERT:C41("Passed")
Else 
	ALERT:C41($exception.message)
End if 

$randomer:=$randomer.error/5230
except_trapErrors
$randomer:=$randomer.trapped/5

utils_getRequireValue(""; Is real:K8:4)

While (except_catch(->$exception))
	ALERT:C41($exception.message)
End while 

$randomer:=$randomer.uncaught/5

var $user : cs:C1710.Exception
$user:=except_throw("Some Error")