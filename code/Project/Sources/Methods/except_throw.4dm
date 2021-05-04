//%attributes = {"shared":true}
//! #brief throws an exception, use `except_assert` if there is a test value
//! #author Wai-Kin Chau

#DECLARE($message : Text)->$thrown : cs:C1710.Exception

var $count : Real
$message:=utils_assertParameter($1; ->$count; Count parameters:C259; "")  //! message
utils_assertParameterCount($count; Count parameters:C259)

var $caller : Object
$caller:=utils_getMethodCaller(Current method name:C684)
$thrown:=cs:C1710.Exception.new($message; $caller; Error message:K38:3)

except_addException_($thrown)