Class extends Use
Class constructor
	
	var $1 : Text
	var $2 : Text
	C_POINTER:C301($pointer)
	$pointer:=OBJECT Get pointer:C1124(Object named:K67:5; $1)
	Super:C1705(utils_getPointerDisplayName($pointer))
	This:C1470.pointer:=utils_getRequireValue($pointer; Is pointer:K8:14)
	utils_countParams(2; Count parameters:C259)
	
Function getValue
	$0:=(This:C1470.pointer)->{0}
	
Function setError
	var $1 : Text
	utils_countParams(1; Count parameters:C259)
	Super:C1706.setError($1)
	
	OBJECT SET RGB COLORS:C628(This:C1470.pointer->; Foreground color:K23:1; "#ff0000")
	This:C1470.state:=2
	
Function setWarning
	var $1 : Text
	utils_countParams(1; Count parameters:C259)
	Super:C1706.setWarning($1)
	OBJECT SET RGB COLORS:C628(This:C1470.pointer->; Foreground color:K23:1; "#ffff00")
	This:C1470.state:=1
	
Function setPass
	utils_countParams(0; Count parameters:C259)
	Super:C1706.setPass()
	OBJECT SET RGB COLORS:C628(This:C1470.pointer->; Foreground color:K23:1; Background color:K23:2)
	This:C1470.state:=0