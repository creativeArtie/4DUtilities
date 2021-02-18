//%attributes = {}
#DECLARE($input : Variant; $checker : Variant; $valueType : Integer)->$output : Variant

var $methodCheck : 4D:C1709.Function
var $passing : Boolean
$passing:=True:C214
$output:=$input

Case of 
	: (Count parameters:C259=1)
		$methodCheck:=utils_getCheckFunc_(Value type:C1509($input)=Is object:K8:27; \
			->$passing)
	: (Count parameters:C259=2)
		If ($checker=Is pointer:K8:14)
			$methodCheck:=utils_getCheckFunc_(Value type:C1509($input)=Is object:K8:27; \
				->$passing; $checker; Value type:C1509($input)=Is pointer:K8:14)
		Else 
			$methodCheck:=utils_getCheckFunc_(Value type:C1509($input)=Is object:K8:27; \
				->$passing; $checker)
		End if 
		
	: (Count parameters:C259=3)
		$methodCheck:=utils_getCheckFunc_(Value type:C1509($input)=Is object:K8:27; \
			->$passing; $checker; Value type:C1509($input)=Is pointer:K8:14; \
			$valueType)
	Else 
		ASSERT:C1129(False:C215; "Not enough paramters")
		$passing:=False:C215
End case 

If ($passing)
	$passing:=$methodCheck.call(New object:C1471; $input)
	ASSERT:C1129($passing; "Failed default : "+$methodCheck.source)
End if 