//%attributes = {}
#DECLARE($forumla : 4D:C1709.Function; $exceptPtr : Pointer)->$result : Boolean
$forumla:=utils_getRequireValue($1; 4D:C1709.Function)


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
$object:=New object:C1471("params"; $params)
$forumla.apply($object; $1)

$result:=$size=except_getExceptions.length

If (Not:C34($result))
	C_BOOLEAN:C305($tmp)
	$tmp:=except_catch($exceptPtr)
End if 

ON ERR CALL:C155($old)
