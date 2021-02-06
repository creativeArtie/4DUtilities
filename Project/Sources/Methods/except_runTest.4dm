//%attributes = {}
C_OBJECT:C1216($randomer)
C_OBJECT:C1216($exception)
C_REAL:C285($pass)

TRACE:C157
If (except_try(Formula:C1597($pass:=2)))
	ALERT:C41("Passed")
Else 
	ALERT:C41("Failed")
End if 

If (except_try(Formula:C1597($randomer.hello:="Hello")))
	ALERT:C41("Passed")
Else 
	ALERT:C41("Failed")
End if 

$randomer:=$randomer.error/5230
except_trapErrors
$randomer:=$randomer.trapped/5

utils_setParam("";Is real:K8:4)

While (except_catch(->$exception))
	ALERT:C41($exception.message)
End while 

$randomer:=$randomer.uncaught/5