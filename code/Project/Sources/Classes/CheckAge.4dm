Class extends Check
Class constructor
	var $1 : Real
	var $min : Real
	var $2 : Real
	var $max : Real
	
	This:C1470.min:=utils_getOptionValue($1; 18; Is real:K8:4)
	This:C1470.max:=utils_getOptionValue($2; 100; Is real:K8:4)
	utils_countParams(2; Count parameters:C259)
	
Function test->$result : Boolean
	var $value : Variant
	var $age : Integer
	$value:=This:C1470.getValue()
	Case of 
		: (Value type:C1509($value)=Is date:K8:7)
			$age:=Year of:C25(Current date:C33())-Year of:C25($value)
		Else 
			$age:=$value
	End case 
	$0:=(This:C1470.min<=$age) & ($age<=This:C1470.max)
	
Function getMessageTemplate->$template : Text
	$0:="$1 is not within the ages of "+String:C10(This:C1470.min)+\
		" and "+String:C10(This:C1470.max)