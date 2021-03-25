Class extends Use
Class constructor
	var $1 : Text
	
	var $count : Real
	C_POINTER:C301($pointer)
	$pointer:=OBJECT Get pointer:C1124(Object named:K67:5; \
		utils_assertParameter($1; ->$count; Count parameters:C259))
	
	Super:C1705(utils_getPointerDisplayName($pointer))
	This:C1470.pointer:=$pointer  //! #todo check pointer type
	utils_assertParameterCount($count; Count parameters:C259)
	
Function getValue
	var $0 : Variant
	$0:=(This:C1470.pointer)->
	
Function setError
	var $1 : Text
	Super:C1706.setError($1)
	utils_assertParameterCount(1; Count parameters:C259)
	
	OBJECT SET RGB COLORS:C628(This:C1470.pointer->; Foreground color:K23:1; "#ff0000")
	
Function setWarning
	var $1 : Text
	Super:C1706.setWarning($1)
	utils_assertParameterCount(1; Count parameters:C259)
	OBJECT SET RGB COLORS:C628(This:C1470.pointer->; Foreground color:K23:1; "#ffff00")
	
Function setPass
	utils_assertParameterCount(0; Count parameters:C259)
	Super:C1706.setPass()
	OBJECT SET RGB COLORS:C628(This:C1470.pointer->; Foreground color:K23:1; Background color:K23:2)