//%attributes = {"shared":true}
// __UNIT_TEST

var $test : Object
$test:=AJ_UnitTest.new("utils_MethodCaller"; Current method name:C684; "Utlities")

$test.given:="The method name: test_ut_child"
$test.should:="ut_getMethodCaller"
$test.expected:=New object:C1471("type"; "projectMethod"; \
"name"; "ut_getMethodCaller"; \
"line"; 8; \
"database"; "Utlities")
$test.actual:=test_ut_child
$test.assert()

C_COLLECTION:C1488($callers)
C_TEXT:C284($caller)
$callers:=Get call chain:C1662
$caller:=$callers[$callers.count()-1].name
$test.given:="The method name: "+$caller
$test.should:="returns AJ_Tools_UnitTest"
$test.expected:=New object:C1471("type"; "projectMethod"; \
"name"; "AJ_Tools_UT_runAll"; \
"line"; 54; \
"database"; "AJ_Tools_UnitTest")
$test.actual:=utils_getMethodCaller($caller)
$test.assert()

$caller:="test_ut_child"
$test.given:="The method name: "+$caller
$test.should:="returns a empty object"
$test.expected:=New object:C1471("type"; "projectMethod"; \
"name"; "ut_getMethodCaller"; \
"line"; 25; \
"database"; "Utlities")
$test.actual:=test_ut_child
$test.assert()

$caller:="123213sdasdf"
$test.given:="The method name: "+$caller
$test.should:="returns a empty object"
$test.expected:=New object:C1471()
$test.actual:=utils_getMethodCaller($caller)
$test.assert()