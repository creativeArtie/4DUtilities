//%attributes = {}
C_OBJECT:C1216($1;$forumla;$exception)
$forumla:=utils_setParam($1;4D:C1709.Function;Formula:C1597($exception:=Null:C1517))

C_COLLECTION:C1488($params)
$params:=New collection:C1472
For ($i;2;Count parameters:C259)
	$params.push(${$i})
End for 

$old:=Method called on error:C704
except_trapErrors

C_REAL:C285($size)
$size:=except_getExceptions.length
$forumla.apply(Null:C1517;$params)

$0:=$size=except_getExceptions.length

ON ERR CALL:C155($old)
