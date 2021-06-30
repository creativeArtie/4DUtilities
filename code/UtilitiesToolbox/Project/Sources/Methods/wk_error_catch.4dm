//%attributes = {"shared":true}
#DECLARE($exportParam : Pointer)->$hasErrors : Boolean


var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $export
If (wk_assertLocalParameter($assert; ->$export))
	$export:=$exportParam
End if 

wk_assertParameterCount($assert)

var $collection : Collection
$collection:=error_listUncaught

If ($collection.length>0)
	Use ($collection)
		var $error : Object
		$error:=$collection.pop()
		$export->:=OB Copy:C1225($error)
	End use 
	$hasErrors:=True:C214
Else 
	$hasErrors:=False:C215
End if 