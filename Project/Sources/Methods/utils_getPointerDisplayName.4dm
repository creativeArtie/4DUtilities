//%attributes = {"shared":true}
#DECLARE($pointer : Pointer)->$result : Text
$pointer:=utils_setParam($1; Is pointer:K8:14)
utils_countParams(1; Count parameters:C259)
var $name : Text
var $tableNum : Integer
var $fieldNum : Integer

RESOLVE POINTER:C394($pointer; $name; $tableNum; $fieldNum)
If ($tableNum=-1)
	// Variable of array
	$result:=$name
Else 
	If ($name#"")
		// array element
		$result:=$name+"["+String:C10($tableNum)+"]"
		If ($fieldNum#-1)
			$result:=$result+"["+String:C10($fieldNum)+"]"
		End if 
	Else 
		// table or field
		$result:=Table name:C256($tableNum)
		If ($fieldNum#-1)
			$result:=$result+" - "+Field name:C257($tableNum; $fieldNum)
		End if 
	End if 
End if 
$0:=$result