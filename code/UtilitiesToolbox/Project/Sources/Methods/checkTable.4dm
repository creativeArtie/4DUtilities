//%attributes = {}
//! #brief Checks if a certain table is filled
#DECLARE($issues : Collection; $tableName : Text; $fields : Collection)->$pass : Boolean
var $continue : Boolean
$continue:=True:C214
var $table : 4D:C1709.DataClass
EXECUTE METHOD:C1007(<>TABLE_LOADER; $table; $tableName)
If ($table=Null:C1517)
	$issues.push("Missing "+$tableName+" table.")
	$continue:=False:C215
End if 

$pass:=$continue

If ($continue)
	var $field : Object
	For each ($field; $fields)
		Case of 
			: (Not:C34(OB Is defined:C1231($table; $field.name)))
				$issues.push($tableName+" table missing the field "+$field.name+" with type "+$field.type)
				$pass:=False:C215
			: ($table[$field.name].type#$field.type)
				$issues.push($tableName+" table has wrong type for field "+$field.name+\
					", require type "+String:C10($field.type))
				$pass:=False:C215
		End case 
	End for each 
End if 