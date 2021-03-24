//%attributes = {}
#DECLARE($a : Text; $b : Integer; $opt1 : Variant; $opt2)

$a:=utils_setParam($a; Count parameters:C259; 4)
$b:=utils_setParam($b; Count parameters:C259; 4)
$opt1:=utils_setParam($opt1; Count parameters:C259; 4; 23)
$opt2:=utils_setParam($opt2; Count parameters:C259; 4; "Hello World")
utils_countParams(