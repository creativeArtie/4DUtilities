Class constructor
	var $1 : Text
	var $message : Text
	var $2 : Object
	var $caller : Object
	var $3 : cs:C1710.Loggable
	This:C1470.message:=utils_setParam($1;Is text:K8:3)
	$caller:=utils_setParam($2;Is object:K8:27)
	This:C1470.reason:=utils_setParam($3;cs:C1710.Loggable;Null:C1517)
	
	This:C1470.database:=$caller.database
	This:C1470.line:=$caller.line
	This:C1470.name:=$caller.name
	This:C1470.type:=$caller.type
	This:C1470.processName:=Current process name:C1392
	This:C1470.processId:=Current process:C322
	This:C1470.time:=Timestamp:C1445
	