//%attributes = {"shared":true}
//! #brief Checks if there are at least one error thrown
//! #author Wai-Kin
//! Common Usage:
//! ~~~
//! var $exception : cs.Exception
//! If (except_try(Forumla(True);->$exception))
//!     // no errors
//! Else
//!     // contain errors
//! End if
//! ~~~
#DECLARE($forumla : 4D:C1709.Function; $exceptPtr : Pointer; $countPtr : Pointer)->$result : Boolean

var $errors : Real
var $count : Real
$forumla:=utils_assertParameter($1; ->$count; Count parameters:C259)
$exceptPtr:=utils_assertParameter($2; ->$count; Count parameters:C259)\
  // return the last error thrown
$countPtr:=utils_assertParameter($3; ->$count; Count parameters:C259; ->$errors)

C_VARIANT:C1683(${4})
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

$countPtr->:=except_getExceptions_.length-$size
$result:=$countPtr->=0

If (Not:C34($result))
	C_BOOLEAN:C305($tmp)
	$tmp:=except_catch($exceptPtr)
End if 

ON ERR CALL:C155($old)
