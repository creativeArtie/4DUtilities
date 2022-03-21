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
$totalSteps:=10
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
$rawMenu:=doc_scanMenus()

var $names; $base : Object
Progress SET PROGRESS($process; 7/$totalSteps; "Parse Classes.")
$names:=New object:C1471("classes"; OB Keys:C1719($rawClasses); "methods"; OB Keys:C1719($rawMethods); \
"forms"; OB Keys:C1719($rawForms)\
)

Progress SET PROGRESS($process; 8/$totalSteps; "Parse Methods.")
$base:=cs:C1710.DocRoot.new(OB Keys:C1719($rawClasses); OB Keys:C1719($rawMethods); OB Keys:C1719($rawForms))
$base.loadClasses($rawClasses; $names; $slowDown)
$base.loadMethods($rawMethods; $names; $slowDown)

Progress SET PROGRESS($process; 9/$totalSteps; "Parse Menus")

Progress QUIT($process)
Progress SET WINDOW VISIBLE(False:C215)