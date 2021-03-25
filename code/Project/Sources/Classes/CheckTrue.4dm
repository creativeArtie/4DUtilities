Class extends Check
Class constructor($function : 4D:C1709.Function; $template : Text)
	
	var $count : Real
	This:C1470.tester:=utils_assertParameter($1; ->$count; Count parameters:C259)
	This:C1470.template:=utils_assertParameter($2; ->$count; Count parameters:C259; \
		"$1 is not pass "+This:C1470.tester.source)
	utils_assertParameterCount($count; Count parameters:C259)
	
Function test->$result : Boolean
	var $value : Variant
	$value:=This:C1470.getValue()
	$result:=This:C1470.tester.call(New object:C1471; $value)
Function getMessageTemplate->$template : Text
	$template:=This:C1470.template
	