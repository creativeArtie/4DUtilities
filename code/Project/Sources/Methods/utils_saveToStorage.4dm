//%attributes = {}
#DECLARE($value : Variant; $key : Text; $storage : Object)

$value:=utils_getRequireValue($1; Is variant:K8:33)
$key:=utils_getOptionValue($2; ""; Is text:K8:3)
$storage:=utils_getOptionValue($3; Storage:C1525; \
Formula:C1597(OB Is shared:C1759($3)))


Use ($storage)
	var $shared : Object
	$shared:=OB Copy:C1225($value; ck shared:K85:29; $storage)
	$storage[$key]:=$shared
End use 