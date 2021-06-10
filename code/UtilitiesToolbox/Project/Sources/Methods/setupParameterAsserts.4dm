//%attributes = {"shared":true}
#DECLARE($count : Integer)->$counter : Object
ASSERT:C1129(Count parameters:C259=1)

If (Count parameters:C259=1)
	$counter:=New object:C1471("total"; $count; "count"; 0)
End if 