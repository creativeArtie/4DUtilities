//%attributes = {"shared":true}
// __UNIT_TEST

var $test : Object
$test:=AJ_UnitTest.new("utils_countParams"; Current method name:C684; "Utlities")

var $error : Boolean
var $exception : cs:C1710.Exception
$error:=except_try(Formula:C1597(utils_countParams(2; 4)); ->$exception)
utils_countParams(2; Count parameters:C259)
$test.given:="utils_countParams(2;Count parameters)"
$test.should:="No errors"
$test.expected:=False:C215
$test.actual:=$error
$test.assert()  // 3

$error:=except_try(Formula:C1597(utils_countParams(2; 4)); ->$exception)
$test.given:="utils_countParams(2;4)"
$test.should:="return error"
$test.expected:="ASSERT($atMost>=$actual;"+\
" \"Method \"+$caller.name+\" needs at most \"+String($atMost)+\" parameters\"): "+\
"Assert failed: Method except_try needs at most 2 parameters"
$test.actual:=$exception.message
$test.assert()  // 4

except_hasExceptions($test)