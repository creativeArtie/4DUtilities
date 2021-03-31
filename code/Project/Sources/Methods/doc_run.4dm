//%attributes = {}
//! #brief generate documentation
var $paths : Object  //! list of paths
$paths:=New object:C1471

//! 1. Load Names and their paths
$paths.classes:=doc_findFiles_("Classes")
$paths.methods:=doc_findFiles_("Methods")

//! 2. Creates the storage for classes and methods
var $data : Object  //! Store the output files
$data:=New object:C1471
$data.classes:=New object:C1471
$data.methods:=New object:C1471
C_TEXT:C284($name)

//! 3. Setup the class tree
var $leftover : Collection
$leftover:=New collection:C1472
var $tree : cs:C1710.DocTree_
$tree:=cs:C1710.DocTree_.new()

//! 4. Setup the general pages
var $common : cs:C1710.DocCommon_
$common:=cs:C1710.DocCommon_.new()

//! 5. Parse the classes into documents
For each ($name; $paths.classes)
	var $class : cs:C1710.DocClass_
	$class:=cs:C1710.DocClass_.new($name; $paths.classes[$name]; $common)
	$data.classes[$name]:=$class
	If (Not:C34($tree.addClass($class)))
		$leftover.push($class)
	End if 
End for each 

//! 6. Add the left over classes
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

//! 7. Parse the methods into documents
For each ($name; $paths.methods)
	var $method : cs:C1710.DocMethod_
	$method:=cs:C1710.DocMethod_.new($name; $paths.methods[$name]; $common)
	$data.methods[$name]:=$method
End for each 


//! 8. Output the documents

For each ($name; $data.classes)
	$data.classes[$name].generate()
End for each 

For each ($name; $data.methods)
	$data.methods[$name].generate()
End for each 

$common.generate()