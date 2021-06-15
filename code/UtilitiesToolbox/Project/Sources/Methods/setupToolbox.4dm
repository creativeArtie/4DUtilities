//%attributes = {"shared":true}
#DECLARE($loadTableMethod : Text)
ASSERT:C1129((Count parameters:C259=1))
var $caller : Object
var $callers : Collection

$callers:=Get call chain:C1662

$caller:=$callers[$callers.length-1]

<>HOST_DATABASE:=$caller.database
<>TABLE_LOADER:=$loadTableMethod

Use (Storage:C1525)
	Storage:C1525.exception:=New shared object:C1526()
End use 

var $proccess : Integer
$proccess:=New process:C317("error_startup"; 0; "Utlities Exception Manager")
