//%attributes = {"shared":true}
#DECLARE($counter : Object; $object : Object; $property : Text; $default : Variant)\
->$filled : Boolean
ASSERT:C1129((Count parameters:C259>=3) & (Count parameters:C259<=4))
ASSERT:C1129($object#Null:C1517)

var $counter : Object
var $contain : Boolean

$counter.count:=$counter.count+1
$filled:=$counter.total>=$counter.count
If (Count parameters:C259=3)
	ASSERT:C1129($filled; getMethodCallerText+\
		"Require more parameters, currently missing: "+\
		String:C10($counter.count))
Else 
	$object[$property]:=$default
End if 