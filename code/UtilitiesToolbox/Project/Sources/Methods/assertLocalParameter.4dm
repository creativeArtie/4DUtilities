//%attributes = {"shared":true}
#DECLARE($counter : Object; $local : Pointer; $default : Variant)\
->$filled : Boolean
ASSERT:C1129((Count parameters:C259>=2) & (Count parameters:C259<=3))

var $counter : Object
var $contain : Boolean

$counter.count:=$counter.count+1
$filled:=$counter.total>=$counter.count
If (Count parameters:C259=2)
	ASSERT:C1129($filled; getMethodCallerText+"Require more parameters.")
Else 
	$local->:=$default
End if 