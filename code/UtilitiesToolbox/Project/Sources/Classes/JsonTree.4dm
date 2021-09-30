Class constructor($valueParam; $nameParam : Text)
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $value
	If (wk_assertLocalParameter($assert; ->$value))
		$value:=$valueParam
	End if 
	
	If (wk_assertObjectParameter($assert; This:C1470; "name"; ""))
		This:C1470.name:=$nameParam
	End if 
	
	wk_assertParameterCount($assert)
	
	This:C1470.children:=New collection:C1472
	Case of 
		: (Value type:C1509($value)=Is object:K8:27)
			var $key : Text
			For each ($key; $value)
				This:C1470.children.push(cs:C1710.JsonTree.new($value[$key]; $key))
			End for each 
		: (Value type:C1509($value)=Is collection:K8:32)
			var $idx : Integer
			var $child
			$idx:=0
			For each ($child; $value)
				This:C1470.children.push(cs:C1710.JsonTree.new($child; String:C10($idx)))
				$idx:=$idx+1
			End for each 
		Else 
			This:C1470.value:=$value
	End case 
	
Function getColumns()->$result : Real
	$result:=0
	var $child : cs:C1710.JsonTree
	For each ($child; This:C1470.children)
		var $depth : Integer
		$depth:=$child.getColumns()
		If ($depth>$result)
			$result:=$depth
		End if 
	End for each 
	$result:=$result+1
Function getSize()->$result : Integer
	If (OB Is defined:C1231(This:C1470; "value"))
		$result:=1
	Else 
		var $child : cs:C1710.JsonTree
		For ($child; This:C1470.children)
			$result:=$result+$child.getSize()
		End for 
	End if 
	
Function listRows($columnsParam : Integer; $keysParam : Collection)->$result : Collection
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	
	var $columns : Integer
	If (wk_assertLocalParameter($assert; ->$columns; This:C1470.getColumns()))
		$columns:=$columnsParam
	End if 
	
	var $keys : Collection
	If (wk_assertLocalParameter($assert; ->$keys; \
		New collection:C1472.resize($columns; ""))\
		)
		$keys:=$keysParam
	End if 
	
	wk_assertParameterCount($assert)
	
	$result:=New collection:C1472
	
	var $idx : Integer
	If (OB Is defined:C1231(This:C1470; "value"))
		$idx:=$keys.indexOf("")
		If ($idx=($keys.length-1))
			$keys[$keys.length-2]:=$keys[$keys.length-2]+"⮞"+This:C1470.name
		Else 
			$keys[$idx]:=This:C1470.name
		End if 
		$keys[$keys.length-1]:=String:C10(This:C1470.value)
		$result.push($keys)
		
	Else 
		var $childKeys : Collection
		$childKeys:=$keys.copy()
		
		$idx:=$childKeys.indexOf("")
		If ($idx=($childKeys.length-1))
			$childKeys[$childKeys.length-2]:=$keys[$childKeys.length-2]+"⮞"+This:C1470.name
		Else 
			$childKeys[$idx]:=This:C1470.name
		End if 
		var $child : cs:C1710.JsonTree
		For each ($child; This:C1470.children)
			$result.combine($child.listRows($columns; $childKeys.copy()))
		End for each 
	End if 