//%attributes = {}
#DECLARE($jsonParam : Variant)->$value : Integer
var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $index : Integer
If ($index=Null:C1517)
	$index:=0
End if 

var $json
If (wk_assertLocalParameter($assert; ->$json))
	$json:=$jsonParam
End if 

wk_assertParameterCount($assert)

$value:=New list:C375
Case of 
	: (Value type:C1509($json)=Is object:K8:27)
		var $key : Text
		For each ($key; $json)
			var $list : Integer
			$list:=New list:C375
			APPEND TO LIST:C376($value; $key; $list; jsonToList($json[$key]); True:C214)
			SET LIST ITEM PROPERTIES:C386($value; $list; False:C215; Italic:K14:3; 0; 0x00FF)
		End for each 
	: (Value type:C1509($json)=Is collection:K8:32)
		var $i : Integer
		$i:=0
		var $child
		For each ($child; $json)
			$list:=New list:C375
			APPEND TO LIST:C376($value; String:C10($i); $list; jsonToList($child); True:C214)
			SET LIST ITEM PROPERTIES:C386($value; $list; False:C215; Plain:K14:1; 0; 0x00FF)
			$i:=$i+1
		End for each 
	Else 
		$list:=New list:C375
		APPEND TO LIST:C376($value; String:C10($json); $list)
		SET LIST ITEM PROPERTIES:C386($value; $list; False:C215; Bold:K14:2)
End case 
