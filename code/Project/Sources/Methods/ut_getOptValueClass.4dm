//%attributes = {"shared":true}
// __UNIT_TEST

except_trapErrors

$test:=AJ_UnitTest.new("Class"; Current method name:C684; "Utils_OptValues")

$test.given:="Object Class check"
$test.should:="CheckFilled object"
$test.expected:=cs:C1710.CheckFilled.new()
$test.actual:=utils_getOptionValue(cs:C1710.CheckFilled.new(); cs:C1710.Check.new(); \
cs:C1710.Check)
$test.assert()

$failed:=except_try(Formula:C1597(utils_getOptionValue(\
cs:C1710.Check.new(); cs:C1710.CheckFilled.new(); cs:C1710.CheckFilled\
)); ->$exception)
$test.given:="Object Class check"
$test.should:="Value not allowed"
$test.expected:="ASSERT($passing; \"Failed value: \"+$methodCheck.source):"+\
" Assert failed: Failed value: OB Instance of($1; $2)"
$test.actual:=$exception.message
$test.assert()

$failed:=except_try(Formula:C1597(utils_getOptionValue(\
cs:C1710.Check.new(); cs:C1710.CheckFilled.new(); cs:C1710.Validator.new()\
)); ->$exception)
$test.given:="Object Class check"
$test.should:="Value not allowed"
$test.expected:="ASSERT(False; \"$checker object must be a "+\
"4D.Function or a 4d.Class.\"): "+\
"Assert failed: $checker object must be a 4D.Function or a 4d.Class."
$test.actual:=$exception.message
$test.assert()

$failed:=except_try(Formula:C1597(utils_getOptionValue(\
cs:C1710.Check.new(); 3; cs:C1710.CheckFilled\
)); ->$exception)
$test.given:="Object Class check with value"
$test.should:="Default not allowed"
$test.expected:="ASSERT(False; \"$input or the $default is not an object.\"): "+\
"Assert failed: $input or the $default is not an object."
$test.actual:=$exception.message
$test.assert()

$failed:=except_try(Formula:C1597(utils_getOptionValue(\
cs:C1710.Check.new(); cs:C1710.CheckFilled.new(); cs:C1710.CheckFilled\
)); ->$exception)
$test.given:="Object Class check with object"
$test.should:="Value not allowed"
$test.expected:="ASSERT($passing; \"Failed value: \"+$methodCheck.source):"+\
" Assert failed: Failed value: OB Instance of($1; $2)"
$test.actual:=$exception.message
$test.assert()

except_hasExceptions($test)