//! #brief Stores the error message and access the value to test
//! #author Wai-Kin Chau
Class constructor($name : Text)
	This:C1470.state:=0
	This:C1470.message:=""
	var $count : Real
	This:C1470.name:=utils_assertParameter($1; ->$count; Count parameters:C259)
	utils_assertParameterCount($count; Count parameters:C259)
	
Function getValue
	ASSERT:C1129(False:C215; "Need implementation.")
	
Function setError
	var $1 : Text
	var $message : Text
	
	var $count : Real
	$message:=utils_assertParameter($1; ->$count; Count parameters:C259)
	utils_assertParameterCount($count; Count parameters:C259)
	
	This:C1470.message:=Replace string:C233($1; "$1"; This:C1470.name)
	This:C1470.state:=2
	
Function setWarning
	var $1 : Text
	var $message : Text
	
	var $count : Real
	$message:=utils_assertParameter($1; ->$count; Count parameters:C259)
	utils_assertParameterCount($count; Count parameters:C259)
	
	This:C1470.message:=Replace string:C233($1; "$1"; This:C1470.name)
	This:C1470.state:=1
	
Function setPass
	This:C1470.message:=""
	This:C1470.state:=0
	
Function getText->$message : Text
	$0:=This:C1470.message
Function hasError->$answer : Boolean
	$0:=This:C1470.state=2
Function canIgnore->$answer : Boolean
	$0:=This:C1470.state#2
Function isPassed->$answer : Boolean
	$0:=This:C1470.state=0
Function hasIssues->$answer : Boolean
	$0:=This:C1470.state#0