Class extends Check
Class constructor
	var $1 : 4D:C1709.Function
	var $2 : cs:C1710.Check
	Case of 
		: (Count parameters:C259=2)
			This:C1470.function:=$1
			This:C1470.check:=$2
		Else 
			ASSERT:C1129(False:C215; "Missing parameters.")
	End case 
	
Function setValue
	var $1 : Variant
	Super:C1706.setValue($1)
	Case of 
		: (Count parameters:C259=1)
			This:C1470.value:=$1
		Else 
			ASSERT:C1129(False:C215; "Not enough parameters.")
	End case 
	This:C1470.check.setValue($1)
	
Function test
	If (This:C1470.function.call())
		$0:=This:C1470.check.test()
	Else 
		$0:=True:C214
	End if 
	
Function getMessageTemplate
	$0:=This:C1470.check.getMessageTemplate()