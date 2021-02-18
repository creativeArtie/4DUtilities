//%attributes = {"shared":true}
// __UNIT_TEST

except_trapErrors

$test:=AJ_UnitTest.new("Value Type"; Current method name:C684; "Utils_OptValues")

$failed:=except_try(Formula:C1597(utils_getOptionValue(6; 5; Is null:K8:31)); ->$exception)
$test.given:="Set type as null"
$test.should:="Value type not allowed"
$test.expected:="ASSERT(False; \"Method can not assert undefined and null\"): "+\
"Assert failed: Method can not assert undefined and null"
$test.actual:=$exception.message
$test.assert()

$failed:=except_try(Formula:C1597(utils_getOptionValue(New object:C1471; 5; Is object:K8:27)); ->$exception)
$test.given:="Set type as null"
$test.should:="Value type not allowed"
$test.expected:="ASSERT($passing; \"Failed default : \"+$methodCheck.source): "+\
"Assert failed: Failed default : Value type($1)=38"
$test.actual:=$exception.message
$test.assert()

$test.given:="Use value with is long int check"
$test.should:="10"
$test.expected:=10
$test.actual:=utils_getOptionValue(10; Count parameters:C259; Is real:K8:4)
$test.assert()

$test.given:="Use value with is variant check"
$test.should:="10"
$test.expected:="Hello"
$test.actual:=utils_getOptionValue("Hello"; Count parameters:C259; Is variant:K8:33)
$test.assert()

$failed:=except_try(Formula:C1597(utils_getOptionValue(New object:C1471; "hello"; Is text:K8:3)); \
->$exception)
$test.given:="Set type as null"
$test.should:="Value type not allowed"
$test.expected:="ASSERT($passing; \"Failed value: \""+\
"+$methodCheck.source): Assert failed: Failed value: Value type($1)=2"
$test.actual:=$exception.message
$test.assert()

except_hasExceptions($test)