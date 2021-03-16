Class extends Check
Class constructor($filled : Boolean; $type : Text)
	Super:C1705()
	This:C1470.filled:=utils_getOptionValue($filled; False:C215; Is boolean:K8:9)
	This:C1470.type:=utils_getOptionValue($type; "phone"; Is text:K8:3)
	This:C1470.message:=""
	utils_countParams(1; Count parameters:C259)
Function test->$result : Boolean
	var $value : Object
	$value:=Super:C1706.getValue()
	var $continue : Boolean
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
			This:C1470.message:="$1 does not match a known "+This:C1470.type+" format."
			$result:=False:C215
			$continue:=False:C215
		End if 
	End if 
	
Function getMessageTemplate()->$template : Text
	$template:=This:C1470.message