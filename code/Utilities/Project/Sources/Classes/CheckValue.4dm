Class extends Check
Class constructor($min : Variant; $max : Variant; \
$minInclude : Boolean; $maxInclude : Boolean)
	var $1 : Variant
	var $2 : Variant
	var $3 : Boolean
	var $4 : Boolean
	
	var $count : Real
	This:C1470.min:=utils_assertParameter($1; ->$count; Count parameters:C259)
	This:C1470.max:=utils_assertParameter($2; ->$count; Count parameters:C259)  //! #todo check type
	
	This:C1470.minClosed:=utils_assertParameter($3; ->$count; Count parameters:C259; True:C214)
	This:C1470.maxClosed:=utils_assertParameter($4; ->$count; Count parameters:C259; True:C214)
	
	utils_assertParameterCount($count; Count parameters:C259)
	
	
Function test->$result : Boolean
	var $value : Variant
	var $isMin : Boolean
	var $isMax : Boolean
	$value:=This:C1470.getValue
	If (This:C1470.minClosed)
		$isMin:=$value>=This:C1470.min
	Else 
		$isMin:=$value>This:C1470.min
	End if 
	
	If (This:C1470.maxClosed)
		$isMax:=$value<=This:C1470.max
	Else 
		$isMax:=$value<This:C1470.max
	End if 
	
	$0:=$isMin & $isMax
Function getMessageTemplate->$template : Text
	$0:="$1 is not within "+String:C10(This:C1470.min)+" and "+String:C10(This:C1470.max)