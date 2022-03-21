//%attributes = {"shared":true}
// __UNIT_TEST

var $test : Object

$test:=AJ_UnitTest.new("wk_setObjectValue"; Current method name:C684; "Utilities")

$use:=New object:C1471
$test.given:="new object"
$test.should:="return new keys to true"
$test.expected:=True:C214
$test.actual:=wk_setObjectValue($use; 2; "child")
$test.assert()

$test.given:="new object"
$test.should:="return object with child"
$test.expected:=New object:C1471("child"; 2)
$test.actual:=$use
$test.assert()

$use:=New object:C1471("child"; 2)
$test.given:="value with child changed"
$test.should:="return new keys to false"
$test.expected:=False:C215
$test.actual:=wk_setObjectValue($use; 4; "child")
$test.assert()

$test.given:="value with child changed"
$test.should:="return object with child"
$test.expected:=New object:C1471("child"; 4)
$test.actual:=$use
$test.assert()

$use:=New object:C1471()
$test.given:="value with new grand child"
$test.should:="return new keys to true"
$test.expected:=True:C214
$test.actual:=wk_setObjectValue($use; 5; "child"; "grandchild")
$test.assert()

$test.given:="value with new grand child"
$test.should:="return object with child"
$test.expected:=New object:C1471("child"; New object:C1471("grandchild"; 5))
$test.actual:=$use
$test.assert()

$use:=New object:C1471("child"; New object:C1471("grandchild"; 5))
$test.given:="object with grandchild"
$test.should:="return new keys to false"
$test.expected:=False:C215
$test.actual:=wk_setObjectValue($use; 8; "child"; "grandchild")
$test.assert()

$test.given:="object with grandchild"
$test.should:="grandchild edit"
$test.expected:=New object:C1471("child"; New object:C1471("grandchild"; 8))
$test.actual:=$use
$test.assert()

$use:=Null:C1517

