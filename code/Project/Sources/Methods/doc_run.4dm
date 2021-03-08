//%attributes = {}
var $data : Object
$data:=New object:C1471

// 1. Load Names and their paths
$data.classes:=doc_findFiles_("Classes")
$data.methods:=doc_findFiles_("Methods")

// 2. Checks for menthods calls/ doc lines
C_TEXT:C284($name)
For each ($name; $data.classes)
	$data.classes[$name]:=doc_buildClass_($data.classes[$name]; $data)
End for each 

// 3. parse doc lines into tag parsing

// 4. output the documents