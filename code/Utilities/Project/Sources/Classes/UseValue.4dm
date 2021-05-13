Class extends Use
Class constructor
	var $1 : Variant
	var $2 : Text
	var $count : Real
	var $value : Variant
	$value:=utils_assertParameter($1; ->$count; Count parameters:C259)
	Super:C1705(utils_assertParameter($2; ->$count; Count parameters:C259; ""))
	This:C1470.value:=$value
	utils_assertParameterCount($count; Count parameters:C259)
	
Function getValue->$answer : Variant
	$0:=This:C1470.value