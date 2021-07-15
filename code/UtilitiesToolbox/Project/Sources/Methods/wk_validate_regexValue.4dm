//%attributes = {"shared":true}
#DECLARE($regexParam : Text)->$answer : cs:C1710.Checker

var ${2} : Variant

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $regex : Object
If (wk_assertLocalParameter($assert; ->$regex; \
Formula:C1597(Bool:C1537(This:C1470.value))\
))
	$regex:=$regexParam
End if 

var $params : Collection
$params:=New collection:C1472
var $i : Real
For ($i; 2; Count parameters:C259)
	$params.push(${$i})
End for 

$answer:=cs:C1710.CheckTrue.new(Formula:C1597(Match regex:C1019($regex; This:C1470.value)); $params)
