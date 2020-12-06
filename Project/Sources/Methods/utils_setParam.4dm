//%attributes = {}
// Sets the parameters
C_VARIANT:C1683($0)  // output
C_VARIANT:C1683($1)  // actual parameter
C_LONGINT:C283($2)  // require type
C_VARIANT:C1683($3)  // default value
C_OBJECT:C1216($caller)
$caller:=Get call chain:C1662[1]
$message:=" type error at "+$caller.name+" line "+String:C10($caller.line)

Case of 
	: (Count parameters:C259=2)
		If ($2#Is variant:K8:33)
			ASSERT:C1129(Value type:C1509($1)=$2;"Parameter"+$message)
		End if 
		$0:=$1
	: (Count parameters:C259=3)
		If (Value type:C1509($1)=Is undefined:K8:13)
			If ($2#Is variant:K8:33)
				ASSERT:C1129(Value type:C1509($3)=$2;"Default"+$message)
			End if 
			$0:=$3
		Else 
			If ($2#Is variant:K8:33)
				ASSERT:C1129(Value type:C1509($1)=$2;"Parameter"+$message))
			End if 
			$0:=$1
		End if 
End case 
