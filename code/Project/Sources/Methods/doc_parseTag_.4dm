//%attributes = {}
#DECLARE($tag : Text; $line : Text; $parsed : Object; $keyword : Boolean)->$passed : Boolean

$tag:=utils_getRequireValue($1; Is text:K8:3)
$line:=utils_getRequireValue($2; Is text:K8:3)
$parsed:=utils_getRequireValue($3; Is object:K8:27)
$keyword:=utils_getOptionValue($4; True:C214; Is boolean:K8:9)

If ($keyword)
	$tag:="#"+$tag
End if 


If (Match regex:C1019(".*"+$tag+".*"; $line))
	var $pos : Integer
	$pos:=Position:C15($tag; $line)
	$parsed.begin:=Substring:C12($line; 0; $pos-1)
	$parsed.end:=Substring:C12($line; $pos+Length:C16($tag))
	$passed:=True:C214
Else 
	$passed:=False:C215
End if 