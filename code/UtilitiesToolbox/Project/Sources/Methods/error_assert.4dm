//%attributes = {"shared":true}
#DECLARE($functionParam : 4D:C1709.Function)->$thrown : 4D:C1709.Function


var $assert : Object
$assert:=assertParameterSetup(Count parameters:C259)

var $function
If (assertLocalParameter($assert; ->$function))
	$function:=$functionParam
End if 

assertParameterCount($assert)

$thrown:=Formula:C1597(error_assertIf($functionParam.apply(); \
"Assert failed:"+$function.source))