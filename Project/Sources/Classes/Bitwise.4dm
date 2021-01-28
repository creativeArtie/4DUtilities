Class constructor
	This:C1470.flags:=utils_setParam($1;Is integer:K8:5;0)
	utils_countParams(1;Count parameters:C259)
Function setFlag
	$use:=utils_setParam($1;Is integer:K8:5)
	This:C1470.flags:=This:C1470.flags | (1<$use)
	