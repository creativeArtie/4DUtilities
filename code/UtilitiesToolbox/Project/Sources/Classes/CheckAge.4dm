Class extends Checker
Class constructor($minParam : Real; $maxParam : Real)
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $min : Real
	If (wk_assertLocalParameter($assert; ->$min; 18))
		$min:=$minParam
	End if 
	
	var $max : Real
	If (wk_assertLocalParameter($assert; ->$max; 100))
		$max:=$maxParam
	End if 
	wk_assertParameterCount($assert)
	Super:C1705("$1 is not within the ages of "+String:C10($min)+\
		" and "+String:C10($max))
	This:C1470.min:=$min
	This:C1470.max:=$max
	
Function test($value : Variant)->$result : Boolean
	var $age : Integer  //! the calculated age
	Case of 
		: (Value type:C1509($value)=Is date:K8:7)
			$age:=Year of:C25(Current date:C33())-Year of:C25($value)
		Else 
			$age:=Num:C11($value)
	End case 
	$0:=(This:C1470.min<=$age) & ($age<=This:C1470.max)