Class constructor($input1Param : Text; $input2Param : Text)
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	If (wk_assertObjectParameter($assert; This:C1470; "param1"))
		This:C1470.param1:=$input1Param
	End if 
	If (wk_assertObjectParameter($assert; This:C1470; "param2"; "World"))
		This:C1470.param2:=$input2Param
	End if 
	wk_assertParameterCount($assert)
	
	