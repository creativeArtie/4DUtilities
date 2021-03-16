//%attributes = {"shared":true}
// __UNIT_TEST

var $test : Object
var $error : Text

$test:=AJ_UnitTest.new("utils_lazyAnd, utils_lazyOr"; Current method name:C684; "Utlities")

$error:=Method called on error:C704
ON ERR CALL:C155("utils_ut_exceptions")

C_OBJECT:C1216(ut_exceptions)
ut_exceptions:=Null:C1517

$test.given:="utils_lazyAnd(False, error)"
$test.should:="return false"
$test.expected:=False:C215
$test.actual:=utils_lazyAnd(Formula:C1597(False:C215); Formula:C1597($error))
$test.assert()

$test.given:="utils_lazyAnd(False, error): no excepts"
$test.should:="return null"
$test.expected:=True:C214
$test.actual:=ut_exceptions=Null:C1517
$test.assert()
ut_exceptions:=Null:C1517

$test.given:="utils_lazyAnd(True, True, True, True)"
$test.should:="return true"
$test.expected:=utils_lazyAnd(Formula:C1597(2=2); Formula:C1597(True:C214)\
; Formula:C1597(Not:C34(False:C215)); Formula:C1597(True:C214=True:C214))
$test.actual:=True:C214
$test.assert()

$test.given:="utils_lazyAnd(True, True, True, True): no excepts"
$test.should:="return null"
$test.expected:=True:C214
$test.actual:=ut_exceptions=Null:C1517
$test.assert()
ut_exceptions:=Null:C1517

$test.given:="utils_lazyOr(True, error)"
$test.should:="return true"
$test.expected:=utils_lazyOr(Formula:C1597(True:C214); Formula:C1597($test.help))
$test.actual:=True:C214
$test.assert()

$test.given:="utils_lazyOr(True, error): no excepts"
$test.should:="return null"
$test.expected:=True:C214
$test.actual:=ut_exceptions=Null:C1517
$test.assert()

ut_exceptions:=Null:C1517

$test.given:="utils_lazyOr(False, False, False, True)"
$test.should:="return true"
$test.expected:=utils_lazyOr(Formula:C1597(2=4); Formula:C1597(False:C215)\
; Formula:C1597(Not:C34(True:C214)); Formula:C1597(True:C214=True:C214))
$test.actual:=True:C214
$test.assert()

$test.given:="utils_lazyOr(False, False, False, Truer): no excepts"
$test.should:="return null"
$test.expected:=True:C214
$test.actual:=ut_exceptions=Null:C1517
$test.assert()

ut_exceptions:=Null:C1517
ON ERR CALL:C155($error)