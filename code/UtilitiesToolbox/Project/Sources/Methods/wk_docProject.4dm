//%attributes = {"shared":true}
#DECLARE($slowDownParam : Real)
var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $slowDown : Real
If (wk_assertLocalParameter($assert; ->$slowDown; 0))
	$slowDown:=$slowDownParam
End if 

wk_assertParameterCount($assert)


var $classes; $methods; $database; $triggers; $forms; $tableForms : Object

var $process : Integer
var $totalSteps : Real
$totalSteps:=6
$process:=Progress New
Progress SET TITLE($process; "Scanning Docs"; 1/$totalSteps; "Searching classes")

Progress SET WINDOW VISIBLE(True:C214)
$classes:=doc_scanFolder("Classes"; False:C215; $slowDown)

Progress SET PROGRESS($process; 2/$totalSteps; "Scanning Database Methods")
$database:=doc_scanFolder("DatabaseMethods"; False:C215; $slowDown)

Progress SET PROGRESS($process; 3/$totalSteps; "Scanning Forms")
$forms:=doc_scanForms($slowDown)

Progress SET PROGRESS($process; 4/$totalSteps; "Scanning Methods")
$methods:=doc_scanFolder("Methods"; True:C214; $slowDown)

Progress SET PROGRESS($process; 5/$totalSteps; "Scanning Table Forms")
$tableForms:=doc_scanTableForms($slowDown)

Progress SET PROGRESS($process; 6/$totalSteps; "Scanning Table Triggers")
$triggers:=doc_scanFolder("Triggers"; False:C215; $slowDown)

Progress QUIT($process)
Progress SET WINDOW VISIBLE(False:C215)