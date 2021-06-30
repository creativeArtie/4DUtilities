Class extends Checker
Class constructor
	Super:C1705("$1 is not filled.")
Function test($valueParam : Variant)->$result : Boolean
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $value
	If (wk_assertLocalParameter($assert; ->$value))
		$value:=$valueParam
	End if 
	
	wk_assertParameterCount($assert)
	
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