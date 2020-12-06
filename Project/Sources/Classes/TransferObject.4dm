Class constructor
	ASSERT:C1129(Value type:C1509($1)=Is collection:K8:32)
	var $1 : Collection
	This:C1470.data:=New object:C1471
Function hasProperty
	var $ans : Boolean
	var $1 : Text
	var $name : Text
	
	$key:=Lowercase:C14(utils_setParam($1;Is text:K8:3);*)
	utils_countParams(1;Count parameters:C259)
	
	$0:=OB Is defined:C1231(This:C1470.data;$key)
	
Function getProperty
	ASSERT:C1129(Value type:C1509($1)=Is text:K8:3)
	var $0 : cs:C1710.TransferObject
	var $1 : Text
	var $key : Text
	$key:=Lowercase:C14(utils_setParam($1;Is text:K8:3);*)
	ASSERT:C1129(OB Is defined:C1231(This:C1470.data;$key))
	$0:=This:C1470.data[$key]
	
Function addProperty
	ASSERT:C1129(Value type:C1509($1)=Is text:K8:3)
	ASSERT:C1129(Value type:C1509($2)=Is longint:K8:6)
	var $0 : cs:C1710.TransferObject
	var $1 : Text
	var $2 : Integer
	var $3 : Variant
	var $prop : cs:C1710.Property
	Case of 
		: (Count parameters:C259=2)
			$prop:=cs:C1710.Property.new($1;$2)
		: (Count parameters:C259=3)
			$prop:=cs:C1710.Property.new($1;$2;$3)
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	$key:=Lowercase:C14(utils_setParam($1;Is text:K8:3);*)
	
	ASSERT:C1129(Not:C34(OB Is defined:C1231(This:C1470;$key)))
	This:C1470.data[$key]:=$prop
	$0:=This:C1470
	
Function setPropertyValue
	ASSERT:C1129(Value type:C1509($1)=Is text:K8:3)
	var $0 : cs:C1710.TransferObject
	var $1 : Text
	var $key : Text
	var $2 : Variant
	var $value : Variant
	
	$key:=Lowercase:C14(utils_setParam($1;Is text:K8:3);*)
	$value:=utils_setParam($2;Is variant:K8:33)
	utils_countParams(2;Count parameters:C259)
	
	ASSERT:C1129(OB Is defined:C1231(This:C1470.data;$key))
	This:C1470.data[$key].setValue($value)
	$0:=This:C1470
	
Function getPropertyValue
	ASSERT:C1129(Value type:C1509($1)=Is text:K8:3)
	var $0 : Variant
	var $1 : Text
	var $key : Text
	
	$key:=Lowercase:C14(utils_setParam($1;Is text:K8:3);*)
	utils_countParams(1;Count parameters:C259)
	
	ASSERT:C1129(OB Is defined:C1231(This:C1470.data;$key))
	$0:=This:C1470.data[$key].getValue()
	
Function getPropertyKeys
	var $0 : Collection
	utils_countParams(0;Count parameters:C259)
	
	$0:=OB Keys:C1719(This:C1470.data)
	
Function removeProperty
	ASSERT:C1129(Value type:C1509($1)=Is text:K8:3)
	var $0 : cs:C1710.TransferObject
	var $1 : Text
	var $key : Text
	$key:=Lowercase:C14(utils_setParam($1;Is text:K8:3);*)
	utils_countParams(1;Count parameters:C259)
	OB REMOVE:C1226(This:C1470.data;$key)
	$0:=This:C1470