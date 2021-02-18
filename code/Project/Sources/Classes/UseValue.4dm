Class extends Use
Class constructor
	Super:C1705()
	var $1 : Variant
	var $2 : Text
	Super:C1705(utils_getOptionValue($2; ""; Is text:K8:3))
	This:C1470.value:=utils_getRequireValue($1; Is variant:K8:33)
	utils_countParams(2; Count parameters:C259)
	
Function getValue
	$0:=This:C1470.value