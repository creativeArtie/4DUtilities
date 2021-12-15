Class constructor($nameParam : Text; $typeParam : Text; $commentParam : cs:C1710.RawLine)
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	If (wk_assertObjectParameter($assert; This:C1470; "name"))
		This:C1470.name:=$nameParam
	End if 
	
	If (wk_assertObjectParameter($assert; This:C1470; "type"))
		This:C1470.type:=$typeParam
	End if 
	
	var $comment
	If (wk_assertLocalParameter($assert; ->$comment))
		$comment:=$commentParam
	End if 
	
	This:C1470.declareRow:=$comment.row
	This:C1470.comment:=$comment.doc
	
	wk_assertParameterCount($assert)
	
	This:C1470.uses:=New collection:C1472
	Case of 
		: (This:C1470.name="$@")
			This:C1470.scope:="local"
		: (This:C1470.name="<>@")
			This:C1470.scope:="global"
		Else 
			This:C1470.scope:="processor"
	End case 
Function addUse($line : cs:C1710.RawLine)
	This:C1470.uses.append($line)