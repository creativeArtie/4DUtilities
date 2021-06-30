//%attributes = {}
#DECLARE($issues : Collection; $tableName : Text; $fields : Collection)
var $continue : Boolean
$continue:=True:C214
var $table : Object
EXECUTE METHOD:C1007(<>TABLE_LOADER; $table; $tableName)
If ($table=Null:C1517)
	$issues.push("Missing "+$tableName+" table.")
	$continue:=False:C215
End if 

If ($continue)
	var $field : Text
	For each ($field; $fields)
		If (Not:C34(OB Is defined:C1231($table; $field)))
			$issues.push($tableName+" table missing the field "+$field)
		End if 
	End for each 
End if 