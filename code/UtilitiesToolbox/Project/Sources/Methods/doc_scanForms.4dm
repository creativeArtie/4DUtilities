//%attributes = {}
#DECLARE($slowDownParam : Real; $nameParam : Text)->$data : Object
var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $slowDown
If (wk_assertLocalParameter($assert; ->$slowDown))
	$slowDown:=$slowDownParam
End if 

var $name : Text
If (wk_assertLocalParameter($assert; ->$name; "Forms"))
	$name:=$nameParam
End if 

wk_assertParameterCount($assert)

var $folder; $folders : 4D:C1709.Folder
$folders:=doc_toFolderSource($name)
If ($folders.exists)
	var $ptr; $total : Integer
	$total:=$folders.length
	$ptr:=0
	
	$data:=New object:C1471
	
	var $process : Integer
	$process:=Progress New
	Progress SET TITLE($process; "Finding "+$name)
	
	For each ($folder; $folders.folders())
		Progress SET PROGRESS($process; $ptr/$total; "Scanning "+$folder.name)
		var $file : 4D:C1709.File
		var $method : cs:C1710.RawFile
		var $form : Object
		$form:=New object:C1471
		$form.interface:=doc_scanInterface($name+"/"+$folder.name)
		$form.objectMethods:=New object:C1471
		For each ($file; Folder:C1567($folder.path+"ObjectMethods").files())
			OB SET:C1220($form.objectMethods; $file.name; doc_scanFile($file))
		End for each 
		$file:=File:C1566($folder.path+"method.4dm")
		If ($file.exists)
			$form.main:=doc_scanFile($file)
		End if 
		$ptr:=$ptr+1
	End for each 
	
	Progress QUIT($process)
End if 