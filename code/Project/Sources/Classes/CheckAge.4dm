Class extends Check
Class constructor
	var $1 : Real
	var $2 : Real
	
	var $count : Real
	This:C1470.min:=utils_assertParameter($1; ->$count; Count parameters:C259)
	This:C1470.max:=utils_assertParameter($2; ->$count; Count parameters:C259)
	utils_assertParameterCount($count; Count parameters:C259)
	
Function test->$result : Boolean
	var $value : Variant  //! value to check, can be number or date
	var $age : Integer  //! the calculated age
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