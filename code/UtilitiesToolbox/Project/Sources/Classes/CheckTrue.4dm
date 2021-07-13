Class extends Checker
Class constructor($callParam : 4D:C1709.Function; $paramsParam : Collection)
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $call : 4D:C1709.Function
	If (wk_assertLocalParameter($assert; ->$call))
		$call:=$callParam
	End if 
	
	var $params
	If (wk_assertLocalParameter($assert; ->$params))
		$params:=$paramsParam
	End if 
	
	wk_assertParameterCount($assert)
	Super:C1705("$1 dose not pass "+$call.source)
	This:C1470.function:=$call
	This:C1470.params:=$params
	
Function test($valueParam : Variant)->$result : Boolean
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $value
	If (wk_assertLocalParameter($assert; ->$value))
		$value:=$valueParam
	End if 
	
	wk_assertParameterCount($assert)
	
	var $input : Object
	$input.value:=$value
	$input.type:=Value type:C1509($value)
	
	$result:=This:C1470.function.apply($input; This:C1470.params)
	
	
	