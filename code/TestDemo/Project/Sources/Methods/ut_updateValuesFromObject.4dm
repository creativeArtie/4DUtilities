//%attributes = {"shared":true}
// __UNIT_TEST
var $test : Object
$test:=AJ_UnitTest.new("wk_updateValueFromObject"; Current method name:C684; "Utilities")

var $expect; $input; $default : Object
$default:=New object:C1471(\
"key1"; 123; \
"key2"; "World"; \
"filledChild"; New object:C1471("key3"; 123; \
"key4"; "Joy"\
); \
"emptyChild"; New object:C1471()\
)
var $sameText; $updatedText : Text
$sameText:="Use all default values"
$updatedText:="Some value changed."

$expect:=OB Copy:C1225($default)
$test.given:="Null"
$test.should:=$sameText
$test.expected:=$expect
$test.actual:=wk_updateValueFromObject(Null:C1517; $default)
$test.assert()

$expect:=OB Copy:C1225($default)
$input:=New object:C1471("unknown"; 123)
$test.given:="Unknown Key"
$test.should:=$sameText
$test.expected:=$expect
$test.actual:=wk_updateValueFromObject($input; $default)
$test.assert()


$expect:=OB Copy:C1225($default)
$input:=New object:C1471("key2"; 123)
$test.given:="Wrong value type"
$test.should:=$sameText
$test.expected:=$expect
$test.actual:=wk_updateValueFromObject($input; $default)
$test.assert()

$expect:=OB Copy:C1225($default)
$input:=New object:C1471("key1"; 44; "key2"; "Hello")
$expect.key1:=44
$expect.key2:="Hello"
$test.given:="Updated values"
$test.should:=$updatedText
$test.expected:=$expect
$test.actual:=wk_updateValueFromObject($input; $default)
$test.assert()

$expect:=OB Copy:C1225($default)
$input:=New object:C1471("filledChild"; 123)
$test.given:="Set number to a object"
$test.should:=$sameText
$test.expected:=$expect
$test.actual:=wk_updateValueFromObject($input; $default)
$test.assert()

$expect:=OB Copy:C1225($default)
$input:=New object:C1471("filledChild"; New object:C1471("key3"; "Test"))
$test.given:="Wrong grandchild value type"
$test.should:=$sameText
$test.expected:=$expect
$test.actual:=wk_updateValueFromObject($input; $default)
$test.assert()

$expect:=OB Copy:C1225($default)
$expect.filledChild.key3:=452
$input:=New object:C1471("filledChild"; New object:C1471("key3"; 452; \
"key5"; 213))
$test.given:="Some new keys and some edit"
$test.should:=$updatedText
$test.expected:=$expect
$test.actual:=wk_updateValueFromObject($input; $default)
$test.assert()

$expect:=OB Copy:C1225($default)
$input:=New object:C1471("emptyChild"; 3)
$test.given:="Different value type from empty child."
$test.should:=$sameText
$test.expected:=$expect
$test.actual:=wk_updateValueFromObject($input; $default)
$test.assert()


var $new : Object
$new:=New object:C1471("key6"; 23)
$expect:=OB Copy:C1225($default)
$expect.emptyChild:=$new
$input:=New object:C1471("emptyChild"; $new)
$test.given:="Filling the empty child with an object."
$test.should:="Empty Child is now filled"
$test.expected:=$expect
$test.actual:=wk_updateValueFromObject($input; $default)
$test.assert()
