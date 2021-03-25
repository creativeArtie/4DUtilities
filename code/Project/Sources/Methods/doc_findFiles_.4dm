//%attributes = {}
#DECLARE($type : Text)->$collection : Object

var $count : Real
$type:=utils_assertParameter($type; ->$count; Count parameters:C259)
utils_assertParameterCount($count; Count parameters:C259)

var $path : Text
var $baseFolder : 4D:C1709.Folder
$collection:=New object:C1471

$path:=Convert path system to POSIX:C1106(Get 4D folder:C485(Database folder:K5:14))+"Project/Sources"

$baseFolder:=Folder:C1567($path+"/"+$type; fk posix path:K87:1)
var $file : 4D:C1709.File
For each ($file; $baseFolder.files())
	$collection[$file.name]:=$file
End for each 