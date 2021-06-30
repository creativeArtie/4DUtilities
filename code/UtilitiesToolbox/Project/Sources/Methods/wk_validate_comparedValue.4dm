//%attributes = {"shared":true}
#DECLARE($minParam; $maxParam; $minIncludedParam : Boolean; \
$maxIncludedParam : Boolean)->$answer : cs:C1710.Checker


var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $min
If (wk_assertLocalParameter($assert; ->$min))
	$min:=$minParam
End if 
var $max
If (wk_assertLocalParameter($assert; ->$max))
	$max:=$maxParam
End if 
var $minIncluded : Boolean
If (wk_assertLocalParameter($assert; ->$minIncluded; True:C214))
	$minIncluded:=$minIncludedParam
End if 
var $maxIncluded : Boolean
If (wk_assertLocalParameter($assert; ->$maxIncluded; True:C214))
	$maxIncluded:=$maxIncludedParam
End if 

wk_assertParameterCount($assert)

$answer:=cs:C1710.CheckNumber.new($min; $max; $minIncluded; $maxIncluded)

