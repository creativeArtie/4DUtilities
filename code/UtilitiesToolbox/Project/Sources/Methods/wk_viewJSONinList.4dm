//%attributes = {"shared":true}
#DECLARE($jsonParam : Object; $listPtrParam : Pointer)->$root : Integer

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


var $listPtr : Pointer
If (wk_assertLocalParameter($assert; ->$listPtr; Self:C308))
	$listPtr:=$listPtrParam
End if 

wk_assertParameterCount($assert)

$root:=jsonToList($json)