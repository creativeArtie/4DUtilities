//%attributes = {"shared":true}
#DECLARE($slowDownParam : Real)
var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $slowDown : Real
If (wk_assertLocalParameter($assert; ->$slowDown; 0))
	$slowDown:=$slowDownParam
End if 

wk_assertParameterCount($assert)

var $rawClasses; $rawDatabase; $rawForms; $rawMethods; $rawMenu; $rawTableForms; $rawTriggers : Object

var $process : Integer
var $totalSteps : Real
$totalSteps:=11
$process:=Progress New
Progress SET WINDOW VISIBLE(True:C214)

Progress SET TITLE($process; "Scanning Docs"; 0/$totalSteps; "Searching classes")
$rawClasses:=doc_scanFolder("Classes"; False:C215; $slowDown)

Progress SET PROGRESS($process; 1/$totalSteps; "Scanning Database Methods")
$rawDatabase:=doc_scanFolder("DatabaseMethods"; False:C215; $slowDown)

Progress SET PROGRESS($process; 2/$totalSteps; "Scanning Forms")
$rawForms:=doc_scanForms($slowDown)

Progress SET PROGRESS($process; 3/$totalSteps; "Scanning Methods")
$rawMethods:=doc_scanFolder("Methods"; True:C214; $slowDown)

Progress SET PROGRESS($process; 4/$totalSteps; "Scanning Table Forms")
$rawTableForms:=doc_scanTableForms($slowDown)

Progress SET PROGRESS($process; 5/$totalSteps; "Scanning Table Triggers")
$rawTriggers:=doc_scanFolder("Triggers"; False:C215; $slowDown)

Progress SET PROGRESS($process; 6/$totalSteps; "Scanning Menu")
DELAY PROCESS:C323(Current process:C322; $slowDown)
$rawMenu:=doc_scanMenus()

Progress SET PROGRESS($process; 7/$totalSteps; "Search names")
DELAY PROCESS:C323(Current process:C322; $slowDown)
var $className : Text
$base:=cs:C1710.DocRoot.new($rawClasses; $rawMethods; $rawForms)

Progress SET PROGRESS($process; 8/$totalSteps; "Parse Classes.")
$base.loadClasses($rawClasses; $slowDown)

Progress SET PROGRESS($process; 9/$totalSteps; "Parse Methods.")
$base.loadMethods($rawMethods; $slowDown)

Progress SET PROGRESS($process; 10/$totalSteps; "Parse Menus")

Progress QUIT($process)
Progress SET WINDOW VISIBLE(False:C215)