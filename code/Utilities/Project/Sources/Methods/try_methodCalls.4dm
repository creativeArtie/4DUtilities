//%attributes = {}
var $object; $null : Object
var $check; $nullCheck : cs:C1710.Check
$object:=New object:C1471
$null:=Null:C1517
$check:=cs:C1710.Check.new()
$nullCheck:=Null:C1517
var $text; $nullText : Text
$text:=""
//$nullText:=Null <- run time error


try_methodWithObject($object)
try_methodWithObject($null)
try_methodWithObject($check)
try_methodWithObject($nullCheck)
//try_methodWithObject($text) <- compiler error
//try_methodWithObject($nullText) <- compiler error

try_methodWithObjectClass($object)
try_methodWithObjectClass($null)
try_methodWithObjectClass($check)
try_methodWithObjectClass($nullCheck)
//try_methodWithObjectClass($text) <- compiler error
//try_methodWithObjectClass($nullText) <- compiler error

//try_methodWithText($object) <- compiler error
//try_methodWithText($null) <- compiler error
//try_methodWithText($check) <- compiler error
//try_methodWithText($nullCheck) <- compiler error
try_methodWithText($text)
try_methodWithText($nullText)
