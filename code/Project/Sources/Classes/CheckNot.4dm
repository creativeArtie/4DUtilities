Class extends Check
Class constructor
	var $1 : cs:C1710.Check
	Case of 
		: (Count parameters:C259=1)
			This:C1470.check:=$1
		Else 
			ASSERT:C1129(False:C215; "Wrong number of parameters.")
	End case 
Function setValue
	var $1 : Variant
	var $1 : Variant
	Super:C1706.setValue($1)
	Case of 
		: (Count parameters:C259=1)
			This:C1470.value:=$1
		Else 
			ASSERT:C1129(False:C215; "Not enough parameters.")
	End case 
	This:C1470.check.setValue($1)
	var $1 : Variant
	Super:C1706.setValue($1)
	
Function test
	var $1 : Variant
	Case of 
		: (Count parameters:C259=1)
			This:C1470.value:=$1
		Else 
			ASSERT:C1129(False:C215; "Not enough parameters.")
	End case 
	$0:=Not:C34(This:C1470.check())
	
Function getMessageTemplate
	$0:=Replace string:C233($checker.getMessageTemplate(); "not "; ""; 1)
	