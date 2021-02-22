Class extends Check
Class constructor($function : 4D:C1709.Function; $template : Text)
	This:C1470.tester:=utils_getRequireValue($1; 4D:C1709.Function)
	This:C1470.template:=utils_getOptionValue($2; "$1 is not pass "\
		+This:C1470.tester.source; Is text:K8:3)
Function test->$result : Boolean
	var $value : Variant
	$value:=This:C1470.getValue()
	$result:=This:C1470.tester.call(New object:C1471; $value)
Function getMessageTemplate->$template : Text
	$template:=This:C1470.template
	