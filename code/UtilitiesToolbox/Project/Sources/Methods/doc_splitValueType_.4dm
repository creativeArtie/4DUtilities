//%attributes = {"shared":true}
//! #brief splits the extract variable into value and its type
//! #author Wai-Kin Chau
#DECLARE($rawParam : Text; $extractNameParam : Boolean)->$value : Object

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $raw : Text
If (wk_assertLocalParameter($assert; ->$raw))
	$raw:=$rawParam
End if 

var $extractName : Boolean
If (wk_assertLocalParameter($assert; ->$extractName; True:C214))
	$extractName:=$extractNameParam
End if 

wk_assertParameterCount($assert)



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