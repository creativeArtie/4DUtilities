//%attributes = {"shared":true}
#DECLARE($testParam : Object; $methodParam : Text)

var $assert; $test : Object
$test:=New object:C1471
$assert:=setupParameterAsserts(Count parameters:C259)
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

//$object:=test_param

//$object:=test_param("abc"; "cde"; "")