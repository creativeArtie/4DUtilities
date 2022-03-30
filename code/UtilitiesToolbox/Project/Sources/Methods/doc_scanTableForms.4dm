//%attributes = {}
#DECLARE($slowdownParam : Integer)->$data : Object
var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $slowdown
If (wk_assertLocalParameter($assert; ->$slowdown))
	$slowdown:=$slowdownParam
End if 

$data:=New object:C1471

wk_assertParameterCount($assert)


var $folder; $folders : 4D:C1709.Folder
$folders:=doc_toFolderSource("TableForms")
If ($folders.exists)
	
	var $process : Integer
	var $count; $total : Real
	$count:=0
	$total:=$folders.folders().length
	$process:=Progress New
	Progress SET TITLE($process; "Scanning Table Forms"; 0)
	
	For each ($folder; $folders.folders())
		Progress SET PROGRESS($process; $count/$total; "Scanning "+$folder.name)
		DELAY PROCESS:C323(Current process:C322; $slowDown)
		$data[$folder.name]:=doc_scanForms($slowdown; "TableForms/"+$folder.name)
		$count:=$count+1
	End for each 
	Progress QUIT($process)
End if 
