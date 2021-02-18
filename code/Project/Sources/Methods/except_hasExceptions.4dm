//%attributes = {}
#DECLARE($unitTest : Object)->$result : Boolean

var $exceptions : Collection
$exceptions:=except_getExceptions
$result:=$exceptions.length#0

If ($unitTest#Null:C1517)
	$unitTest.given:="Missing exception check"
	$unitTest.should:="No exception should be found"
	$unitTest.expected:=False:C215
	$unitTest.actual:=$result
	$unitTest.assert()
	Use (Storage:C1525.utils_except.uncaught)
		OB REMOVE:C1226(Storage:C1525.utils_except.uncaught; String:C10(Current process:C322))
	End use 
End if 
