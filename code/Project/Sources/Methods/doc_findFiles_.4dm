//%attributes = {}
#DECLARE($type : Text)->$collection : Object

$type:=utils_getRequireValue($type; Is text:K8:3)
var $path : Text
var $baseFolder : 4D:C1709.Folder
$collection:=New object:C1471

$path:=Convert path system to POSIX:C1106(Get 4D folder:C485(Database folder:K5:14))+"Project/Sources"

$baseFolder:=Folder:C1567($path+"/"+$type; fk posix path:K87:1)
For each ($file; $baseFolder.files())
	$collection[$file.name]:=New object:C1471("path"; $file.path)
End for each 