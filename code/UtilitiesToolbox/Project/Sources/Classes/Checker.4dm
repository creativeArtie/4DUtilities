Class constructor($warningParam : Text; $errorParam : Text)
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	If (wk_assertObjectParameter($assert; This:C1470; "warningTemplate"))
		This:C1470.warningTemplate:=$warningParam
	End if 
	If (wk_assertObjectParameter($assert; This:C1470; "errorTemplate"; This:C1470.warningTemplate))
		This:C1470.errorTemplate:=$errorParam
	End if 
	
	wk_assertParameterCount($assert)
	
Function test($value : Variant)->$result : Boolean
	ASSERT:C1129(False:C215; "Needs implementation.")