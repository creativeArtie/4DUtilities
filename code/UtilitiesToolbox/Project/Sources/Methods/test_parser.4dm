//%attributes = {"executedOnServer":true}
//! #brief This is a test
#DECLARE($dataParam : Text; $defaultedParam)->$test : Text

var $assert : Object  //! assert check
$assert:=wk_assertParameterSetup(Count parameters:C259)

// Check parameters with wk_localParam or wk_objectParam
var $data; $defaulted : Text
If (wk_assertLocalParameter($assert; ->$data))
	$data:=$dataParam
End if 

If (wk_assertLocalParameter($assert; ->$defaulted))
	$defaulted:=$defaultedParam  // end with some comment
End if 

wk_assertParameterCount($assert)

var $input : Text
$input:=$data+/*random doc*/String:C10(True:C214)+"a\\a\""

ALERT:C41($input/** also more doc*/)

/* Multiline comments
*
*/

ALERT:C41($defaulted)