Class extends DOAstrategy
Class constructor
	Use (Storage:C1525)
		If (Not:C34(OB Is defined:C1231(Storage:C1525;"KeyValues")))
			Storage:C1525.KeyValues:=New shared object:C1526
		End if 
	End use 
	
Function create
	var $0 : cs:C1710.TransferObject
	var $obj : cs:C1710.TransferObject
	
	var $1 : Text
	var $name : Text
	
	var $2 : Collection
	var $params : Collection
	$name:=Lowercase:C14(utils_setParam($1;Is text:K8:3);*)
	$params:=utils_setParam($2;Is collection:K8:32)
	
	var $prop : cs:C1710.Property
	Case of 
		: ($params.length=1)
			$prop:=cs:C1710.Property.new($name;$params[0])
		: ($params.length=2)
			$prop:=cs:C1710.Property.new($name;$params[0];$params[1])
	End case 
	
	var $entity : 4D:C1709.Entity
	$entity:=ds:C1482.KeyValues.new()
	$entity.Key:=$prop.getKey()
	$entity.Value:=$prop.getValue()
	$entity.Type:=$prop.getType()
	$entity.save()
	
	Use (Storage:C1525.KeyValues)
		Storage:C1525.KeyValues[$name]:=New shared object:C1526
		Storage:C1525.KeyValues[$name].Value:=$prop.getValue()
		Storage:C1525.KeyValues[$name].Type:=$prop.getType()
		
		var $list : Integer
		$list:=Load list:C383("KeyValue_KeyList")
		If (Is a list:C621($list))
			ASSERT:C1129(Find in list:C952($list;$name;0)=0)
		Else 
			$list:=New list:C375
		End if 
		
		$child:=New list:C375
		APPEND TO LIST:C376($list;$name;$child)
		SAVE LIST:C384($list;"KeyValue_KeyList")
	End use 
	$0:=$prop
	
	
Function get
	// return object
	var $0 : cs:C1710.TransferObject
	var $obj : cs:C1710.TransferObject
	// doa name
	var $1 : Text
	var $name : Text
	
	$name:=Lowercase:C14(utils_setParam($1;Is text:K8:3);*)
	utils_countParams(1;Count parameters:C259)
	
	var $ready : Boolean
	$ready:=False:C215
	var $type : Integer
	var $value : Variant
	var $prop : cs:C1710.Property
	Case of 
		: (OB Is defined:C1231(Storage:C1525.KeyValues;$name))
			Use (Storage:C1525.KeyValues[$name])
				$type:=Storage:C1525.KeyValues[$name].Type
				$value:=Storage:C1525.KeyValues[$name].Value
				$prop:=cs:C1710.Property.new($name;$type;$value)
			End use 
			$0:=$prop
		Else 
			$entity:=ds:C1482.KeyValues.query("Key=\""+$name+"\"").first()
			$type:=$entity.Type
			$value:=$entity.Value
			$prop:=cs:C1710.Property($name;$type;$value)
			Use (Storage:C1525.KeyValues)
				Storage:C1525.KeyValues[$name]:=New shared object:C1526
				Storage:C1525.KeyValues[$name].Type:=$type
				Storage:C1525.KeyValues[$name].Value:=$value
			End use 
			$0:=$prop
	End case 
	
Function delete
	var $0 : Boolean
	var $1 : cs:C1710.Property
	var $prop : cs:C1710.Property
	
	var $name : Text
	
	$prop:=utils_setParam($1;cs:C1710.Property)
	utils_countParams(1;Count parameters:C259)
	$name:=Lowercase:C14($prop.key)
	
	var $idx : Integer
	
	Use (Storage:C1525.KeyValues)
		$idx:=Storage:C1525.doa[$name].data.findIndex("dao_findName";$name)
		If ($idx#-1)
			Storage:C1525.KeyValues.remove($name)
		End if 
		
		var $entity : 4D:C1709.Entity
		$entity:=ds:C1482.KeyValues.query("name=\""+$name+"\"")
		$entity.first().delete()
		
		var $list : Integer
		$list:=Load list:C383("KeyValue_KeyList")
		$idx:=Find in list:C952($list;$name;0)
		If ($idx#0)
			DELETE FROM LIST:C624($list;$idx)
			SAVE LIST:C384($list;"KeyValue_KeyList")
		End if 
	End use 
	
Function list
	utils_countParams(0;Count parameters:C259)
	
	var $list : Integer
	$list:=Load list:C383("KeyValue_KeyList")
	ARRAY TEXT:C222($array;0)
	LIST TO ARRAY:C288($list;$array)
	var $collect : Collection
	$collect:=New collection:C1472
	
	var $pos : Integer
	For ($pos;0;Count list items:C380($list;*))
		var $ref : Integer
		var $name : Text
		GET LIST ITEM:C378($list;$pos;$ref;$name)
		$collect.append(This:C1470.get($name))
	End for 
	$0:=$collect
Function save
	// true if a new saved object has been created
	var $0 : Boolean
	var $1 : cs:C1710.Property
	var $obj : cs:C1710.Property
	var $name : Text
	
	$obj:=utils_setParam($1;cs:C1710.Property)
	$name:=Lowercase:C14($obj.key)
	
	var $entity : 4D:C1709.Entity
	$entity:=ds:C1482.KeyValues.query("name=\""+$name+"\"")
	If ($obj.canSave($entity.Value))
		$entity.Value:=$entity.Value
		var $result : Object
		Use (Storage:C1525.KeyValues)
			
			$result:=$entity.save()
			If ($result.success)
				Storage:C1525.KeyValues[$name].Type:=$obj.type
				Storage:C1525.KeyValues[$name].Value:=$obj.getValue()
			End if 
		End use 
	End if 
	