//%attributes = {"shared":true}

$dataClass:=utils_setParam($1;4D:C1709.DataClass)

Use (Storage:C1525.utils_except)
	Storage:C1525.utils_except.logTable:=$dataClass
End use 