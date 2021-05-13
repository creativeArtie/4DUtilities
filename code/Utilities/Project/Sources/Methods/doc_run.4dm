//%attributes = {}
//! #brief generate documentation
//! #author Wai-Kin Chau

utils_assertParameterCount(0; Count parameters:C259)

var $paths : Object  //! list of paths
$paths:=New object:C1471

var $process : Integer  //! the process to show documentation
var $showProgress : Boolean  //! `false` means testing
$showProgress:=True:C214

If ($showProgress)
	$process:=Progress New
	Progress SET BUTTON ENABLED($process; False:C215)
	Progress SET TITLE($process; "Generating Documents")
	Progress SET MESSAGE($process; "Loading Files")
	Progress SET WINDOW VISIBLE(True:C214)
End if 

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

var $completed; $total : Integer

If ($showProgress)
	$completed:=0
	$total:=$paths.classes.length
	Progress SET PROGRESS($process; 0/$total; "Parsing Classes.")
End if 

//! 5. Parse the classes into documents
For each ($name; $paths.classes)
	var $class : cs:C1710.DocClass_
	$class:=cs:C1710.DocClass_.new($name; $paths.classes[$name]; $common)
	$data.classes[$name]:=$class
	If (Not:C34($tree.addClass($class)))
		$leftover.push($class)
	End if 
	If ($showProgress)
		$completed:=$completed+1
		Progress SET PROGRESS($process; $completed/$total)
	End if 
End for each 

//! 6. Add the left over classes
If ($showProgress)
	$completed:=0
	$total:=$paths.classes.length
	Progress SET PROGRESS($process; -1; "Setup Class trees.")
End if 
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

If ($showProgress)
	$completed:=0
	$total:=$paths.methods.length
	Progress SET PROGRESS($process; 0/$total; "Parsing Methods.")
End if 
For each ($name; $paths.methods)
	If ($name#"Compiler_@")
		If (Not:C34($showProgress))
			If ($name="doc_demo")
				TRACE:C157
			End if 
		End if 
		
		var $method : cs:C1710.DocMethod_
		$method:=cs:C1710.DocMethod_.new($name; $paths.methods[$name]; $common)
		$data.methods[$name]:=$method
		If ($showProgress)
			$completed:=$completed+1
			Progress SET PROGRESS($process; $completed/$total)
		End if 
	End if 
End for each 


//! 8. Output the documents
If ($showProgress)
	$completed:=0
	$total:=$data.classes.length
	Progress SET PROGRESS($process; 0/$total; "Generate Class docs.")
End if 
For each ($name; $data.classes)
	$data.classes[$name].generate()
	If ($showProgress)
		$completed:=$completed+1
		Progress SET PROGRESS($process; $completed/$total)
	End if 
End for each 

If ($showProgress)
	$completed:=0
	$total:=$data.methods.length
	Progress SET PROGRESS($process; 0/$total; "Generate Methods docs.")
End if 
For each ($name; $data.methods)
	If (Not:C34($showProgress))
		If ($name="doc_demo")
			TRACE:C157
		End if 
	End if 
	$data.methods[$name].generate()
	If ($showProgress)
		$completed:=$completed+1
		Progress SET PROGRESS($process; $completed/$total)
	End if 
End for each 

If ($showProgress)
	Progress QUIT($process)
	Progress SET WINDOW VISIBLE(False:C215)
End if 
$common.generate()