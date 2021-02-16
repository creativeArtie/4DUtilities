//%attributes = {"shared":true}
// Sets the parameters
#DECLARE($actual : Variant; $type : Variant; $default : Variant)->$result : Variant

var $caller : Object
var $message : Text
$caller:=utils_getMethodCaller(Current method name:C684)
$message:=" type error at "+$caller.name+" line "+String:C10($caller.line)

var $classType : Integer
$classType:=1
var $functionType : Integer
$functionType:=2
var $variantType : Integer
$variantType:=3
var $otherType : Integer
$otherType:=3

var $checkType : Integer
Case of 
	: (Value type:C1509($type)=Is object:K8:27)
		Case of 
			: (OB Instance of:C1731($type; 4D:C1709.Class))
				$checkType:=$classType
			: (OB Instance of:C1731($type; 4D:C1709.Function))
				$checkType:=$functionType
		End case 
	: (Value type:C1509($type)=Is variant:K8:33)
		$checkType:=$variantType
	Else 
		$checkType:=$otherType
End case 


Case of 
	: (Count parameters:C259=2)
		Case of 
			: ($checkType=$classType)
				ASSERT:C1129(OB Instance of:C1731($actual; $type); "Parameter"+$message)
				
			: ($checkType=$functionType)
				ASSERT:C1129($type.call(Null:C1517; $actual); "Parameter"+$message)
			Else 
				If ($checkType=$variantType)
					ASSERT:C1129(Value type:C1509($actual)=$type; "Parameter"+$message)
				End if 
				
		End case 
		$result:=$actual
		
	: (Count parameters:C259=3)
		If (Value type:C1509($actual)=Is undefined:K8:13)
			Case of 
				: ($checkType=$classType)
					ASSERT:C1129(OB Instance of:C1731($default; $type); "Default"+$message)
					
				: ($checkType=$functionType)
					$result:=New object:C1471("result:"; "")
					ASSERT:C1129($type.call(Null:C1517; $default); "Default"+$message)
					
				: ($checkType#$variantType)
					ASSERT:C1129(Value type:C1509($default)=$type; "Default"+$message)
					
			End case 
			$result:=$default
			
		Else 
			Case of 
				: ($checkType=$classType)
					ASSERT:C1129(OB Instance of:C1731($actual; $type); "Parameter"+$message)
					
				: ($checkType=$functionType)
					ASSERT:C1129($type.call(Null:C1517; $actual); "Parameter"+$message)
					
				: ($checkType#$variantType)
					ASSERT:C1129(Value type:C1509($actual)=$type; "Parameter"+$message)
			End case 
			$result:=$actual
		End if 
End case 