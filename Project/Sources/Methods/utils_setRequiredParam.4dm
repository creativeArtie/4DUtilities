//%attributes = {}
#DECLARE($value : Variant; $validator : 4D:C1709.Function)->$result : Variant

If ($validator=Null:C1517)
	ASSERT:C1129($value#Null:C1517; "Missing value")
Else 
	ASSERT:C1129($validator.call($value))
End if 

$result:=$value