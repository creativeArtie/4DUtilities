Class extends Check
Class constructor($filled : Boolean; $type : Text)
	Super:C1705()
	var $count : Real
	This:C1470.filled:=utils_assertParameter($filled; ->$count; Count parameters:C259; False:C215)
	This:C1470.type:=utils_assertParameter($type; ->$count; Count parameters:C259; "phone")
	utils_assertParameterCount(1; Count parameters:C259)
	
	This:C1470.message:=""
	
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