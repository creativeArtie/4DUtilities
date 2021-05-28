declare_failed

var $test; $test2 : cs:C1710.ErrorDeclare
$test:=cs:C1710.ErrorDeclare.new()

$test2:=cs:C1710.ErrorDeclare.new(213)

$test2.test()

declare_free