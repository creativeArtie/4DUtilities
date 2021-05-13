//%attributes = {"shared":true}
#DECLARE($method : Text)->$caller : Object
var $callers : Collection
var $i : Integer
$callers:=Get call chain:C1662
$caller:=New object:C1471
For ($i; 0; $callers.count()-1)
	If ($callers[$i].name=$method)
		If ($i+1<$callers.count())
			$caller:=$callers[$i+1]
		Else 
			$caller:=$callers[$i]
		End if 
		$i:=$callers.count()+4
	End if 
End for 