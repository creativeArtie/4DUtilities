//%attributes = {}
#DECLARE($value : Variant; $key : Text; $storage : Object)

$value:=utils_setParam($1; Is variant:K8:33)
$key:=utils_setParam($2; Is text:K8:3; "")
$storage:=utils_setParam($3; Is object:K8:27; Storage:C1525)


Use ($storage)
	var $shared : Object
	$shared:=OB Copy:C1225($value; ck shared:K85:29; $storage)
	$storage[$key]:=$shared
End use 