//%attributes = {}
#DECLARE($forumla : 4D:C1709.Function)->$result : Boolean
$forumla:=utils_setParam($1; 4D:C1709.Function; Formula:C1597($exception:=Null:C1517))

var $params : Collection
$params:=New collection:C1472
For ($i; 2; Count parameters:C259)
	$params.push(${$i})
End for 

var $old : Text
$old:=Method called on error:C704
except_trapErrors

var $size : Integer
$size:=except_getExceptions.length
$forumla.apply(Null:C1517; $params)

$result:=$size=except_getExceptions.length

ON ERR CALL:C155($old)
