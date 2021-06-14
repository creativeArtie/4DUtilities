//%attributes = {"shared":true}
assertNoParameters(Count parameters:C259)

var $process : Text
$process:=String:C10(Current process:C322)
Use (Storage:C1525.utils_except.escape)
	If (Storage:C1525.utils_except.escape.indexOf($process)=-1)
		Storage:C1525.utils_except.escape.push($process)
	End if 
End use 