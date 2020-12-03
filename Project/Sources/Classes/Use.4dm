Class constructor
	This:C1470.state:=0
	This:C1470.message:=""
Function getValue
	ASSERT:C1129(False:C215;"Need implementation.")
Function setError
	var $1 : Text
	Case of 
		: (Count parameters:C259=1)
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	This:C1470.message:=Replace string:C233($1;"$1";String:C10(This:C1470.getValue()))
Function setWarning
	var $1 : Text
	Case of 
		: (Count parameters:C259=1)
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	This:C1470.message:=Replace string:C233($1;"$1";String:C10(This:C1470.getValue()))
Function setPass
	This:C1470.message:=""
Function getText
	$0:=This:C1470.message
Function hasError
	$0:=This:C1470.state=2
Function canIgnore
	$0:=This:C1470.state#2
Function isPassed
	$0:=This:C1470.state=0
Function hasIssues
	$0:=This:C1470.state#0