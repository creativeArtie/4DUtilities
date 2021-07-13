//%attributes = {"shared":true}
#DECLARE($checkerParam : 4D:C1709.Function)->$answer : cs:C1710.Checker

var ${2} : Variant

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $checker : Object
If (wk_assertLocalParameter($assert; ->$checker; \
Formula:C1597(Bool:C1537(This:C1470.value))\
))
	$checker:=$checkerParam
	ASSERT:C1129(OB Instance of:C1731($checkerParam; cs:C1710.Checker))
End if 

var $params : Collection
$params:=New collection:C1472
var $i : Real
For ($i; 2; Count parameters:C259)
	$params.push(${$i})
End for 

$answer:=cs:C1710.CheckTrue.new($checker; $params)
