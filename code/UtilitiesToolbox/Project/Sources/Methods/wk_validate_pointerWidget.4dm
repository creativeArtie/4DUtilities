//%attributes = {}
#DECLARE($pointerParam : Pointer; $nameParam : Text)->$accessor : Object

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $pointer : Pointer
If (wk_assertLocalParameter($assert; ->$pointer))
	$pointer:=$pointerParam
	ASSERT:C1129($pointer#Null:C1517)
End if 
var $name : Text
If (wk_assertLocalParameter($assert; ->$name; getPointerName($pointer)))
	$name:=$nameParam
End if 

wk_assertParameterCount($assert)

$accessor:=cs:C1710.AccessPointer.new($pointer; $name)