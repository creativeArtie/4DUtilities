//%attributes = {"shared":true}
// __UNIT_TEST

except_trapErrors

$test:=AJ_UnitTest.new("utils_getOptValues"; Current method name:C684; "Utilities")

$test.given:="no checker, use default"
$test.should:="6"
$test.expected:=6
$test.actual:=utils_getOptValue(Null:C1517; 6)
$test.assert()

$test.given:="no checker, use input"
$test.should:="4"
$test.expected:=4
$test.actual:=utils_getOptValue(4; 6)
$test.assert()

var $exception : cs:C1710.Exception
var $failed : Boolean
$exception:=New object:C1471

$failed:=except_try(Formula:C1597(utils_getOptValue(4; 3; Null:C1517)); ->$exception)
$test.given:="Null checker"
$test.should:="an exception thrown"
$test.expected:="ASSERT(False; \"Not accepted checker type\"): "+\
"Assert failed: Not accepted checker type"; 
$test.actual:=$exception.message
$test.assert()

$test.given:="Use value with function check"
$test.should:="8"
$test.expected:=8
$test.actual:=utils_getOptValue(Null:C1517; 8; Formula:C1597($1>6))
$test.assert()

$test.given:="Use value with function check"
$test.should:="10"
$test.expected:=10
$test.actual:=utils_getOptValue(10; 8; Formula:C1597($1>6))
$test.assert()

$exception:=New object:C1471
$failed:=except_try(Formula:C1597(utils_getOptValue(4; 3; Formula:C1597($1>6))); ->$exception)
$test.given:="Default is not allowed"
$test.should:="an exception thrown"
$test.expected:="ASSERT($passing; \"Failed default : \"+$methodCheck.source):"+\
" Assert failed: Failed default : $1>6"
$test.actual:=$exception.message
$test.assert()

$exception:=New object:C1471
$failed:=except_try(Formula:C1597(utils_getOptValue(4; 8; Formula:C1597($1>6))); ->$exception)
$test.given:="Value is not allowed"
$test.should:="an exception thrown"
$test.expected:="ASSERT($passing; \"Failed value: \"+$methodCheck.source):"+\
" Assert failed: Failed value: $1>6"
$test.actual:=$exception.message
$test.assert()

$test.given:="Object Class check"
$test.should:="CheckFilled object"
$test.expected:=cs:C1710.CheckFilled.new()
$test.actual:=utils_getOptValue(cs:C1710.CheckFilled.new(); cs:C1710.Check.new(); \
cs:C1710.Check)
$test.assert()

$failed:=except_try(Formula:C1597(utils_getOptValue(\
cs:C1710.Check.new(); cs:C1710.CheckFilled.new(); cs:C1710.CheckFilled\
)); ->$exception)
$test.given:="Object Class check"
$test.should:="Value not allowed"
$test.expected:="ASSERT($passing; \"Failed value: \"+$methodCheck.source):"+\
" Assert failed: Failed value: OB Instance of($1; $2)"
$test.actual:=$exception.message
$test.assert()

$failed:=except_try(Formula:C1597(utils_getOptValue(\
cs:C1710.Check.new(); cs:C1710.CheckFilled.new(); cs:C1710.Validator.new()\
)); ->$exception)
$test.given:="Object Class check"
$test.should:="Value not allowed"
$test.expected:="ASSERT(False; \"$checker object must be a "+\
"4D.Function or a 4d.Class.\"): "+\
"Assert failed: $checker object must be a 4D.Function or a 4d.Class."
$test.actual:=$exception.message
$test.assert()

$failed:=except_try(Formula:C1597(utils_getOptValue(\
cs:C1710.Check.new(); 3; cs:C1710.CheckFilled\
)); ->$exception)
$test.given:="Object Class check with value"
$test.should:="Default not allowed"
$test.expected:="ASSERT(False; \"$input or the $default is not an object.\"): "+\
"Assert failed: $input or the $default is not an object."
$test.actual:=$exception.message
$test.assert()

$failed:=except_try(Formula:C1597(utils_getOptValue(\
cs:C1710.Check.new(); cs:C1710.CheckFilled.new(); cs:C1710.CheckFilled\
)); ->$exception)
$test.given:="Object Class check with object"
$test.should:="Value not allowed"
$test.expected:="ASSERT($passing; \"Failed value: \"+$methodCheck.source):"+\
" Assert failed: Failed value: OB Instance of($1; $2)"
$test.actual:=$exception.message
$test.assert()

$failed:=except_try(Formula:C1597(utils_getOptValue(6; 5; Is null:K8:31)); ->$exception)
$test.given:="Set type as null"
$test.should:="Value type not allowed"
$test.expected:="ASSERT(False; \"Method can not assert undefined and null\"): "+\
"Assert failed: Method can not assert undefined and null"
$test.actual:=$exception.message
$test.assert()

$failed:=except_try(Formula:C1597(utils_getOptValue(New object:C1471; 5; Is object:K8:27)); ->$exception)
$test.given:="Set type as null"
$test.should:="Value type not allowed"
$test.expected:="ASSERT($passing; \"Failed default : \"+$methodCheck.source): "+\
"Assert failed: Failed default : Value type($1)=38"
$test.actual:=$exception.message
$test.assert()

except_hasExceptions($test)