//%attributes = {"shared":true}
C_OBJECT:C1216(ut_exceptions)
ut_exceptions:=New object:C1471

ARRAY LONGINT:C221($codes; 0)
ARRAY TEXT:C222($comp; 0)
ARRAY TEXT:C222($text; 0)
GET LAST ERROR STACK:C1015($codes; $comp; $text)

var $collect : Collection
$collect:=New collection:C1472
ARRAY TO COLLECTION:C1563($collect; $codes)
ut_exceptions.codes:=$collect

$collect:=New collection:C1472
ARRAY TO COLLECTION:C1563($collect; $comp)
ut_exceptions.comp:=$collect

$collect:=New collection:C1472
ARRAY TO COLLECTION:C1563($collect; $text)
ut_exceptions.text:=$collect