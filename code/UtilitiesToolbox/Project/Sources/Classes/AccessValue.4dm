Class extends Accessor
Class constructor($pointerParam : Pointer; $nameParam : Text)
	Super:C1705($nameParam)
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	If (wk_assertObjectParameter($assert; This:C1470; "pointer"))
		This:C1470.pointer:=$pointerParam
	End if 
	
	wk_assertParameterCount($assert)
	
Function getValue->$value : Variant
	$value:=This:C1470.pointer->
Function updateWidget($typeParam : Integer)