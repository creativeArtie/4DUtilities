Class constructor
	ASSERT:C1129(Value type:C1509($1)=Is text:K8:3)
	ASSERT:C1129(Value type:C1509($2)=Is longint:K8:6)
	var $1 : Text
	var $2 : Integer
	var $3 : Variant
	var $default : Variant
	$id:=Lowercase:C14($1)
	$type:=$2
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
	
	Case of 
		: (Count parameters:C259=2)
			This:C1470.key:=$id
			This:C1470.type:=$type
			This:C1470.value:=$default
		: (Count parameters:C259=3)
			This:C1470.key:=$id
			This:C1470.type:=$type
			ASSERT:C1129(Value type:C1509($3)=This:C1470.type)
			This:C1470.value:=$3
			This:C1470.old:=$3
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	
Function setValue
	var $0 : cs:C1710.Property
	var $1 : Variant
	Case of 
		: (Count parameters:C259=1)
			ASSERT:C1129(Value type:C1509($1)=This:C1470.type)
			This:C1470.value:=$1
	End case 
	$0:=cs:C1710.Property
	
Function getValue
	var $0 : Variant
	Case of 
		: (Count parameters:C259=0)
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	Case of 
		: (This:C1470.type=Is time:K8:8)
			$0:=Time:C179(This:C1470.value)
		Else 
			$0:=This:C1470.value
	End case 
	
Function getType
	var $0 : Integer
	Case of 
		: (Count parameters:C259=0)
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	$0:=This:C1470.type
	
Function hasEdited
	var $0 : Boolean
	$0:=This:C1470.value=This:C1470.old
	
Function canSave
	var $1 : Variant
	var $0 : Boolean
	$0:=True:C214
	Case of 
		: (Count parameters:C259=1)
			$0:=$1=This:C1470.old
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	
Function getKey
	var $0 : Text
	Case of 
		: (Count parameters:C259=0)
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	$0:=This:C1470.key