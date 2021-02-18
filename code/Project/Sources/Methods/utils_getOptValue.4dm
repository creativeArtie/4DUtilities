//%attributes = {}
#DECLARE($input : Variant; $default : Variant; $checker : Variant)->$output : Variant

var $methodCheck : 4D:C1709.Function
var $passing : Boolean
$passing:=True:C214
Case of 
	: (Count parameters:C259=2)
		$methodCheck:=Formula:C1597(True:C214)
	: (Count parameters:C259=3)
		Case of 
			: (Value type:C1509($checker)=Is object:K8:27)
				Case of 
					: (OB Instance of:C1731($checker; 4D:C1709.Function))
						$methodCheck:=$checker
					: (OB Instance of:C1731($checker; 4D:C1709.Class))
						If ((Value type:C1509($input)=Is object:K8:27) & (Value type:C1509($default)=Is object:K8:27))
							$methodCheck:=Formula:C1597(OB Instance of:C1731($1; $checker))
						Else 
							ASSERT:C1129(False:C215; "$input or the $default is not an object.")
							$passing:=False:C215
						End if 
					Else 
						ASSERT:C1129(False:C215; "$checker object must be a 4D.Function or a 4d.Class.")
						$passing:=False:C215
				End case 
			: (Value type:C1509($checker)=Is longint:K8:6)
				Case of 
					: (($checker=Is real:K8:4) | ($checker=Is longint:K8:6))
						$methodCheck:=Formula:C1597((Value type:C1509($1)=Is real:K8:4) | (Value type:C1509($1)=Is longint:K8:6))
					: ($checker=Is variant:K8:33)
						$methodCheck:=Formula:C1597(True:C214)
					: (($checker=Is undefined:K8:13) | ($checker=Is null:K8:31))
						ASSERT:C1129(False:C215; "Method can not assert undefined and null")
						$passing:=False:C215
					Else 
						$methodCheck:=Formula:C1597(Value type:C1509($1)=$checker)
				End case 
			Else 
				ASSERT:C1129(False:C215; "Not accepted checker type")
				$passing:=False:C215
		End case 
	Else 
		ASSERT:C1129(False:C215; "Not enough paramters")
		$passing:=False:C215
End case 

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