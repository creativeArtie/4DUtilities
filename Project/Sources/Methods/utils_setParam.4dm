//%attributes = {"shared":true}
// Sets the parameters
C_VARIANT:C1683($0;$result)  // output
C_VARIANT:C1683($1;$actual)  // actual parameter
C_VARIANT:C1683($2;$type)  // require type
C_VARIANT:C1683($3;$default)  // default value

Case of 
	: (Count parameters:C259=1)
		$actual:=$1
	: (Count parameters:C259=2)
		$actual:=$1
		$type:=$2
	: (Count parameters:C259=3)
		$actual:=$1
		$type:=$2
		$default:=$3
End case 


C_OBJECT:C1216($caller)
$caller:=utils_getMethodCaller(Current method name:C684)
$message:=" type error at "+$caller.name+" line "+String:C10($caller.line)

If (Value type:C1509($type)=Is object:K8:27)
	$isObject:=OB Instance of:C1731($type;4D:C1709.Class)
Else 
	$isObject:=False:C215
End if 

Case of 
	: (Count parameters:C259=2)
		If ($isObject)
			ASSERT:C1129(OB Instance of:C1731($actual;$type);"Parameter"+$message)
			
		Else 
			If ($type#Is variant:K8:33)
				ASSERT:C1129(Value type:C1509($actual)=$type;"Parameter"+$message)
			End if 
			
		End if 
		$result:=$actual
		
		
	: (Count parameters:C259=3)
		If (Value type:C1509($actual)=Is undefined:K8:13)
			If ($isObject)
				ASSERT:C1129(OB Instance of:C1731($default;$type);"Default"+$message)
				
			Else 
				If ($type#Is variant:K8:33)
					ASSERT:C1129(Value type:C1509($default)=$type;"Default"+$message)
				End if 
				
			End if 
			$result:=$default
			
			
		Else 
			If ($isObject)
				ASSERT:C1129(OB Instance of:C1731($actual;$type);"Parameter"+$message)
				
			Else 
				If ($type#Is variant:K8:33)
					ASSERT:C1129(Value type:C1509($actual)=$type;"Parameter"+$message)
				End if 
				
			End if 
			$result:=$actual
		End if 
End case 

$0:=$result