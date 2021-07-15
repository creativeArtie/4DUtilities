//%attributes = {"shared":true}
#DECLARE($idParam : Text; $nameParam : Text)->$accessor : Object

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $id : Text
If (wk_assertLocalParameter($assert; ->$id))
	$id:=$idParam
End if 

var $pointer : Pointer
$pointer:=OBJECT Get pointer:C1124(Object named:K67:5; $id)
ASSERT:C1129($pointer#Null:C1517)
var $name : Text
If (wk_assertLocalParameter($assert; ->$name; getPointerName($pointer)))
	$name:=$nameParam
End if 

wk_assertParameterCount($assert)

$accessor:=cs:C1710.AccessFormat.new($id; $name)