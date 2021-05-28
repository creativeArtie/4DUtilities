//%attributes = {"shared":true}
//! #brief splits the lines in the `$file` into a collection of `cs.DocLines_`.
//! #author Wai-Kin Chau
#DECLARE($file : cs:C1710.File)->$lines : Collection

var $count : Real
$1:=utils_assertParameter($1; ->$count; Count parameters:C259)
utils_assertParameterCount($count; Count parameters:C259)

var $code : Text
$code:=Document to text:C1236(Convert path POSIX to system:C1107($file.path); "UTF-8"; Document with LF:K24:22)

var $raw : Collection
$raw:=Split string:C1554($code; "\n")
$lines:=New collection:C1472
var $line : Text
var $nextLine : Text
var $number : Integer
$number:=1
For each ($line; $raw)
	If ($line="@\\")
		$nextLine:=Substring:C12($line; 0; Length:C16($line)-1)+" "
	Else 
		$lines.push(cs:C1710.DocLine_.new($nextLine+$line; $file.name; $number))
		$nextLine:=""
		$number:=$number+1
	End if 
End for each 