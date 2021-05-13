Class constructor
	var $1 : Text
	var $2 : Object
	var $3 : Integer
	var $caller : Object
	var $4 : Object
	var $count : Real
	This:C1470.message:=utils_assertParameter($1; ->$count; Count parameters:C259)
	$caller:=utils_assertParameter($2; ->$count; Count parameters:C259)
	This:C1470.importance:=utils_assertParameter($3; ->$count; Count parameters:C259)
	This:C1470.reason:=utils_assertParameter($4; ->$count; Count parameters:C259; New object:C1471)
	utils_assertParameterCount($count; Count parameters:C259)
	
	
	This:C1470.database:=$caller.database
	This:C1470.line:=$caller.line
	This:C1470.name:=$caller.name
	This:C1470.type:=$caller.type
	This:C1470.processName:=Current process name:C1392
	This:C1470.processId:=Current process:C322
	This:C1470.thrownTimestamp:=Timestamp:C1445
	