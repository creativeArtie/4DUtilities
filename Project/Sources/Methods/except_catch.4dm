//%attributes = {}
C_POINTER:C301($1;$export)
C_BOOLEAN:C305($noErrors)
C_COLLECTION:C1488($collection)

$collection:=except_getExceptions

If ($collection.length>0)
	Use ($collection)
		$1->:=$collection.pop()
	End use 
	$0:=True:C214
Else 
	$0:=False:C215
End if 