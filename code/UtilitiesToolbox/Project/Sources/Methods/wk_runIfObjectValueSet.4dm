//%attributes = {"shared":true}
#DECLARE($inputParam : Object; $functionParam : 4D:C1709.Function)->$isFound : Boolean

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

// Check parameters with wk_localParam or wk_objectParam
var $input : Object
If (wk_assertLocalParameter($assert; ->$input))
	$input:=$inputParam
End if 

var $function : 4D:C1709.Function
If (wk_assertLocalParameter($assert; ->$function))
	$function:=$functionParam
End if 

wk_assertParameterAtLeast($assert; 3)

C_TEXT:C284(${3})

$isFound:=OB Is defined:C1231($input)

If ($isFound)
	var $child : Object
	$child:=$input
	var $i : Integer
	For ($i; 3; Count parameters:C259-1)
		If (Not:C34(OB Is defined:C1231($child; ${$i})))
			$isFound:=False:C215
			$i:=Count parameters:C259
		End if 
		$child:=$child[${$i}]
	End for 
End if 

If ($isFound)
	If (OB Is defined:C1231($child; ${Count parameters:C259}))
		$functionParam.call($child[${Count parameters:C259}]; $input)
	Else 
		$isFound:=False:C215
	End if 
End if 
