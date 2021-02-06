//%attributes = {}
C_OBJECT:C1216($1;$value;$3;$storage)
C_TEXT:C284($2;$key)

$value:=utils_setParam($1;Is variant:K8:33)
$key:=utils_setParam($2;Is text:K8:3;"")
$storage:=utils_setParam($3;Is object:K8:27;Storage:C1525)


Use ($storage)
	C_OBJECT:C1216($shared)
	$shared:=OB Copy:C1225($value;ck shared:K85:29;$storage)
	$storage[$key]:=$shared
End use 