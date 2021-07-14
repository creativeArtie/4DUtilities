//%attributes = {}
#DECLARE->$caller : Object
var $ready : Boolean
var $callers : Collection
$callers:=Get call chain:C1662
ASSERT:C1129($callers.length>=2)
var $searching : Boolean
$searching:=True:C214
If (Not:C34(Undefined:C82(<>HOST_DATABASE)))
	For each ($caller; $callers) While ($searching)
		If ($caller.database=<>HOST_DATABASE)
			$searching:=False:C215
		End if 
	End for each 
Else 
	$caller:=$callers[2]
End if 