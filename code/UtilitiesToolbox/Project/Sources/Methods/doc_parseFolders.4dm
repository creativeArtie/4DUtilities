//%attributes = {}

var $folder; $methodFolder : 4D:C1709.Folder
$folder:=Folder:C1567(Get 4D folder:C485(Database folder:K5:14); fk platform path:K87:2)
$folder:=Folder:C1567($folder.path+"Project"; fk posix path:K87:1)
$folder:=Folder:C1567($folder.path+"Sources"; fk posix path:K87:1)
$methodFolder:=Folder:C1567($folder.path+"Methods"; fk posix path:K87:1)

var $file : 4D:C1709.File
var $methods : Collection
$methods:=New collection:C1472
For each ($file; $methodFolder.files())
	var $method : cs:C1710.RawFile
	$methods.push(doc_parseMethod(doc_parseFile($file)))
End for each 