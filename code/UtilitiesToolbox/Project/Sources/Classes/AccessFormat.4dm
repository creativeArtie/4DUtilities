Class extends AccessField
Class constructor($idParam : Text; $nameParam : Text)
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $id : Text
	If (wk_assertLocalParameter($assert; ->$id))
		$id:=$idParam
	End if 
	
	var $name : Text
	If (wk_assertLocalParameter($assert; ->$name))
		$name:=$nameParam
	End if 
	
	Super:C1705($id; $name)
	
	This:C1470.formatter:=cs:C1710.Formatter.new("")
	This:C1470.category:=""
	
	wk_assertParameterCount($assert)
	
Function getValue->$value : Variant
	$value:=This:C1470.formatter.extract(Super:C1706.getValue())
	
Function handleEvents
	If (Form event code:C388=On Data Change:K2:15)
		This:C1470.formatter.update(This:C1470.getValue())
		OBJECT Get pointer:C1124(Object named:K67:5; This:C1470.id)->:=This:C1470.formatter.formatted
	End if 
	
Function updateWidget($typeParam : Integer)
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $type
	If (wk_assertLocalParameter($assert; ->$type))
		$type:=$typeParam
	End if 
	wk_assertParameterCount($assert)
	Super:C1706.updateWidget($type)
	This:C1470.category:=This:C1470.formatter.category