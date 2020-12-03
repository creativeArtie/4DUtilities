//%attributes = {}
// Sets the parameters
C_VARIANT:C1683($0)  // output
C_VARIANT:C1683($1)  // actual parameter
C_OBJECT:C1216($2)  // require type
C_VARIANT:C1683($3)  // default value
C_OBJECT:C1216($caller)
$caller:=Get call chain:C1662[1]
$message:=" type error at "+$caller.name+" line "+String:C10($caller.line)

Case of 
	: (Count parameters:C259=2)
		ASSERT:C1129(Value type:C1509($1)=Is object:K8:27;"Parameter"+$message)
		ASSERT:C1129(OB Instance of:C1731($1;$2);"Parameter"+$message)
		$0:=$1
	: (Count parameters:C259=3)
		If (Value type:C1509($1)#Is undefined:K8:13)
			ASSERT:C1129(Value type:C1509($3)=$2;"Default"+$message)
			ASSERT:C1129(OB Instance of:C1731($3;$2};"Default"+$message)
			$0:=$3
		Else 
			ASSERT:C1129(Value type:C1509($1=$2;"Parameter"+$message))
			ASSERT:C1129(OB Instance of:C1731($1;$2);"Parameter"+$message)
			$0:=$2
		End if 
End case 
