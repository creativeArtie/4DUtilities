Class extends Check
Class constructor($min : Variant; $max : Variant; \
$minInclude : Boolean; $maxInclude : Boolean)
	var $1 : Variant
	var $2 : Variant
	var $3 : Boolean
	var $4 : Boolean
	
	$type:=utils_getRequireValue(Value type:C1509($1); Formula:C1597(\
		($1=Is real:K8:4) | ($1=Is longint:K8:6) | \
		($1=Is time:K8:8) | ($1=Is date:K8:7)\
		))
	$max:=utils_getRequireValue($2; $type)
	
	This:C1470.min:=utils_getRequireValue($1; Formula:C1597($1<=$max))
	This:C1470.max:=$max
	This:C1470.minClosed:=utils_getOptionValue($3; Is boolean:K8:9; True:C214)
	This:C1470.maxClosed:=utils_getOptionValue($4; Is boolean:K8:9; True:C214)
	utils_countParams(4; Count parameters:C259)
Function test
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
Function getMessageTemplate
	$0:="$1 is not within "+String:C10($isMin)+" and "+String:C10($isMax)