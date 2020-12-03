Class extends DOAstrategy
Class constructor
	Super:C1705()
	// Create the shared doa as needed
	If (Not:C34(OB Is defined:C1231(Storage:C1525;"doa")))
		Use (Storage:C1525)
			Storage:C1525.doa:=New shared object:C1526
		End use 
	End if 
	
Function create
	var $0 : cs:C1710.TransferObject
	var $obj : cs:C1710.TransferObject
	
	var $1 : Text
	var $name : Text
	ASSERT:C1129(Value type:C1509($1)=Is text:K8:3)
	
	var $2 : Collection
	var $params : Collection
	ASSERT:C1129(Value type:C1509($2)=Is collection:K8:32)
	
	
	// Parameter Check
	Case of 
		: (Count parameters:C259=2)
			$name:=Lowercase:C14($1)
			$params:=$2
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	
	// Create an unique id + name
	var $id : Integer
	If (Not:C34(OB Is defined:C1231(Storage:C1525.doa;$name)))
		// Needs new name
		Use (Storage:C1525.doa)
			Storage:C1525.doa[$name]:=New shared object:C1526
			Storage:C1525.doa[$name].data:=New shared collection:C1527
			Storage:C1525.doa[$name].counter:=1
			$id:=1
		End use 
	Else 
		
		// No new name needed
		$id:=Storage:C1525.doa[$name].counter+1
		Use (Storage:C1525.doa)
			Storage:C1525.doa[$name].counter:=$id
		End use 
	End if 
	
	// Setup the object
	$obj:=cs:C1710.TransferObject.new($params)
	$obj.id:=$id
	$obj.name:=$name
	$0:=$obj
	
Function get
	ASSERT:C1129(Value type:C1509($1)=Is text:K8:3)  // name
	ASSERT:C1129(Value type:C1509($2)=Is longint:K8:6)  // object id
	// return object
	var $0 : cs:C1710.TransferObject
	var $obj : cs:C1710.TransferObject
	// doa name
	var $1 : Text
	var $name : Text
	// object id
	var $2 : Integer
	var $id : Integer
	
	// parameter check
	Case of 
		: (Count parameters:C259=2)
			$name:=Lowercase:C14($1;*)
			$id:=$2
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	// finds the stored object
	ASSERT:C1129(OB Is defined:C1231(Storage:C1525.doa;$name))
	$stored:=Storage:C1525.doa[$name].data.find("dao_findId";$id)
	ASSERT:C1129(OB Is defined:C1231($stored))
	
	Use ($stored)
		// Initialized the object
		$obj:=cs:C1710.TransferObject.new(New collection:C1472)
		$obj.id:=$id
		$obj.name:=$name
		
		// Loads the properties
		var $prop : Text
		For each ($prop;$stored.data)
			var $key : Text
			var $type : Integer
			var $value : Variant
			$key:=$prop
			$type:=$stored.data[$prop].type
			$value:=$stored.data[$prop].value
			$obj.addProperty($key;$type;$value)
		End for each 
	End use 
	
	$0:=$obj
Function delete
	ASSERT:C1129(OB Instance of:C1731($1;cs:C1710.TransferObject))
	// Returns success or not
	var $0 : Boolean
	
	// The object to delete
	var $1 : cs:C1710.TransferObject
	var $obj : cs:C1710.TransferObject
	
	// Name and id of object
	var $name : Text
	var $id : Integer
	
	// Parameter Check
	Case of 
		: (Count parameters:C259=1)
			$obj:=$1
			$name:=Lowercase:C14($obj.name;*)
			$id:=$obj.id
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	
	// Check if the name exists
	ASSERT:C1129(OB Is defined:C1231(Storage:C1525.doa;$name))
	
	// Find and delete
	Use (Storage:C1525.doa)
		var $idx : Integer
		$idx:=Storage:C1525.doa[$name].data.findIndex("dao_findId";$id)
		If ($idx#-1)
			// Object found
			Storage:C1525.doa[$name].data.remove($idx)
			$0:=True:C214
		Else 
			// Object not found
			$0:=False:C215
		End if 
	End use 
Function list
	ASSERT:C1129(Value type:C1509($1)=Is text:K8:3)  // name
	// The result
	var $0 : Collection
	var $list : Collection
	$list:=New collection:C1472
	// name of the list
	var $1 : Text
	var $name : Text
	
	// parameter check
	Case of 
		: (Count parameters:C259=1)
			$name:=Lowercase:C14($1;*)
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	
	// search for the name
	ASSERT:C1129(OB Is defined:C1231(Storage:C1525.dao;$name))
	
	// get cs.TransferObject for each item
	var $raw : Object
	For each ($raw;Storage:C1525.dao[$name].data)
		$list.push(This:C1470.getObject($name;$raw.id))
	End for each 
	$list:=$0
	
Function save
	ASSERT:C1129(OB Instance of:C1731($1;cs:C1710.TransferObject))  // object to save
	
	// true if a new saved object has been created
	var $0 : Boolean
	
	var $1 : cs:C1710.TransferObject
	var $obj : cs:C1710.TransferObject
	
	// parameter check
	Case of 
		: (Count parameters:C259=1)
			$obj:=$1
			$name:=Lowercase:C14($obj.name;*)
			$id:=$obj.id
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	var $saved : Object
	
	// search for the name object
	ASSERT:C1129(OB Is defined:C1231(Storage:C1525.doa;$name))
	Use (Storage:C1525.doa[$name])
		var $storing : Object
		$storing:=Storage:C1525.doa[$name].data.find("dao_findId";$id)
		
		// creates a new object as needed
		var $allowed : Boolean
		$allowed:=True:C214
		If (OB Is defined:C1231($storing))
			For each ($key;$storing.data) Until ($allowed)
				If ($obj.hasProperty($key))
					var $prop : cs:C1710.Property
					$prop:=$obj.getProperty($key)
					$allowed:=$prop.canSave($storing.data[$key].value)
				Else 
					$allowed:=False:C215
				End if 
			End for each 
		Else 
			$storing:=New shared object:C1526
			Use ($storing)
				$storing.id:=$obj.id
			End use 
			Storage:C1525.doa[$name].data.push($storing)
		End if 
		
		If ($allowed)
			// saves the properties
			Use ($storing)
				$storing.data:=New shared object:C1526
				var $key : Text
				For each ($key;$obj.data)
					$storing.data[$key]:=New shared object:C1526
					$storing.data[$key].type:=$obj.data[$key].type
					$storing.data[$key].value:=$obj.data[$key].value
				End for each 
			End use 
		End if 
	End use 
	
	$0:=$allowed