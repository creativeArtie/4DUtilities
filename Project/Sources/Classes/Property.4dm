Class constructor
	var $1 : Text
	var $2 : Integer
	var $3 : Variant
	This:C1470.key:=Lowercase:C14(utils_setParam($1;Is text:K8:3);*)
	This:C1470.type:=utils_setParam($2;Is longint:K8:6)
	
	var $type : Integer
	$type:=This:C1470.type
	var $default : Variant
	Case of 
		: ($type=Is boolean:K8:9)
			$default:=False:C215
		: ($type=Is date:K8:7)
			$default:=!00-00-00!
		: ($type=Is longint:K8:6)
			ASSERT:C1129(False:C215;"Not recommanded by 4D")
		: ($type=Is time:K8:8)
			$default:=?00:00:00?
		: ($type=Is real:K8:4)
			$default:=0
		: ($type=Is text:K8:3)
			$default:=""
		: ($type=Is object:K8:27)
			$default:=New object:C1471
			ASSERT:C1129(False:C215;"Not implemented")
		: ($type=Is collection:K8:32)
			$default:=New collection:C1472
			ASSERT:C1129(False:C215;"Not implemented")
		: ($type=Is picture:K8:10)
			ASSERT:C1129(False:C215;"Not yet implemented")
			
		Else 
			ASSERT:C1129(False:C215;"Unaccepted type:"+String:C10($type))
	End case 
	This:C1470.value:=utils_setParam($3;This:C1470.type;$default)
	utils_countParams(3;Count parameters:C259)
	
	If (Count parameters:C259=3)
		This:C1470.old:=This:C1470.value
	End if 
	
Function setValue
	var $0 : cs:C1710.Property
	var $1 : Variant
	var $value : Variant
	$value:=utils_setParam($1;This:C1470.type)
	utils_countParams(1;Count parameters:C259)
	
	$0:=cs:C1710.Property
	
Function getValue
	var $0 : Variant
	utils_countParams(0;Count parameters:C259)
	
	Case of 
		: (This:C1470.type=Is time:K8:8)
			$0:=Time:C179(This:C1470.value)
		Else 
			$0:=This:C1470.value
	End case 
	
Function getType
	var $0 : Integer
	utils_countParams(0;Count parameters:C259)
	$0:=This:C1470.type
	
Function hasEdited
	var $0 : Boolean
	
	$0:=This:C1470.value=This:C1470.old
	utils_countParams(0;Count parameters:C259)
	
Function canSave
	var $1 : Variant
	var $0 : Boolean
	
	$0:=utils_setParam($1;Is variant:K8:33)=This:C1470.old
	utils_countParams(1;Count parameters:C259)
	
Function getKey
	var $0 : Text
	utils_countParams(0;Count parameters:C259)
	$0:=This:C1470.key