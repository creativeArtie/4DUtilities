Class extends Check
Class constructor
	var $1 : Real
	var $2 : Real
	var $3 : Boolean
	var $4 : Boolean
	
	This:C1470.min:=utils_setParam($1;Is real:K8:4;0)
	This:C1470.max:=utils_setParam($2;Is real:K8:4;100)
	This:C1470.minClosed:=utils_setParam($3;Is boolean:K8:9;True:C214)
	This:C1470.maxClosed:=utils_setParam($4;Is boolean:K8:9;True:C214)
	utils_countParams(4;Count parameters:C259)
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
Function getMessage
	$0:="$1 is not within "+String:C10($isMin)+" and "+String:C10($isMax)