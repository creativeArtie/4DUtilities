//%attributes = {"shared":true}
#DECLARE($testParam : Object; $methodParam : Text)

error_flagForTest
ON ERR CALL:C155("error_onErrCall")
error_trapToolboxErrors

var $assert; $test : Object
$test:=New object:C1471
$assert:=assertParameterSetup(Count parameters:C259)
If (assertLocalParameter($assert; ->$test))
	$test:=$testParam
End if 

var $method : Text
If (assertLocalParameter($assert; ->$method; "World"))
	$method:=$methodParam
End if 
assertParameterCount($assert)

var $expect; $actual : Object
$expect:=New object:C1471("param1"; "Hello"; "param2"; "World")
$actual:=New object:C1471
EXECUTE METHOD:C1007($method; $actual; "Hello")

$test.given:="Single Parameter"
$test.should:="return a value"
$test.expected:=$expect
$test.actual:=$actual
$test.assert()

$expect.param1:="Hey"
$expect.param2:="There"
EXECUTE METHOD:C1007($method; $actual; "Hey"; "There")
$test.given:="Two Parameter"
$test.should:="return a value"
$test.expected:=$expect
$test.actual:=$actual
$test.assert()

var $exception : Object
EXECUTE METHOD:C1007($method; $actual)
$test.given:="No parameter"
$test.should:="Exception caught."
$test.expected:=True:C214
$test.actual:=error_catch(->$exception)
$test.assert()

EXECUTE METHOD:C1007($method; $actual; "abc"; "cde"; "")
$test.given:="Too many parameters"
$test.should:="Exception caught."
$test.expected:=True:C214
$test.actual:=error_catch(->$exception)
$test.assert()


$test.given:="Add exception captured."
$test.should:="clean up and returns true."
$test.expected:=True:C214
$test.actual:=error_clearUncaughtExceptions
$test.assert()