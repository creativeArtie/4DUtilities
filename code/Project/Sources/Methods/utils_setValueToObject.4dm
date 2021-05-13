//%attributes = {}
//! #brief sets a value 
#DECLARE($input : Object; $value : Variant)->$output : Object

var ${3} : Text  //! property keys

var $count : Real
$input:=utils_assertParameter($1; ->$count; Count parameters:C259)
$value:=utils_assertParameter($2; ->$count; Count parameters:C259)
$3:=utils_assertParameter($3; ->$count; Count parameters:C259)

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


