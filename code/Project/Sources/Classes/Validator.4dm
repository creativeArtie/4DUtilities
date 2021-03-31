//! #brief manager for the validations
//! It have two type of tests, mandatory and optional.
//! Optional fields does not need to be valid, while required fields does
//! #author Wai-Kin Chau
Class constructor
	This:C1470.optional:=New collection:C1472
	This:C1470.mandatory:=New collection:C1472
	This:C1470.errors:=New collection:C1472
	This:C1470.warnings:=New collection:C1472
	This:C1470.testRan:=False:C215
	
Function addMandatory
	//! #brief adds fields that need to be valid
	var $1 : cs:C1710.Check
	var $2 : cs:C1710.Use
	Case of 
		: (Count parameters:C259=2)
			ASSERT:C1129(OB Instance of:C1731($1; cs:C1710.Check))
			ASSERT:C1129(OB Instance of:C1731($2; cs:C1710.Use))
			$1.setValue($2)
			This:C1470.mandatory.push($1)
		Else 
			ASSERT:C1129(False:C215; "Wrong number of parameters.")
	End case 
	
Function addOptional
	//! #brief adds fields that can be valid
	var $1 : cs:C1710.Check
	var $2 : cs:C1710.Use
	Case of 
		: (Count parameters:C259=2)
			ASSERT:C1129(OB Instance of:C1731($1; cs:C1710.Check))
			ASSERT:C1129(OB Instance of:C1731($2; cs:C1710.Use))
			$1.setValue($2)
			This:C1470.optional.push($1)
		Else 
			ASSERT:C1129(False:C215; "Wrong number of parameters.")
	End case 
	
Function runChecks
	//! #brief runs the check
	Case of 
		: (Count parameters:C259=0)
		Else 
			ASSERT:C1129(False:C215; "Wrong number of parameters.")
	End case 
	
	var $ptr : cs:C1710.Check
	var $value : cs:C1710.Use
	
	This:C1470.errors:=New collection:C1472
	For each ($ptr; This:C1470.mandatory)
		$value:=$ptr.value
		If ($ptr.test())
			$value.setPass()
		Else 
			$value.setError($ptr.getMessageTemplate())
			This:C1470.errors.push($value)
		End if 
	End for each 
	
	This:C1470.warnings:=New collection:C1472
	For each ($ptr; This:C1470.optional)
		$value:=$ptr.value
		If ($ptr.test())
			$value.setPass()
		Else 
			$value.setWarning($ptr.getMessageTemplate())
			This:C1470.warnings.push($value)
		End if 
	End for each 
	
Function hasErrors->$answer : Boolean
	//! #brief check if there are errors
	$0:=This:C1470.errors.length>0
	
Function hasWarnings->$answer : Boolean
	//! #brief check if there are warnings
	$0:=This:C1470.warnings.length>0
	
Function hasNoIssues->$answer : Boolean
	//! #brief check if there are no issues
	$0:=Not:C34(This:C1470.hasErrors()) & Not:C34(This:C1470.hasWarnings())
	
Function canIgnore->$answer : Boolean
	//! #brief check if the remaining issues can be ignored
	$0:=Not:C34(This:C1470.hasErrors())
	
Function getErrorCount->$answer : Integer
	//! #brief count the number of errors
	$0:=This:C1470.errors.length
	
Function getWarningCount->$answer : Integer
	//! #brief count the number of warning
	$0:=This:C1470.warnings.length
	
Function getTotal->$answer : Integer
	//! #brief count the number of issues
	$0:=This:C1470.optional.length+This:C1470.mandatory.length
	
Function listErrors->$answer : Collection
	//! #brief list the errors
	$0:=This:C1470.errors.extract("message")
	
Function listWarnings->$answer : Collection
	//! #brief list the warnings
	$0:=This:C1470.warnings.extract("message")
	