//%attributes = {"shared":true}
// __UNIT_TEST


$test:=AJ_UnitTest.new("utils_countParams, utils_setParam";Current method name:C684;"Utlities")

$error:=Method called on error:C704
ON ERR CALL:C155("utils_ut_exceptions")

$test.given:="utils_setParam($1;is text;\"Hello\")"
$test.should:="return Hello"
$test.expected:="Hello"
$test.actual:=utils_setParam($1;Is text:K8:3;"Hello")
$test.assert()

utils_setParam($1;Is text:K8:3)
$test.given:="utils_setParam($1;is text)"
$test.should:="return blank"
$test.expected:="Assert failed: Parameter type error at ut_params line 15"
$test.actual:=ut_exceptions.text[0]
$test.assert()

ut_exceptions:=Null:C1517
utils_countParams(2;Count parameters:C259)
$test.given:="utils_setParam($1;is text)"
$test.should:="return blank"
$test.expected:=False:C215
$test.actual:=OB Is defined:C1231(ut_exceptions)
$test.assert()

utils_countParams(2;4)
$test.given:="utils_setParam($1;is text)"
$test.should:="return blank"
$test.expected:="Assert failed: Method ut_params needs at most 2 parameters"
$test.actual:=ut_exceptions.text[0]
$test.assert()
ON ERR CALL:C155($error)
