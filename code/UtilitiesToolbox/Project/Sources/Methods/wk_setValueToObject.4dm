//%attributes = {"shared":true}
//! #brief sets a value
#DECLARE($inputParam : Object; $valueParam : Variant)->$output : Object

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $input : Object
If (wk_assertLocalParameter($assert; ->$input))
	$input:=$inputParam
End if 

var $value : Variant
If (wk_assertLocalParameter($assert; ->$value))
	$value:=$valueParam
End if 
var ${3} : Text  //! property keys
$assert.count:=$assert.count+1
wk_assertParameterAtLeast($assert; 3)

var $child : Object
$child:=$input
$output:=$input

If (Not:C34(OB Is defined:C1231($child)))
	$child:=New object:C1471
	$output:=$child
End if 

var $i : Real
For ($i; 3; Count parameters:C259-1)
	If (Not:C34(OB Is defined:C1231($child; ${$i})))
		$child[${$i}]:=New object:C1471
	End if 
	$child:=$child[${$i}]
End for 
$child[${Count parameters:C259}]:=$value


