//%attributes = {"shared":true}
// __UNIT_TEST

except_trapErrors

var $test : Object
$test:=AJ_UnitTest.new("Default"; Current method name:C684; "Utils_OptValues")

$test.given:="no checker, use default"
$test.should:="6"
$test.expected:=6
$test.actual:=utils_getOptionValue(Null:C1517; 6)
$test.assert()

$test.given:="no checker, use input"
$test.should:="4"
$test.expected:=4
$test.actual:=utils_getOptionValue(4; 6)
$test.assert()

var $exception : cs:C1710.Exception
var $failed : Boolean
$exception:=New object:C1471

$failed:=except_try(Formula:C1597(utils_getOptionValue(4; 3; Null:C1517)); ->$exception)
$test.given:="Null checker"
$test.should:="an exception thrown"
$test.expected:="ASSERT(False; \"Not accepted checker type\"): "+\
"Assert failed: Not accepted checker type"; 
$test.actual:=$exception.message
$test.assert()

except_hasExceptions($test)