//%attributes = {}
#DECLARE->$message : Text
var $callers : Collection
var $caller : Object
$caller:=getMethodCaller
$message:=$caller.name+"("+$caller.type+"):"+String:C10($caller.line)+":"