Class extends Checker
Class constructor($minParam : Variant; $maxParam : Variant; \
$minIncludeParam : Boolean; $maxIncludeParam : Boolean)
	
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $min : Variant
	If (wk_assertLocalParameter($assert; ->$min))
		$min:=$minParam
	End if 
	var $max : Variant
	If (wk_assertLocalParameter($assert; ->$max))
		$max:=$maxParam
	End if 
	var $minInclude : Boolean
	If (wk_assertLocalParameter($assert; ->$minInclude))
		$minInclude:=$minIncludeParam
	End if 
	var $maxInclude : Variant
	If (wk_assertLocalParameter($assert; ->$maxInclude))
		$maxInclude:=$maxIncludeParam
	End if 
	
	wk_assertParameterCount($assert)
	
	Super:C1705("$1 is not within "+String:C10($min)+" and "+String:C10($max))
	This:C1470.min:=$min
	This:C1470.max:=$max
	This:C1470.minClosed:=$minInclude
	This:C1470.maxClosed:=$maxInclude
	
	
Function test($value : Variant)->$result : Boolean
	var $value : Variant
	var $isMin : Boolean
	var $isMax : Boolean
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