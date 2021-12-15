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
		var $file; $files
		If ($slowDown>0)
			DELAY PROCESS:C323(Current process:C322; $slowDown)
		End if 
		var $folderPath : Text
		var $method : Object
		$folderPath:="Forms/"+$folder.name
		If (Folder:C1567($folderPath+"/ProjectMethods").exists)
			$files:=doc_scanFolder($folderPath+"/ObjectMethods"; False:C215; $slowDown)
		Else 
			$files:=New object:C1471
		End if 
		
		var $main : 4D:C1709.File
		$main:=File:C1566(doc_toFolderSource($folderPath).path+"method.4dm")
		If ($main.exists)
			Progress SET PROGRESS($process; -1; "Scaninng main method")
			If ($slowDown>0)
				DELAY PROCESS:C323(Current process:C322; $slowDown)
			End if 
			
			$method:=doc_scanFile($main; False:C215)
			OB SET:C1220($data; $folder.name; New object:C1471("objectMethods"; $files; "main"; $method))
		Else 
			
			OB SET:C1220($data; $folder.name; New object:C1471("objectMethods"; $files))
		End if 
		
		$ptr:=$ptr+1
	End for each 
	
	Progress QUIT($process)
End if 