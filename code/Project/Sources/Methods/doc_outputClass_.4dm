//%attributes = {}
#DECLARE($class : cs:C1710.DocClass_)

var $text : Text

var $classDoc : Text
var $commentLine : Text

$classDoc:=$classDoc+"# Class <mark>cs."+$class.name+"</mark>\n\n"
$classDoc:=$classDoc+"## Description\n\n"
$classDoc:=$classDoc+$class.brief+"\n\n"
For each ($commentLine; $class.comments)
	$classDoc:=$classDoc+$commentLine+"\n"
End for each 
var $functionList : cs:C1710.DocFunctionTable_
$functionList:=cs:C1710.DocFunctionTable_.new()

var $function : cs:C1710.DocFunction_
For each ($function; $class.functions)
	$functionList.addFunction($function)
End for each 

$classDoc:=$classDoc+$functionList.getHTMLtable()

$text:="<!DOCTYPE html>\n"+\
"<!--"+$class.brief+"-->\n"+\
"<html>\n"+\
doc_outputHeader_("Class"+$class.name)+\
doc_outputBody_($classDoc)+\
"</html>"

var $path : Text
$path:=Convert path system to POSIX:C1106(Get 4D folder:C485(Database folder:K5:14))+"Documentation/Classes"
$path:=$path+"/"+$class.name+".md"

var $file : 4D:C1709.File

$file:=File:C1566($path; fk posix path:K87:1)
$file.create()

TEXT TO DOCUMENT:C1237(Convert path POSIX to system:C1107($file.path); $text; "ASCII")
