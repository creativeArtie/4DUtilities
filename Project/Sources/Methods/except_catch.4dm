//%attributes = {}
#DECLARE($export : Pointer)->$hasErrors : Boolean

var $collection : Collection
$collection:=except_getExceptions

If ($collection.length>0)
	Use ($collection)
		$export->:=$collection.pop()
	End use 
	$hasErrors:=True:C214
Else 
	$hasErrors:=False:C215
End if 