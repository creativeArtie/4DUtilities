//%attributes = {}
var $randomer : Object
var $exception : Object

TRACE:C157
var $pass : Integer
ON ERR CALL:C155("wk_error_onErrCall")

$randomer:=$randomer.error/5230
$randomer:=$randomer.trapped/5
ASSERT:C1129(False:C215)

wk_error_assert(Formula:C1597(1=0)).apply()

While (wk_error_catch(->$exception))
End while 

$randomer:=$randomer.uncaught/5

var $user : cs:C1710.Exception
$user:=wk_error_throw("Some Error")


wk_error_assert(Formula:C1597(1=3)).apply()

wk_error_assertIf(False:C215; "Test")