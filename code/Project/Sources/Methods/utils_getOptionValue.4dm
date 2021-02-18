//%attributes = {}
#DECLARE($input : Variant; $default : Variant; $checker : Variant)->$output : Variant

var $methodCheck : 4D:C1709.Function
var $passing : Boolean
$passing:=True:C214

If (Count parameters:C259=3)
	$methodCheck:=utils_getCheckFunc_(\
		(Value type:C1509($input)=Is object:K8:27) & (Value type:C1509($default)=Is object:K8:27); \
		->$passing; $checker)
Else 
	$methodCheck:=utils_getCheckFunc_(\
		(Value type:C1509($input)=Is object:K8:27) & (Value type:C1509($default)=Is object:K8:27); \
		->$passing)
End if 

If ($passing)
	$passing:=$methodCheck.call(New object:C1471; $default)
	ASSERT:C1129($passing; "Failed default : "+$methodCheck.source)
End if 

If ($passing)
	If ((Value type:C1509($input)=Is undefined:K8:13) | (Value type:C1509($input)=Is null:K8:31))
		$output:=$default
	Else 
		$passing:=$methodCheck.call(New object:C1471; $input)
		ASSERT:C1129($passing; "Failed value: "+$methodCheck.source)
		If ($passing)
			$output:=$input
		Else 
			$output:=$default
		End if 
	End if 
End if 