//%attributes = {}
#DECLARE->$message : Text
var $callers : Collection
var $caller : Object
$callers:=Get call chain:C1662
ASSERT:C1129($callers.length>=2)

var $project : Text
For each ($caller; $callers) While ($message="")
	If ($project="")
		$project:=$caller.database
	Else 
		If ($caller.database#$project)
			$message:=$caller.name+"("+$caller.type+"):"+String:C10($caller.line)+":"
		End if 
	End if 
End for each 