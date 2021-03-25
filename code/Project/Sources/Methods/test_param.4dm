//%attributes = {}
#DECLARE($a : Text; $b : Integer; $opt1 : Variant; $opt2)->$result : Object

var $count : Integer
$a:=utils_assertParameter($a; ->$count; Count parameters:C259)
$b:=utils_assertParameter($b; ->$count; Count parameters:C259)
$opt1:=utils_assertParameter($opt1; ->$count; Count parameters:C259; 23)
$opt2:=utils_assertParameter($opt2; ->$count; Count parameters:C259; "Hello World")
utils_assertParameterCount($count; Count parameters:C259)

$result:=New object:C1471("a"; $a; \
"b"; $b; \
"opt1"; $opt1; \
"opt2"; $opt2)