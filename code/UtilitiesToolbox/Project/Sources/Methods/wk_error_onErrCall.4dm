//%attributes = {"shared":true}
wk_assertNoParameters(Count parameters:C259)

var $reason : Object
$reason:=New object:C1471
//$reason.errorMethod:=Error method
//$reason.errorCode:=Error
//$reason.errorLine:=Error line
//$reason.errorFourmla:=Error formula

ARRAY LONGINT:C221($codes; 0)
ARRAY TEXT:C222($comp; 0)
ARRAY TEXT:C222($text; 0)
GET LAST ERROR STACK:C1015($codes; $comp; $text)
$reason.codes:=New collection:C1472
$reason.intComp:=New collection:C1472
$reason.text:=New collection:C1472

ARRAY TO COLLECTION:C1563($reason.codes; $codes)
ARRAY TO COLLECTION:C1563($reason.intComp; $comp)
ARRAY TO COLLECTION:C1563($reason.text; $text)

wk_error_throw("Error code from 4d: "+$text{1}; $reason)