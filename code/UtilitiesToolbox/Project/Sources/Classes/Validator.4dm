Class constructor
	assertNoParameters(Count parameters:C259)
	This:C1470.checking:=New collection:C1472
	This:C1470.errors:=New collection:C1472
	This:C1470.warnings:=New collection:C1472
	
Function addManadatory($checkParam : cs:C1710.Checker; \
$accessParam : cs:C1710.Accessor)->$self : cs:C1710.Validator
	
	var $assert : Object
	$assert:=assertParameterSetup(Count parameters:C259)
	
	var $checker : Object
	$checker:=New object:C1471("manadatory"; True:C214)
	If (assertObjectParameter($assert; $checker; "check"))
		$checker.check:=$checkParam
	End if 
	If (assertObjectParameter($assert; $checker; "access"))
		$checker.access:=$accessParam
	End if 
	
	assertParameterCount($assert)
	
	This:C1470.checking.push($checker)
	
Function addOptional($checkParam : cs:C1710.Checker; \
$accessParam : cs:C1710.Accessor)->$self : cs:C1710.Validator
	
	var $assert : Object
	$assert:=assertParameterSetup(Count parameters:C259)
	
	var $checker : Object
	$checker:=New object:C1471("manadatory"; False:C215)
	If (assertObjectParameter($assert; $checker; "check"))
		$checker.check:=$checkParam
	End if 
	If (assertObjectParameter($assert; $checker; "access"))
		$checker.access:=$accessParam
	End if 
	
	assertParameterCount($assert)
	
	This:C1470.checking.push($checker)
	
Function runCheck
	assertNoParameters(Count parameters:C259)
	var $check : Object
	This:C1470.warnings.clear()
	This:C1470.errors.clear()
	For each ($check; This:C1470.checking)
		Case of 
			: ($check.check.test($check.access.getValue()))
				$check.access.updateWidget(0)
				$check.access.state:=0
				
			: ($check.manadatory)
				$check.access.updateWidget(2)
				$check.access.state:=2
				var $template; $message : Text
				$template:=$check.check.getMessageTemplate(2)
				$message:=Replace string:C233($template; "$1"; $check.access.fieldName)
				This:C1470.errors.push(New object:C1471("message"; $message))
			Else 
				$check.access.updateWidget(1)
				$check.access.state:=1
				var $template; $message : Text
				$template:=$check.check.getMessageTemplate(1)
				$message:=Replace string:C233($template; "$1"; $check.access.fieldName)
				This:C1470.warnings.push(New object:C1471("message"; $message))
		End case 
	End for each 
	
Function hasErrors->$answer : Boolean
	assertNoParameters(Count parameters:C259)
	$0:=This:C1470.errors.length>0
	
Function hasWarnings->$answer : Boolean
	assertNoParameters(Count parameters:C259)
	$0:=This:C1470.warnings.length>0
	
Function hasNoIssues->$answer : Boolean
	assertNoParameters(Count parameters:C259)
	$0:=Not:C34(This:C1470.hasErrors()) & Not:C34(This:C1470.hasWarnings())
	
Function canIgnore->$answer : Boolean
	assertNoParameters(Count parameters:C259)
	$0:=Not:C34(This:C1470.hasErrors())
	
Function getErrorCount->$answer : Integer
	assertNoParameters(Count parameters:C259)
	$0:=This:C1470.errors.length
	
Function getWarningCount->$answer : Integer
	assertNoParameters(Count parameters:C259)
	$0:=This:C1470.warnings.length
	
Function getTotal->$answer : Integer
	assertNoParameters(Count parameters:C259)
	$0:=This:C1470.checking.length