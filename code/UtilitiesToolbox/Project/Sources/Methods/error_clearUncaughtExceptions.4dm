//%attributes = {"shared":true}
#DECLARE->$hadErrors : Boolean
assertNoParameters(Count parameters:C259)

var $errors : Collection
$errors:=error_listUncaught

Use ($errors)
	$hadErrors:=$errors.length=0
	$errors.clear()
End use 