//%attributes = {}
#DECLARE->$menuBars : Object

wk_assertNoParameters(Count parameters:C259)

var $file : 4D:C1709.file
$file:=File:C1566(doc_toFolderSource.path+"menus.json")
var $menuBars : Object
$menuBars:=JSON Parse:C1218($file.getText())