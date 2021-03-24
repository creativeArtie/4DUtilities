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

var $roots : Collection
$roots:=New collection:C1472
var $branches : Collection
$branches:=New collection:C1472

var $tree : cs:C1710.DocTree_
$tree:=cs:C1710.DocTree_.new()
var $leftover : Collection
$leftover:=New collection:C1472


For each ($name; $paths.classes)
	var $class : cs:C1710.DocClass_
	$class:=cs:C1710.DocClass_.new($name; $paths.classes[$name])
	$data.classes[$name]:=$class
	If (Not:C34($tree.addClass($class)))
		$leftover.push($class)
	End if 
End for each 

var $use : Collection
While ($leftover.length#0)
	$use:=$leftover
	$leftover:=New collection:C1472
	
	For each ($class; $use)
		If (Not:C34($tree.addClass($class)))
			$leftover.push($class)
		End if 
	End for each 
End while 

// 3. Output the documents

For each ($name; $data.classes)
	$data.classes[$name].generate()
End for each 
