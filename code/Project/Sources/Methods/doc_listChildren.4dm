//%attributes = {}
#DECLARE($raw : Collection)->$methods : Collection

$raw:=utils_setParam($raw; Is collection:K8:32)

$methods:=New collection:C1472
var $r : Text
For each ($r; $raw)
	var $path : Text
	$path:=$raw{$i}
	$path:=Substring:C12($path; 0; Position:C15("."; $path)-1)
	$methods.push($path)
End for each 
