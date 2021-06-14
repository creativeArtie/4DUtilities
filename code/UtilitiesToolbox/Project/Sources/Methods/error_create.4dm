//%attributes = {}
#DECLARE($messageParam : Text; $importanceParam : Integer; $reasonParam : Object)->$except : Object

$except:=New object:C1471

var $assert : Object
$assert:=assertParameterSetup(Count parameters:C259)

If (assertObjectParameter($assert; $except; "message"; "Message Ping"))
	$except.message:=$messageParam
End if 

If (assertObjectParameter($assert; $except; "importance"; Information message:K38:1))
	$except.importance:=$importanceParam
End if 

If (assertObjectParameter($assert; $except; "reason"; New object:C1471))
	$except.reason:=$reasonParam
End if 

assertParameterCount($assert)

var $caller : Object
$caller:=getMethodCaller

$except.database:=$caller.database
$except.line:=$caller.line
$except.name:=$caller.name
$except.type:=$caller.type
$except.processName:=Current process name:C1392
$except.processId:=Current process:C322
$except.thrownTimestamp:=Timestamp:C1445