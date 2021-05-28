//%attributes = {}
//! Get Call chain to get the checking method and calling method
var $callers : Collection
var $callFrom; $checkingMethod : Object
$callers:=Get call chain:C1662
$callers:=Get call chain:C1662
$checkingMethod:=$callers[1]
$callFrom:=$callers[2]

var $0 : Collection
var $1; $atLeast; $2; $atMost : Real
var $3; $actual : Integer
$atLeast:=$1
$atMost:=$2
$actual:=$3

ASSERT:C1129(Count parameters:C259=3; $checkingMethod.name+":"+String:C10($checkingMethod.line)+\
" wrong number of parameters.")
ASSERT:C1129($atLeast<=$atMost; $checkingMethod.name+":"+String:C10($checkingMethod.line)+\
" $atLeast is more then $atMost.")

$0:=New collection:C1472
var $callers : Collection
var $callFrom; $checkingMethod : Object

$callers:=Get call chain:C1662
$checkingMethod:=$callers[1]
$callFrom:=$callers[2]

var $error : Text
$error:=$callFrom.name+":"+String:C10($callFrom.line)+" requires "+String:C10($atLeast)\
+" to "+String:C10($atMost)+" parameters for "+$checkingMethod.name+"."

ASSERT:C1129(($atLeast<=$actual) & ($actual<=$atMost); $error)

var $param : Real
For ($param; 1; $atMost)
	$0.push(New object:C1471("filled"; ($actual>=$param); \
		"index"; $param))
End for 
