//%attributes = {}
//! #brief catches the exception
//! #author Wai-Kin Chau
//! The common way to use this method is:
//! ~~~4D
//! var $exception : cs.Exception
//! While(except_catch(->$exception))
//!    // error found
//! End while
//! ~~~
//! or
//! ~~~4D
//! var $exception : cs.Exception
//! If (exception_catch(->$exception))
//!     // code for errors
//! Else
//!     // code for passed
//! End if
//! ~~~
#DECLARE($export : Pointer)->$hasErrors : Boolean

var $count : Real
$1:=utils_assertParameter($1; ->$count; Count parameters:C259)
utils_assertParameterCount($count; Count parameters:C259)


var $collection : Collection
$collection:=except_getExceptions_

If ($collection.length>0)
	Use ($collection)
		var $error : cs:C1710.Exception
		$error:=$collection.pop()
		$export->:=OB Copy:C1225($error)
	End use 
	$hasErrors:=True:C214
Else 
	$hasErrors:=False:C215
End if 