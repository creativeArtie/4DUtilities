//%attributes = {}
var $paths : Object
$paths:=New object:C1471

// 1. Load Names and their paths
$paths.classes:=doc_findFiles_("Classes")
$paths.methods:=doc_findFiles_("Methods")

// 2. Checks for menthods calls/ doc lines
var $data : Object
$data:=New object:C1471
$data.classes:=New object:C1471
$data.methods:=New object:C1471
C_TEXT:C284($name)
For each ($name; $paths.classes)
	$data.classes[$name]:=cs:C1710.DocClass_.new($name; $paths.classes[$name])
End for each 

// 3. Output the documents

For each ($name; $data.classes)
	$data.classes[$name].generate()
End for each 
