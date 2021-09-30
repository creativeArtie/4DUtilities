//%attributes = {}
#DECLARE($jsonParam : Object; $listBoxParam : Pointer)

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $json : Object
If (wk_assertLocalParameter($assert; ->$json; New object:C1471))
	$json:=$jsonParam
Else 
	$json:=JSON Parse:C1218("{\"random\": 78,\"published\": "+\
		"["+\
		"\"Faisalabad\", \"Antwerp\", \"Shillong\",\"Tripoli\", \"Pelotas\", \"Lahore\"],"\
		+\
		"\"author\":"+\
		" {\"firstname\": \"Susette\",\"lastname\": \"Nananne\","+\
		"\"countries\": ["+\
		"{\"country\": \"Guam\",\"found\": 81},"+\
		"{\"country\": \"Uzbekistan\",\"found\": 8},"+\
		"{\"country\": \"Lesotho\",\"found\": 94},"+\
		"{\"country\": \"Russian Federation\",\"found\": 100},"+\
		"{\"country\": \"Western Sahara\",\"found\": 97},"+\
		"{\"country\": \"Honduras\",\"found\": 56},"+\
		"{\"country\": \"Nigeria\",\"found\": 67}]}}")
End if 

var $listBox
If (wk_assertLocalParameter($assert; ->$listBox; Self:C308))
	$listBox:=$listBoxParam
End if 

wk_assertParameterCount($assert)

var $number : Integer
$number:=LISTBOX Get number of columns:C831($listBox->)
If ($number>0)
	var $tree : cs:C1710.JsonTree
	$tree:=cs:C1710.JsonTree.new($json)
	
	$rows:=$tree.listRows(LISTBOX Get number of columns:C831($listBox->))
	
	ARRAY TEXT:C222($arrColNames; 0)
	ARRAY TEXT:C222($arrHeaderNames; 0)
	ARRAY POINTER:C280($arrColVars; 0)
	ARRAY POINTER:C280($arrHeaderVars; 0)
	ARRAY BOOLEAN:C223($arrColsVisible; 0)
	ARRAY POINTER:C280($arrStyles; 0)
	
	LISTBOX GET ARRAYS:C832($listBox->; $arrColNames; $arrHeaderNames; $arrColVars; \
		$arrHeaderVars; $arrColsVisible; $arrStyles)
	
	var $row : Collection
	
	For each ($row; $rows)
		var $i : Integer
		For ($i; 1; Size of array:C274($arrColVars))
			APPEND TO ARRAY:C911($arrColVars{$i}->; $row[$i-1])
		End for 
	End for each 
	
	ARRAY POINTER:C280($arrHierarchy; Size of array:C274($arrColVars))
	For ($i; 1; Size of array:C274($arrHierarchy))
		$arrHierarchy{$i}:=$arrColVars{$i}
	End for 
	LISTBOX SET HIERARCHY:C1098($listbox->; True:C214; $arrHierarchy)
End if 