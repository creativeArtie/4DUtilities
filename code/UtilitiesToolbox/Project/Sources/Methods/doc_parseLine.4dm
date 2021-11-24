//%attributes = {}
#DECLARE($rawParam : Text)->$parsed : Object

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $tag; $raw; $tagged; $text : Text
If (wk_assertLocalParameter($assert; ->$raw))
	$raw:=$rawParam
End if 

wk_assertParameterCount($assert)

var $pos; $length : Integer
If (Match regex:C1019("^[ ]*#"; $raw; 1; $pos; $length))
	$tagged:=Substring:C12($raw; $length+1)
	$tag:=Split string:C1554($tagged; " ")[0]
	$text:=Substring:C12($tagged; Length:C16($tag)+2)
Else 
	$tag:=""
	$text:=$raw
End if 
$parsed:=New object:C1471("tag"; $tag; "text"; $text)