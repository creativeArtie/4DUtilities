//%attributes = {"shared":true}
// __UNIT_TEST

var $test : Object
$test:=AJ_UnitTest.new("utils_MethodCaller"; Current method name:C684; "Utilities")

$test.given:="Get caller of test_ut_child"
$test.should:="ut_getMethodCaller"
$test.expected:=New object:C1471("type"; "projectMethod"; \
"name"; "ut_getMethodCaller"; \
"line"; 9; \
"database"; "Utlities")
$test.actual:=test_ut_child
$test.assert()

var $caller : Text
$caller:=Current method name:C684
$test.given:="The caller of this method."
$test.should:="returns AJ_Tools_UnitTest"
$test.expected:=New object:C1471("type"; "projectMethod"; \
"name"; "AJ_Tools_UT_runAll"; \
"line"; 54; \
"database"; "AJ_Tools_UnitTest")
$test.actual:=utils_getMethodCaller($caller)
$test.assert()

$caller:="AJ_Tools_UnitTest"
$test.given:="The caller of "+$caller
$test.should:="returns a ut_getMethodCaller"
$test.expected:=New object:C1471()
$test.actual:=utils_getMethodCaller($caller)
$test.assert()

$caller:="123213sdasdf"
$test.given:="A non-existant method"
$test.should:="returns a empty object"
$test.expected:=New object:C1471()
$test.actual:=utils_getMethodCaller($caller)
$test.assert()