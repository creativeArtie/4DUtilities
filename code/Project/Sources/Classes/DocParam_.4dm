Class extends DocValue_
Class constructor($name : Text; $brief : Text; $type : Integer)
	Super:C1705($name; $type)
	This:C1470.name:=utils_getRequireValue($1)
	This:C1470.brief:=utils_getRequireValue($2)
	This:C1470.type:=utils_getOptionValue($3; Is variant:K8:33)
	