//%attributes = {"shared":true}

C_TEXT:C284($1)
ASSERT:C1129(Value type:C1509($1)=Is text:K8:3)


C_COLLECTION:C1488($callers)
C_OBJECT:C1216($caller)

$0:=New object:C1471

$callers:=Get call chain:C1662
For ($i;0;$callers.count()-1)
	If ($callers[$i].name=$1)
		If ($i+1<$callers.count())
			$0:=$callers[$i+1]
		Else 
			$0:=$callers[$i]
		End if 
		$i:=$callers.count()+4
	End if 
End for 