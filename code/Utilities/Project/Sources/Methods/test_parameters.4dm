//%attributes = {"shared":true}
var $1; $param1 : Text
var $2; $param2 : Text
var $0 : Text

var $param : Object
For each ($param; utils_listParameters(0; 2; Count parameters:C259))
	Case of 
		: ($param.index=1)
			If ($param.filled)
				$param1:=$1
			Else 
				$param1:="Hello"
			End if 
			
		: ($param.index=2)
			If ($param.filled)
				$param2:=$2
			Else 
				$param2:="World"
			End if 
	End case 
End for each 
$0:=$param1+" "+$param2
