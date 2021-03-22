//%attributes = {}
#DECLARE($file : cs:C1710.File)->$lines : Collection

var $code : Text
$code:=Document to text:C1236(Convert path POSIX to system:C1107($file.path); "UTF-8"; Document with LF:K24:22)

var $raw : Collection
$raw:=Split string:C1554($code; "\n")
$lines:=New collection:C1472
var $line : Text
var $final : Text
var $nextLine : Text
For each ($line; $raw)
	If ($line="@\\")
		$nextLine:=Substring:C12($line; 0; Length:C16($line)-1)+" "
	Else 
		$lines.push($nextLine+$line)
		$nextLine:=""
	End if 
End for each 