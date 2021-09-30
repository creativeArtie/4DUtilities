//%attributes = {}
#DECLARE($jsonParam : Variant; $parentParam : Integer)->$parent : Integer
var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var index : Integer
If (index=Null:C1517)
	index=0
End if 

var $json
If (wk_assertLocalParameter($assert; ->$json))
	$json:=$jsonParam
End if 

var $parent : Integer
If (wk_assertLocalParameter($assert; ->$parent; New list:C375))
	CLEAR LIST:C377($parent)
	$parent:=$parentParam
End if 

wk_assertParameterCount($assert)

$value:=New list:C375
Case of 
	: (Value type:C1509($json)=Is object:K8:27)
		var $key : Text
		For each ($key; $json)
			APPEND TO LIST:C376($parent; $key; $value; jsonToList($json[$key]; $parent); True:C214)
			index:=index+1
			
		End for each 
	: (Value type:C1509($json)=Is collection:K8:32)
		var $i : Real
		$i:=0
		var $child
		For each ($child; $json)
			index:=index+1
			APPEND TO LIST:C376($parent; String:C10($i); $value; jsonToList($child; $parent); True:C214)
			$i:=$i+1
		End for each 
	Else 
		APPEND TO LIST:C376($parent; String:C10($json); $value)
End case 