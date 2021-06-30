//%attributes = {"shared":true}
#DECLARE($functionParam : 4D:C1709.Function)->$thrown : 4D:C1709.Function


var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $function
If (wk_assertLocalParameter($assert; ->$function))
	$function:=$functionParam
End if 

wk_assertParameterCount($assert)

$thrown:=Formula:C1597(wk_error_assertIf($functionParam.apply(); \
"Assert failed:"+$function.source))