//%attributes = {}

var $path : Text
var $doc : Time
$path:=Convert path system to POSIX:C1106(Get 4D folder:C485(Database folder:K5:14))+"Documentation/Classes"
$path:=$path+"/Check"

$path:=Convert path POSIX to system:C1107($path)
$doc:=Create document:C266($path; "md")
CLOSE DOCUMENT:C267($doc)