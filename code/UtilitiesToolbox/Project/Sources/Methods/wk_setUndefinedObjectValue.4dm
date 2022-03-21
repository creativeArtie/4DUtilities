//%attributes = {"shared":true}
#DECLARE($objectParam : Object; $valueParam : Variant)->$objectChanged : Boolean

var $object : Object
var $value : Variant

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $object : Object
If (wk_assertLocalParameter($assert; ->$object))
	$object:=$objectParam
End if 

var $value
If (wk_assertLocalParameter($assert; ->$value))
	$value:=$valueParam
End if 

var ${3} : Text  //! object keys
$objectChanged:=False:C215
wk_assertParameterAtLeast($assert; 3)

If (Not:C34(OB Is defined:C1231($object)))
	$object:=New object:C1471
	$objectChanged:=True:C214
End if 
var $child : Object
$child:=$object

var $i : Integer
For ($i; 3; Count parameters:C259-1)
	If (Not:C34(OB Is defined:C1231($child; ${$i})))
		$child[${$i}]:=New object:C1471
		$objectChanged:=True:C214
	End if 
	$child:=$child[${$i}]
End for 
If (Not:C34(OB Is defined:C1231($child; ${Count parameters:C259})))
	$child[${Count parameters:C259}]:=$value
	$objectChanged:=True:C214
End if 
