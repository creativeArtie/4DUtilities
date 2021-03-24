//%attributes = {}
#DECLARE($input : Variant; $count : Integer; \
$required : Integer; $default : Variant)->$result : Variant

var $caller : Object
var $method : Object
$method:=Get call chain:C1662[1]
$caller:=Get call chain:C1662[2]
var $error : Text
$error:=$caller.name+":"+String:C10($call.line)+" requires at least "\
+$required+" paramters for "+$method.name+"."
Case of 
	: (Count parameters:C259=3)
		ASSERT:C1129($count<=$required; $error)
		$result:=$input
	: (Count parameters:C259=4)
		If ($count<=$required)
			$result:=$input
		Else 
			$result:=$default
		End if 
End case 
