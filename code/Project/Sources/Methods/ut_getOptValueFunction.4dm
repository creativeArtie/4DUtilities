//%attributes = {"shared":true}
// __UNIT_TEST

except_trapErrors

$test:=AJ_UnitTest.new("Function"; Current method name:C684; "Utils_OptValues")

$test.given:="Use value with function check"
$test.should:="8"
$test.expected:=8
$test.actual:=utils_getOptionValue(Null:C1517; 8; Formula:C1597($1>6))
$test.assert()

$test.given:="Use value with function check"
$test.should:="10"
$test.expected:=10
$test.actual:=utils_getOptionValue(10; 8; Formula:C1597($1>6))
$test.assert()

$exception:=New object:C1471
$failed:=except_try(Formula:C1597(utils_getOptionValue(4; 3; Formula:C1597($1>6))); ->$exception)
$test.given:="Default is not allowed"
$test.should:="an exception thrown"
$test.expected:="ASSERT($passing; \"Failed default : \"+$methodCheck.source):"+\
" Assert failed: Failed default : $1>6"
$test.actual:=$exception.message
$test.assert()

$exception:=New object:C1471
$failed:=except_try(Formula:C1597(utils_getOptionValue(4; 8; Formula:C1597($1>6))); ->$exception)
$test.given:="Value is not allowed"
$test.should:="an exception thrown"
$test.expected:="ASSERT($passing; \"Failed value: \"+$methodCheck.source):"+\
" Assert failed: Failed value: $1>6"
$test.actual:=$exception.message
$test.assert()

except_hasExceptions($test)