//%attributes = {}
#DECLARE($param1 : Real; $param2 : Real; $param3 : Text)

var $param : Real
For each ($param; utils_listOptionalParams(1; 3; Count parameters:C259))
	Case of 
		: (param=2)
			$param2:=4
		: (param3=3)
			$param3:="Hello"
	End case 
End for each 