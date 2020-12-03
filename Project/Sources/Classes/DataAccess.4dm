Class constructor
	This:C1470.strategy:=utils_setObjectParam($1;cs:C1710.DOAstrategy;cs:C1710.KeyValueDOA.new())
	utils_countParams(2;Count parameters:C259)
	
Function createObject
	ASSERT:C1129(Value type:C1509($1)=Is text:K8:3)  // ID name
	// returning object
	var $0 : Object
	
	// Parameter Check
	$name:=utils_setParam($1;Is text:K8:3)
	// + many more parameters
	
	// Setup parameters
	var $params : Collection
	$params:=New collection:C1472
	For ($idx;2;Count parameters:C259)
		$params.push(${$idx})
	End for 
	$0:=This:C1470.strategy.create($name;$params)
	
Function deleteObject
	// Returns success or not
	var $0 : Boolean
	
	// The object to delete
	var $1 : Object
	var $obj : Object
	
	$obj:=utils_setObjectParam($1;cs:C1710.Object)
	utils_countParams(1;Count parameters:C259)
	
	$0:=This:C1470.strategy.delete($obj)
	
Function listObjects
	// The result
	var $0 : Collection
	utils_countParams(0;Count parameters:C259)
	$0:=This:C1470.strategy.list()
	
Function getObject
	ASSERT:C1129(Value type:C1509($1)=Is text:K8:3)  // name
	ASSERT:C1129(Value type:C1509($2)=Is real:K8:4)  // object id
	// return object
	var $0 : cs:C1710.TransferObject
	var $obj : cs:C1710.TransferObject
	// doa name
	var $1 : Text
	var $name : Text
	// object id
	var $2 : Integer
	var $id : Integer
	
	$name:=utils_setParam(Lowercase:C14($1);Is text:K8:3)
	$id:=utils_setParam(Lowercase:C14($2);Is variant:K8:33;"")
	utils_countParams(2;Count parameters:C259)
	
	$0:=This:C1470.strategy.get($name;$id)
	
Function saveObject
	ASSERT:C1129(OB Instance of:C1731($1;cs:C1710.TransferObject))  // object to save
	
	// true if a new saved object has been created
	var $0 : Boolean
	
	var $1 : Object
	var $obj : Object
	
	$obj:=utils_setParam($obj;Is object:K8:27)
	utils_countParams(1;Count parameters:C259)
	
	$0:=This:C1470.strategy.save($obj)