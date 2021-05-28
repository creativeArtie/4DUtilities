//%attributes = {"shared":true}
//! #brief splits the extract variable into value and its type
//! #author Wai-Kin Chau
#DECLARE($raw : Text; $extractName : Boolean)->$value : Object

var $count : Real
$raw:=utils_assertParameter($1; ->$count; Count parameters:C259)
$extractName:=utils_assertParameter($2; ->$count; Count parameters:C259; True:C214)
utils_assertParameterCount($count; Count parameters:C259)


var $splitted : Collection
$splitted:=Split string:C1554($raw; ":"; sk trim spaces:K86:2)

var $type; $name : Text
$type:="Variant"

If ($extractName)
	$name:=$splitted[0]
	Case of 
		: ($splitted.length=2)
			$type:=$splitted[1]
		: ($splitted.length=3)
			$type:=$splitted[1]+"."+(Split string:C1554($splitted[2]; "."; sk trim spaces:K86:2)[1])
	End case 
Else 
	$name:=""
	Case of 
			
		: ($splitted.length=1)
			$type:=$splitted[0]
			
		: ($splitted.length=2)
			$type:=$splitted[0]+"."+(Split string:C1554($splitted[1]; "."; sk trim spaces:K86:2)[1])
	End case 
End if 

$value:=New object:C1471("name"; $name; \
"type"; $type)