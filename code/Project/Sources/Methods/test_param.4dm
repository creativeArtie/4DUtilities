//%attributes = {}
#DECLARE($a : Text; $b : Integer; $opt1 : Variant; $opt2)

$a:=utils_setParam($a; 1; Count parameters:C259)
$b:=utils_setParam($b; 2; Count parameters:C259)
$opt1:=utils_setParam($opt1; 3; Count parameters:C259; 23)
$opt2:=utils_setParam($opt2; 4; Count parameters:C259; "Hello World")
utils_countParam(4; Count parameters:C259)