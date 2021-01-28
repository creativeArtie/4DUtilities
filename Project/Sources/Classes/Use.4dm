Class constructor
	This:C1470.state:=0
	This:C1470.message:=""
	This:C1470.name:=utils_setParam($1;Is text:K8:3)
	utils_countParams(1;Count parameters:C259)
	
Function getValue
	ASSERT:C1129(False:C215;"Need implementation.")
	
Function setError
	var $1 : Text
	$message:=utils_setParam($1;Is text:K8:3)
	utils_countParams(1;Count parameters:C259)
	This:C1470.message:=Replace string:C233($1;"$1";This:C1470.name)
	
Function setWarning
	var $1 : Text
	$message:=utils_setParam($1;Is text:K8:3)
	utils_countParams(1;Count parameters:C259)
	This:C1470.message:=Replace string:C233($1;"$1";This:C1470.name))
	
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