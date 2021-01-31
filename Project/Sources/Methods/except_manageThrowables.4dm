//%attributes = {}
C_OBJECT:C1216($exception;$1)

$exception:=utils_setParam($1;cs:C1710.Exception)
utils_countParams(1;Count parameters:C259)

$process:=String:C10(Current process:C322)
If (Not:C34(OB Is defined:C1231(Storage:C1525.utils_except.uncaught;$process)))
	Use (Storage:C1525.utils_except.uncaught)
		Storage:C1525.utils_except.uncaught[$process]:=New shared collection:C1527
	End use 
End if 

Use (Storage:C1525.utils_except.uncaught[$process])
	Storage:C1525.utils_except.uncaught[$process].push($exception)
End use 
