//%attributes = {}
#DECLARE($export : Pointer)->$hasErrors : Boolean

var $collection : Collection
$collection:=except_getExceptions_

If ($collection.length>0)
	Use ($collection)
		var $error : cs:C1710.Exception
		$error:=$collection.pop()
		$export->:=OB Copy:C1225($error)
	End use 
	$hasErrors:=True:C214
Else 
	$hasErrors:=False:C215
End if 