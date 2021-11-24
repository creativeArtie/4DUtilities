Class constructor($fileParam : 4D:C1709.File; $attrsParam : Object; $linesParam : Collection)
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	If (wk_assertObjectParameter($assert; This:C1470; "file"))
		This:C1470.file:=$fileParam
	End if 
	
	If (wk_assertObjectParameter($assert; This:C1470; "attrs"))
		This:C1470.attrs:=$attrsParam
	End if 
	
	If (wk_assertObjectParameter($assert; This:C1470; "lines"))
		This:C1470.lines:=$linesParam
	End if 
	
	wk_assertParameterCount($assert)
	