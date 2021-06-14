//%attributes = {}
#DECLARE($param1 : Text; $param2 : Text; $param3 : Text)->$result : cs:C1710.ParamTest

Case of 
	: (Count parameters:C259=0)
		$result:=cs:C1710.ParamTest.new()
	: (Count parameters:C259=1)
		$result:=cs:C1710.ParamTest.new($param1)
	: (Count parameters:C259=2)
		$result:=cs:C1710.ParamTest.new($param1; $param2)
	: (Count parameters:C259=3)
		$result:=cs:C1710.ParamTest.new($param1; $param2; $param3)
End case 
