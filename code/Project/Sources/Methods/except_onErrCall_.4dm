//%attributes = {}

var $exception : Object
var $chain : Collection

ARRAY LONGINT:C221($codes; 0)
ARRAY TEXT:C222($comp; 0)
ARRAY TEXT:C222($text; 0)
GET LAST ERROR STACK:C1015($codes; $comp; $text)

var $reason : Object
$reason:=New object:C1471
$reason.errorMethod:=Error method
$reason.errorCode:=Error
$reason.errorLine:=Error line
$reason.errorFourmla:=Error formula

ARRAY LONGINT:C221($codes; 0)
ARRAY TEXT:C222($comp; 0)
ARRAY TEXT:C222($text; 0)
GET LAST ERROR STACK:C1015($codes; $comp; $text)
$reason.codes:=$codes
$reason.intComp:=$comp
$reason.text:=$text

var $i : Integer
var $caller : Object
var $callers : Collection
$callers:=Get call chain:C1662
For ($i; 0; $callers.count()-1)
	If ($callers[$i].name=Error method)
		$caller:=$callers[$i]
		$i:=$callers.count()+4
	End if 
End for 

$exception:=cs:C1710.Exception.new(\
Error formula+": "+$text{1}; $caller; \
Error message:K38:3; $reason\
)
except_addException_($exception)