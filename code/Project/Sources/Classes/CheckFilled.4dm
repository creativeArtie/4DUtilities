Class extends Check
Function test
	var $value : Variant
	$value:=This:C1470.getValue()
	Case of 
		: (Value type:C1509($value)=Is text:K8:3)
			$0:=$value#""
		: (Value type:C1509($value)=Is time:K8:8)
			$0:=$value#?00:00:00?
		: (Value type:C1509($value)=Is date:K8:7)
			$0:=$value#!00-00-00!
		Else 
			$0:=$value#Null:C1517
	End case 
	
Function getMessage
	$0:="$1 is not filled."