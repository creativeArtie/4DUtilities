//%attributes = {}
#DECLARE($input : Object; $default : Variant)->$value : Variant

C_TEXT:C284(${3})

If (OB Is defined:C1231($input))
	var $pointer : Object
	$pointer:=$input
	
	var $i : Integer
	$i:=3
	
	var $findKey : Boolean
	$findKey:=True:C214
	
	For ($i; 3; Count parameters:C259)
		If (OB Is defined:C1231($pointer; ${$i}))
			$value:=$pointer[${$i}]
			If ((Value type:C1509($pointer[${$i}]))=Is object:K8:27)
				$pointer:=$pointer[${$i}]
			Else 
				$findKey:=$i=Count parameters:C259
				$i:=Count parameters:C259
			End if 
		Else 
			$findKey:=False:C215
			$i:=Count parameters:C259
		End if 
	End for 
	
	If ($findKey)
		If (Value type:C1509($value)#Value type:C1509($default))
			$value:=$default
		End if 
	Else 
		$value:=$default
	End if 
Else 
	$value:=$default
End if 