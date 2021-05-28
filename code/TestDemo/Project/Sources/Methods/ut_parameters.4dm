//%attributes = {"shared":true}
// __UNIT_TEST

$test:=AJ_UnitTest.new("All Optional Params"; Current method name:C684; "utils_listOptionalParams")

$test.given:="zero paramters"
$test.should:="return default text with no errors"
$test.expected:="Hello World"
$test.actual:=test_allOptionalParams
$test.assert()

$test.given:="1 parameter"
$test.should:="return some text with no errors"
$test.expected:="Goodbye World"
$test.actual:=test_allOptionalParams("Goodbye")
$test.assert()


$test.given:="2 parameters"
$test.should:="return text with no errors"
$test.expected:="Joyful Programming"
$test.actual:=test_allOptionalParams("Joyful"; "Programming")
$test.assert()