//%attributes = {}
#DECLARE($nameParam : Text; $hasAttrParam : Boolean; $slowDownParam : Real)->$return : Object

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $name : Text
If (wk_assertLocalParameter($assert; ->$name))
	$name:=$nameParam
End if 

var $hasAttr : Boolean
If (wk_assertLocalParameter($assert; ->$hasAttr))
	$hasAttr:=$hasAttrParam
End if 

var $slowDown : Real
If (wk_assertLocalParameter($assert; ->$slowDown))
	$slowDown:=$slowDownParam
End if 

$return:=New object:C1471

wk_assertParameterCount($assert)

var $folder : 4D:C1709.Folder
$folder:=doc_toFolderSource($name)
If ($folder.exists)
	
	var $process : Integer
	$process:=Progress New
	Progress SET TITLE($process; "Finding "+$name)
	
	var $file : 4D:C1709.File
	var $files : Collection
	$files:=$folder.files()
	
	var $ptr; $total : Integer
	$ptr:=0
	$total:=$files.length
	
	
	For each ($file; $files)
		Progress SET PROGRESS($process; $ptr/$total; "Scanning "+$file.name)
		DELAY PROCESS:C323(Current process:C322; $slowDown)
		var $method : cs:C1710.RawFile
		$return[$file.name]:=doc_scanFile($file; $hasAttr)
		$ptr:=$ptr+1
	End for each 
	Progress QUIT($process)
End if 