Class extends Checker
Class constructor($formatterParam : cs:C1710.Formatter)
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $formatter : cs:C1710.Formatter
	If (wk_assertLocalParameter($assert; ->$formatter))
		$formatter:=$formatterParam
	End if 
	Super:C1705("$1 does not match a known "+$formatter.type+" format.")
	This:C1470.formatter:=$formatter
	
	wk_assertParameterCount($assert)
	
	
Function test($valueParam : Text)->$result : Boolean
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $value : Text
	If (wk_assertLocalParameter($assert; ->$value))
		$value:=$valueParam
	End if 
	
	wk_assertParameterCount($assert)
	
	This:C1470.formatter.update($value)
	$result:=This:C1470.formatter.findMatch