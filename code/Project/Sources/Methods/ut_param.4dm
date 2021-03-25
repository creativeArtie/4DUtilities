//%attributes = {"shared":true}
// __UNIT_TEST

var $test : Object
$test:=AJ_UnitTest.new("utilts_assertParameter, utils_assertParameterCount"; Current method name:C684; "Utilities")

var $passed : Boolean
var $expection : cs:C1710.Exception
$test.given:="test_param(\"John\")"
$test.should:="Returns a error"
$test.expected:=False:C215
$test.actual:=except_try(Formula:C1597(test_param("John")); ->$expection)
$test.assert()

$test.given:="All required paramaters filled"
$test.should:="Returns a error"
$test.expected:=New object:C1471("a"; "Don"; \
"b"; 4; \
"opt1"; 23; \
"opt2"; "Hello World")
$test.actual:=test_param("Don"; 4)
$test.assert()

$test.given:="All optional paramaters filled"
$test.should:="Returns a error"
$test.expected:=New object:C1471("a"; "hello"; \
"b"; 6; \
"opt1"; 4; \
"opt2"; "A")
$test.actual:=test_param("hello"; 6; 4; "A")
$test.assert()

$test.given:="too many parameters"
$test.should:="Returns a error"
$test.expected:=False:C215
$test.actual:=except_try(Formula:C1597(test_param("John"; 5; 5; "Error"; 212)); ->$expection)
$test.assert()
