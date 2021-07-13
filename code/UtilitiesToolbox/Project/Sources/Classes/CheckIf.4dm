Class extends Checker
Class constructor($onlyWhenParam : 4D:C1709.Function; $checkerParam : cs:C1710.Checker)
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $onlyWhen : 4D:C1709.Function
	If (wk_assertLocalParameter($assert; ->$onlyWhen))
		$onlyWhen:=$onlyWhenParam
	End if 
	
	var $checker : cs:C1710.Checker
	If (wk_assertLocalParameter($assert; ->$checker))
		$checker:=$checkerParam
	End if 
	
	wk_assertParameterCount($assert)
	
	Super:C1705($checker.warningTemplate; $checker.errorTemplate)
	This:C1470.onlyWhen:=$onlyWhen
	This:C1470.checker:=$checker
	
Function test($value : Variant)->$result : Boolean
	If (This:C1470.onlyWhen.call())
		$0:=This:C1470.checker.test($value)
	Else 
		$0:=True:C214
	End if 