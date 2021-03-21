Class constructor
	var $1 : Text
	var $message : Text
	var $2 : Object
	var $3 : Integer
	var $caller : Object
	var $4 : Object
	This:C1470.message:=utils_getRequireValue($1; Is text:K8:3)
	$caller:=utils_getRequireValue($2; Is object:K8:27)
	This:C1470.importance:=utils_getRequireValue($3; Is longint:K8:6)
	This:C1470.reason:=utils_getOptionValue($4; New object:C1471; Is object:K8:27)
	
	
	This:C1470.database:=$caller.database
	This:C1470.line:=$caller.line
	This:C1470.name:=$caller.name
	This:C1470.type:=$caller.type
	This:C1470.processName:=Current process name:C1392
	This:C1470.processId:=Current process:C322
	This:C1470.thrownTimestamp:=Timestamp:C1445
	