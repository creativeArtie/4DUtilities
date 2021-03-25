//%attributes = {}
#DECLARE($input : Variant; $forParamPtr : Pointer; $count : Integer; \
$default : Variant)->$result : Variant

/// assumes that Compilation Path is set to "All variables are typed"

$forParamPtr->:=$forParamPtr->+1
var $caller : Object
var $method : Object
$method:=Get call chain:C1662[1]
$caller:=Get call chain:C1662[2]
var $error : Text
$error:=$caller.name+":"+String:C10($caller.line)+" requires at least "\
+String:C10($forParamPtr->)+" paramters for "+$method.name+"."
Case of 
	: (Count parameters:C259=3)
		ASSERT:C1129($forParamPtr-><=$count; $error)
		$result:=$input
	: (Count parameters:C259=4)
		If ($forParamPtr-><=$count)
			$result:=$input
		Else 
			$result:=$default
		End if 
End case 