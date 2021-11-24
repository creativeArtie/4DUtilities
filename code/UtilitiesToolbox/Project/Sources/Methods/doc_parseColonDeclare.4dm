//%attributes = {}
#DECLARE($text : Text)->$result : Object

var $raw : Collection
$raw:=Split string:C1554($text; ":")

If ($raw.length=2)
	$result:=New object:C1471("name"; $raw[0]; "type"; $raw[1])
Else 
	$result:=New object:C1471("name"; $raw[0]; "type"; "variant")
End if 
