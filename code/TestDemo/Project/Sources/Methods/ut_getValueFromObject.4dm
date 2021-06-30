//%attributes = {"shared":true}
// __UNIT_TEST

var $test : Object
$test:=AJ_UnitTest.new("wk_getValueToObject"; Current method name:C684; "Utilities")

var $object : Object

var $value : Text
$value:="return value"
var $defualt : Text
$defualt:="return default"

// Tests for null returns default
$test.given:="null object"
$test.should:=$defualt
$test.expected:=23
$test.actual:=wk_getValueFromObject($object; 23; "A")
$test.assert()

/*
$object = { 
  "branch" : {
    "A" : 1,
    "more" : { 
       "B" : 4
    }
  }, 
  "C" : 5
}
*/
$object:=New object:C1471("branch"; New object:C1471("A"; 1; \
"more"; New object:C1471("B"; 4)\
); "C"; 5)

// Tests $object.branch.C
$test.given:="unknown key"
$test.should:=$defualt
$test.expected:=20
$test.actual:=wk_getValueFromObject($object; 20; "D")
$test.assert()


$test.given:="mismatch value type"
$test.should:=$defualt
$test.expected:="default"
$test.actual:=wk_getValueFromObject($object; "default"; "C")
$test.assert()

$test.given:="match value"
$test.should:=$value
$test.expected:=5
$test.actual:=wk_getValueFromObject($object; 20; "C")
$test.assert()

// Tests $object.branch.A
$test.given:="unknown child branch key"
$test.should:=$defualt
$test.expected:=20
$test.actual:=wk_getValueFromObject($object; 20; "wrong"; "A")
$test.assert()

$test.given:="unknown child leaf key"
$test.should:=$defualt
$test.expected:=20
$test.actual:=wk_getValueFromObject($object; 20; "branch"; "D")
$test.assert()

$test.given:="mismatch child leaf value type"
$test.should:=$defualt
$test.expected:="default"
$test.actual:=wk_getValueFromObject($object; "default"; "branch"; "A")
$test.assert()

$test.given:="match child leaf value"
$test.should:=$value
$test.expected:=1
$test.actual:=wk_getValueFromObject($object; 20; "branch"; "A")
$test.assert()

// Tests $object.branch.more.B
$test.given:="unknown child branch key"
$test.should:=$defualt
$test.expected:=20
$test.actual:=wk_getValueFromObject($object; 20; "branch"; "hello"; "B")
$test.assert()

$test.given:="child branch is a leaf"
$test.should:=$defualt
$test.expected:=20
$test.actual:=wk_getValueFromObject($object; 20; "branch"; "A"; "B")
$test.assert()

$test.given:="unknown grandchild leaf key"
$test.should:=$defualt
$test.expected:=20
$test.actual:=wk_getValueFromObject($object; 20; "branch"; "more"; "A")
$test.assert()

$test.given:="mismatch grandchild leaf value type"
$test.should:=$defualt
$test.expected:="default"
$test.actual:=wk_getValueFromObject($object; "default"; "branch"; "more"; "B")
$test.assert()

$test.given:="match grandchild leaf key"
$test.should:=$value
$test.expected:=4
$test.actual:=wk_getValueFromObject($object; 20; "branch"; "more"; "B")
$test.assert()