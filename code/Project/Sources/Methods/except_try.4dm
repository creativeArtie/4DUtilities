//%attributes = {}
#DECLARE($forumla : 4D:C1709.Function; $exceptPtr : Pointer)->$result : Boolean

var $count : Real
$forumla:=utils_assertParameter($1; ->$count; Count parameters:C259)
$exceptPtr:=utils_assertParameter($2; ->$count; Count parameters:C259)
utils_assertParameterCount($count; Count parameters:C259)


C_VARIANT:C1683(${3})
var $params : Collection
$params:=New collection:C1472
var $i : Integer
For ($i; 3; Count parameters:C259)
	$params.push(${$i})
End for 

var $old : Text
$old:=Method called on error:C704
except_trapErrors

var $size : Integer
$size:=except_getExceptions_.length
var $object : Object
$object:=New object:C1471("params"; $params)
$forumla.apply($object; $1)

$result:=$size=except_getExceptions_.length

If (Not:C34($result))
	C_BOOLEAN:C305($tmp)
	$tmp:=except_catch($exceptPtr)
End if 

ON ERR CALL:C155($old)
