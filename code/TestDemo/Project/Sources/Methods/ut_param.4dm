//%attributes = {"shared":true}
// __UNIT_TEST

var $expect : Object
$expect:=New object:C1471("param1"; "Hello"; "param2"; "World")

$test:=AJ_UnitTest.new("ut_param"; Current method name:C684)

$test.given:="Single Parameter"
$test.should:="return a value"
$test.expected:=$expect
$test.actual:=test_param("Hello")
$test.assert()

$expect.param1:="Hey"
$expect.param2:="There"
$test.given:="Two Parameter"
$test.should:="return a value"
$test.expected:=$expect
$test.actual:=test_param("Hey"; "There")
$test.assert()

//$object:=test_param

//$object:=test_param("abc"; "cde"; "")