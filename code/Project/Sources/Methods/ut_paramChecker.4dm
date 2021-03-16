//%attributes = {"shared":true}
// __UNIT_TEST

var $test : Object
$test:=AJ_UnitTest.new("ParamChecker"; Current method name:C684)

var $exception : cs:C1710.Exception
var $passed : Boolean
var $function : 4D:C1709.Function
$function:=Formula:C1597(param_method1(5))
$passed:=except_try($function)
$test.given:=$function.source
$test.should:="return pass"
$test.expected:=True:C214
$test.actual:=$passed
$test.assert()

$test.given:="123*456"
$test.should:="return 56088"
$test.expected:=56088
$test.actual:=123*456
$test.assert()
