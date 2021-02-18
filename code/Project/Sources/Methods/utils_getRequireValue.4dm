//%attributes = {}
#DECLARE($input : Variant; $checker : Variant)->$output : Variant

var $methodCheck : 4D:C1709.Function
var $passing : Boolean
$passing:=True:C214
$output:=$input

If (Count parameters:C259=3)
	$methodCheck:=utils_getCheckFunc_(Value type:C1509($input)=Is object:K8:27; \
		->$passing; $checker)
Else 
	$methodCheck:=utils_getCheckFunc_(Value type:C1509($input)=Is object:K8:27; \
		->$passing)
End if 

If ($passing)
	$passing:=$methodCheck.call(New object:C1471; $input)
	ASSERT:C1129($passing; "Failed default : "+$methodCheck.source)
End if 