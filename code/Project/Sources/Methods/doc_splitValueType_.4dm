//%attributes = {}
//! #brief splits the extract variable into value and its type
#DECLARE($raw : Text; $name : Text)->$value : Object

var $splitted : Collection
$splitted:=Split string:C1554($raw; ":")

If ($name="")
	$name:=$splitted[0]
	$type:=$splitted[1]
	If ($splitted.length=3)
		TRACE:C157
	End if 
End if 

