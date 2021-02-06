//%attributes = {"shared":true}

$dataClass:=utils_setParam($1;4D:C1709.DataClass)

If (Not:C34(OB Is defined:C1231(Storage:C1525;"utils_except")))
	Use (Storage:C1525)
		Storage:C1525.utils_except:=New shared object:C1526
	End use 
End if 

Use (Storage:C1525.utils_except)
	C_OBJECT:C1216($shared)
	$shared:=OB Copy:C1225($dataClass;ck shared:K85:29;Storage:C1525.utils_except)
	Storage:C1525.utils_except.logTable:=$shared
End use 