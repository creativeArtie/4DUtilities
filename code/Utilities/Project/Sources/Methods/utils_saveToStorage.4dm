//%attributes = {"shared":true}
#DECLARE($value : Variant; $key : Text; $storage : Object)

var $count : Real
$value:=utils_assertParameter($1; ->$count; Count parameters:C259)
$key:=utils_assertParameter($2; ->$count; Count parameters:C259; "")
$storage:=utils_assertParameter($3; ->$count; Count parameters:C259; \
Storage:C1525)  //! #todo check shared
utils_assertParameterCount($count; Count parameters:C259)


Use ($storage)
	var $shared : Object
	$shared:=OB Copy:C1225($value; ck shared:K85:29; $storage)
	$storage[$key]:=$shared
End use 