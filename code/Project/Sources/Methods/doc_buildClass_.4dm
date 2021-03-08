//%attributes = {}
#DECLARE($path : Object; $data : Object)->$details : cs:C1710.DocClass_

var $file : 4D:C1709.File

$file:=File:C1566($path.path; fk posix path:K87:1)

$code:=Document to text:C1236(Convert path POSIX to system:C1107($path.path))

$lines:=Split string:C1554($code; "\r\n")
$details:=cs:C1710.DocClass_.new()
$comments:=New collection:C1472

var $parsed : cs:C1710.Comment_
var $function : cs:C1710.DocFunction_
For each ($line; $lines)
	$parsed:=cs:C1710.Comment_.new($line)
	
	Case of 
		: ($parsed.code="Function@")
			If ($function#Null:C1517)
				$details.functions.push($function)
			End if 
			$function:=cs:C1710.DocFunction_.new($parsed.code)
		: (($parsed.tag="abstract") & ($function#Null:C1517))
			$function.abstract:=True:C214
		Else 
			If ($function#Null:C1517)
				doc_parseCommonTags($function; $parsed)
			Else 
				doc_parseCommonTags($details; $parsed)
			End if 
	End case 
End for each 
If ($function#Null:C1517)
	$details.functions.push($function)
End if 