//%attributes = {"shared":true}
// __UNIT_TEST

$test:=AJ_UnitTest.new("Paramter Checker"; Current method name:C684)

$test.given:="1+1"
$test.should:="return 2"
$test.expected:=2
$test.actual:=1+1
$test.assert()

$test.given:="123*456"
$test.should:="return 56088"
$test.expected:=56088
$test.actual:=123*456
$test.assert()
