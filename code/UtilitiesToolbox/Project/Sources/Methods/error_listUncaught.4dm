//%attributes = {}
#DECLARE->$list : Collection
assertNoParameters(Count parameters:C259)
var $process : Text
$process:=String:C10(Current process:C322)
If (Not:C34(OB Is defined:C1231(Storage:C1525.utils_except.uncaught; $process)))
	Use (Storage:C1525.utils_except.uncaught)
		Storage:C1525.utils_except.uncaught[$process]:=New shared collection:C1527
	End use 
End if 

$list:=Storage:C1525.utils_except.uncaught[$process]
