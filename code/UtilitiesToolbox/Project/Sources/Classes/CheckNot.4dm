Class extends Checker
Class constructor($checkerParam : cs:C1710.Checker)
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $checker : cs:C1710.Checker
	If (wk_assertLocalParameter($assert; ->$checker))
		$checker:=$checkerParam
		ASSERT:C1129(OB Instance of:C1731($checkerParam; cs:C1710.Checker))
	End if 
	
	wk_assertParameterCount($assert)
	var $warning; $error : Text
	$warning:=Replace string:C233($checker.warningTemplate; "not "; ""; 1)
	$error:=Replace string:C233($checker.errorTemplate; "not "; ""; 1)
	Super:C1705($warning; $error)
	This:C1470.checker:=$checker
	
Function test($value : Variant)->$result : Boolean
	$0:=Not:C34(This:C1470.checker.test($value))