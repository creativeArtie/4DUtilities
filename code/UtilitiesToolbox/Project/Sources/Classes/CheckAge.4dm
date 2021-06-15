Class extends Checker
Class constructor($min : Real; $max : Real)
	
	var $assert : Object
	$assert:=assertParameterSetup(Count parameters:C259)
	
	If (assertObjectParameter($assert; This:C1470; "min"))
		This:C1470.min:=$min
	End if 
	If (assertObjectParameter($assert; This:C1470; "max"))
		This:C1470.max:=$max
	End if 
	
	assertParameterCount($assert)
	
	
Function test($value : Variant)->$result : Boolean
	var $age : Integer  //! the calculated age
	Case of 
		: (Value type:C1509($value)=Is date:K8:7)
			$age:=Year of:C25(Current date:C33())-Year of:C25($value)
		Else 
			$age:=Num:C11($value)
	End case 
	$0:=(This:C1470.min<=$age) & ($age<=This:C1470.max)
	
Function getMessageTemplate($type : Real)->$template : Text
	$0:="$1 is not within the ages of "+String:C10(This:C1470.min)+\
		" and "+String:C10(This:C1470.max)