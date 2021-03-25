//%attributes = {}
#DECLARE($input : Variant; $forParam : Real; $count : Integer; \
$default : Variant)->$result : Variant

var $caller : Object
var $method : Object
$method:=Get call chain:C1662[1]
$caller:=Get call chain:C1662[2]
var $error : Text
$error:=$caller.name+":"+String:C10($caller.line)+" requires at least "\
+String:C10($forParam)+" paramters for "+$method.name+"."
Case of 
	: (Count parameters:C259=3)
		ASSERT:C1129($forParam<=$count; $error)
		$result:=$input
	: (Count parameters:C259=4)
		If ($count<=$forParam)
			$result:=$input
		Else 
			$result:=$default
		End if 
End case 
