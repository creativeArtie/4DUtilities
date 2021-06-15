//%attributes = {"shared":true}
#DECLARE($idParam : Text; $nameParam : Text)->$accessor : Object

var $assert : Object
$assert:=assertParameterSetup(Count parameters:C259)

var $id : Text
If (assertLocalParameter($assert; ->$id))
	$id:=$idParam
End if 

var $pointer : Pointer
$pointer:=OBJECT Get pointer:C1124(Object named:K67:5; $id)
var $name : Text
If (assertLocalParameter($assert; ->$name; getPointerName($pointer)))
	$name:=$nameParam
End if 

$accessor:=cs:C1710.AccessField.new($id; $name)
assertParameterCount($assert)
