//%attributes = {}
#DECLARE($nameParam : Text)->$folder : 4D:C1709.Folder

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $name
If (wk_assertLocalParameter($assert; ->$name; ""))
	$name:=$nameParam
End if 

wk_assertParameterCount($assert)

$folder:=Folder:C1567(Get 4D folder:C485(Database folder:K5:14); fk platform path:K87:2)
If (isComponent)
	$folder:=$folder.parent.parent
Else 
	$folder:=$folder.parent
	$folder:=Folder:C1567($folder.path+"TestDemo"; fk posix path:K87:1)
End if 
$folder:=Folder:C1567($folder.path+"Project"; fk posix path:K87:1)
$folder:=Folder:C1567($folder.path+"Sources"; fk posix path:K87:1)
If ($name#"")
	$folder:=Folder:C1567($folder.path+$name; fk posix path:K87:1)
End if 