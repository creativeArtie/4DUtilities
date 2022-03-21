//%attributes = {}
#DECLARE($folderPathParam : Text)->$answer : Object

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $folderPath : Text
If (wk_assertLocalParameter($assert; ->$folderPath; "Forms/Test"))
	$folderPath:=$folderPathParam
End if 

wk_assertParameterCount($assert)

var $file : 4D:C1709.File
$file:=File:C1566(doc_toFolderSource($folderPath).path+"form.4dform")

var $raw : Object
$raw:=JSON Parse:C1218($file.getText())

$answer:=New object:C1471
$answer.events:=$raw.events
$answer.objects:=New collection:C1472

var $page : Object
var $widget : Object
var $key : Text
var $i : Integer
$i:=0

For each ($page; $raw.pages)
	For each ($key; $page.objects)
		$widget:=New object:C1471
		$widget.name:=$key
		$widget.type:=$page.objects[$key].type
		$widget.page:=$i
		If ($widget.type="listbox")
			$widget.sources:=New object:C1471
		End if 
		If (OB Is defined:C1231($page.objects[$key]; "currentItemSource"))
			$widget.sources.currentSource:=$page.objects[$key].currentItemSource
		End if 
		If (OB Is defined:C1231($page.objects[$key]; "currentItemPositionSource"))
			$widget.sources.currentPosition:=$page.objects[$key].currentItemPositionSource
		End if 
		If (OB Is defined:C1231($page.objects[$key]; "selectedItemsSource"))
			$widget.sources.selectedSource:=$page.objects[$key].selectedItemsSource
		End if 
		If (OB Is defined:C1231($page.objects[$key]; "action"))
			$widget.action:=$page.objects[$key].action
		End if 
		If (OB Is defined:C1231($page.objects[$key]; "dataSource"))
			$widget.source:=$page.objects[$key].dataSource
		End if 
		If (OB Is defined:C1231($page.objects[$key]; "events"))
			$widget.events:=$page.objects[$key].events
		End if 
		$answer.objects.push($widget)
	End for each 
	$i:=$i+1
End for each 