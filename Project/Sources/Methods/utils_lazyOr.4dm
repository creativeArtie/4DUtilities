//%attributes = {}

$0:=False:C215
For ($i;1;Count parameters:C259)
	ASSERT:C1129(Value type:C1509(${$i})=Is object:K8:27)
	ASSERT:C1129(OB Instance of:C1731(${$i};4D:C1709.Function))
	If (${$i}.call())
		$0:=True:C214
		$i:=Count parameters:C259
	End if 
End for 