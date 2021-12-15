//%attributes = {}
//! #brief finds the files for document generation
//! #author Wai-Kin Chau
#DECLARE($typeParam : Text)->$collection : Object

var $1; $type : Text
var $0; $collection : Object

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $type : Text
If (wk_assertLocalParameter($assert; ->$type))
	$type:=$typeParam
End if 

wk_assertParameterCount($assert)

var $path : Text
var $baseFolder : 4D:C1709.Folder
$collection:=New object:C1471

$path:=Convert path system to POSIX:C1106(Get 4D folder:C485(Database folder:K5:14))+"Project/Sources"

$baseFolder:=Folder:C1567($path+"/"+$type; fk posix path:K87:1)
var $file : 4D:C1709.File
For each ($file; $baseFolder.files())
	$collection[$file.name]:=$file
End for each 

$0:=$collection