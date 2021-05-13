//%attributes = {"shared":true}
// __UNIT_TEST

var $test : Object

$test:=AJ_UnitTest.new("utils_setValueToObject"; Current method name:C684; "Utilities")
var $use : Object
$test.given:="undefined object"
$test.should:="return object with child"
$test.expected:=New object:C1471("child"; 2)
$test.actual:=utils_setValueToObject($use; 2; "child")
$test.assert()

$use:=Null:C1517
$test.given:="null object"
$test.should:="return object with child"
$test.expected:=New object:C1471("child"; 2)
$test.actual:=utils_setValueToObject($use; 2; "child")
$test.assert()

$use:=New object:C1471
$test.given:="new object"
$test.should:="return object with child"
$test.expected:=New object:C1471("child"; 2)
$test.actual:=utils_setValueToObject($use; 2; "child")
$test.assert()

$use:=New object:C1471("child"; 2)
$test.given:="value with child changed"
$test.should:="return object with child"
$test.expected:=New object:C1471("child"; 4)
$test.actual:=utils_setValueToObject($use; 4; "child")
$test.assert()

$use:=New object:C1471()
$test.given:="value with new grand child"
$test.should:="return object with child"
$test.expected:=New object:C1471("child"; New object:C1471("grandchild"; 5))
$test.actual:=utils_setValueToObject($use; 5; "child"; "grandchild")
$test.assert()

$use:=New object:C1471("child"; New object:C1471("grandchild"; 5))
$test.given:="object with grandchild"
$test.should:="grandchild edit"
$test.expected:=New object:C1471("child"; New object:C1471("grandchild"; 8))
$test.actual:=utils_setValueToObject($use; 8; "child"; "grandchild")
$test.assert()

$use:=Null:C1517

