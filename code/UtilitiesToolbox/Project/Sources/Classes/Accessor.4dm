Class constructor($fieldName : Text)
	ASSERT:C1129(Count parameters:C259=1)
	This:C1470.fieldName:=$fieldName
	This:C1470.state:=0
Function getValue->$value : Variant
	ASSERT:C1129(False:C215; "Needs implementation.")
Function updateWidget($type : Integer)
	ASSERT:C1129(False:C215; "Needs implementation.")
Function hasError->$answer : Boolean
	$0:=This:C1470.state=2
Function canIgnore->$answer : Boolean
	$0:=This:C1470.state#2
Function isPassed->$answer : Boolean
	$0:=This:C1470.state=0
Function hasIssues->$answer : Boolean
	$0:=This:C1470.state#0