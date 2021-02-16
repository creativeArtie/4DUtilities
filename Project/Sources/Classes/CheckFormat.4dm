Class extends Check
Class constructor($filled : Boolean)
	Super:C1705()
	This:C1470.filled:=utils_setParam($filled; Is boolean:K8:9; False:C215)
	This:C1470.message:=""
	utils_countParams(1; Count parameters:C259)
Function test->$result : Boolean
	var $value : Object
	$value:=Super:C1706.getValue()
	$result:=True:C214
	$continue:=True:C214
	
	If ($value.value="")
		If (This:C1470.filled)
			This:C1470.message:="$1 is not filled"
			$result:=False:C215
		Else 
			$continue:=False:C215
		End if 
	End if 
	
	If ($continue & $result)
		If (Not:C34($value.findMatch))
			This:C1470.message:="$1 does not match a known phone format."
			$result:=False:C215
			$continue:=False:C215
		End if 
	End if 
	
Function getMessage()->$template : Text
	$template:=This:C1470.message