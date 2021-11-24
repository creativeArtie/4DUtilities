Class constructor($codeParam : Text; $commentParam : Text; $docParam : Text; $rowParam : Integer)
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	// Check parameters with wk_localParam or wk_objectParam
	If (wk_assertObjectParameter($assert; This:C1470; "code"))
		This:C1470.code:=$codeParam
	End if 
	If (wk_assertObjectParameter($assert; This:C1470; "comment"))
		This:C1470.comment:=$commentParam
	End if 
	
	If (wk_assertObjectParameter($assert; This:C1470; "doc"))
		This:C1470.doc:=$docParam
	End if 
	
	If (wk_assertObjectParameter($assert; This:C1470; "row"))
		This:C1470.row:=$rowParam
	End if 
	
	wk_assertParameterCount($assert)
	