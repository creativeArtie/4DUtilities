//%attributes = {}
#DECLARE($messageParam : Text; $importanceParam : Integer; $reasonParam : Object)->$except : Object

$except:=New object:C1471

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

If (wk_assertObjectParameter($assert; $except; "message"; "Message Ping"))
	$except.message:=$messageParam
End if 

If (wk_assertObjectParameter($assert; $except; "importance"; Information message:K38:1))
	$except.importance:=$importanceParam
End if 

If (wk_assertObjectParameter($assert; $except; "reason"; New object:C1471))
	$except.reason:=$reasonParam
End if 

wk_assertParameterCount($assert)

var $caller : Object
$caller:=getMethodCaller

$except.database:=$caller.database
$except.line:=$caller.line
$except.name:=$caller.name
$except.type:=$caller.type
$except.processName:=Current process name:C1392
$except.processId:=Current process:C322
$except.thrownTimestamp:=Timestamp:C1445