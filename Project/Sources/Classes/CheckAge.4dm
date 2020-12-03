Class extends Check
Class constructor
	var $1 : Integer
	var $min : Integer
	var $2 : Integer
	var $max : Integer
	
	This:C1470.min:=utils_setParam($1;Is real:K8:4;18)
	This:C1470.max:=utils_setParam($2;Is real:K8:4;100)
	utils_countParams(2;Count parameters:C259)
	
Function test
	var $value : Variant
	$value:=This:C1470.getValue()
	Case of 
		: (Value type:C1509($value)=Is date:K8:7)
			$age:=Year of:C25(Current date:C33())-Year of:C25($value)
		Else 
			$age:=$value
	End case 
	$0:=(This:C1470.min<=$age) & ($age<=This:C1470.max)
	
Function getMessage
	$0:="$1 is not within the ages of "+String:C10(This:C1470.min)+\
		" and "+String:C10(This:C1470.max)