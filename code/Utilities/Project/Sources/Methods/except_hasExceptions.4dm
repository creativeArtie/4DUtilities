//%attributes = {}
//! #brief Test for uncaught exceptions with AJ_Tools_UnitTest
//! #author Wai-Kin Chau

#DECLARE($unitTest : Object)->$result : Boolean

var $count : Real
$unitTest:=utils_assertParameter($1; ->$count; Count parameters:C259)
utils_assertParameterCount($count; Count parameters:C259)


var $exceptions : Collection
$exceptions:=except_getExceptions_
$result:=$exceptions.length#0

If ($unitTest#Null:C1517)
	$unitTest.given:="Missing exception check"
	$unitTest.should:="return no exception"
	$unitTest.expected:=False:C215
	$unitTest.actual:=$result
	$unitTest.assert()
	Use (Storage:C1525.utils_except.uncaught)
		OB REMOVE:C1226(Storage:C1525.utils_except.uncaught; String:C10(Current process:C322))
	End use 
End if 
