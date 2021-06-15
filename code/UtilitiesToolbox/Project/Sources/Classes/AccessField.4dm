Class extends Accessor
Class constructor($id : Text; $name : Text)
	Super:C1705($name)
	This:C1470.id:=$id
	
Function getValue
	var $0 : Variant
	$0:=OBJECT Get pointer:C1124(Object named:K67:5; This:C1470.id)->
	
Function updateWidget($typeParam : Integer)
	
	var $assert : Object
	$assert:=assertParameterSetup(Count parameters:C259)
	
	var $type
	If (assertLocalParameter($assert; ->$type))
		$type:=$typeParam
	End if 
	assertParameterCount($assert)
	
	var $background : Variant
	Case of 
		: ($type=2)
			$background:="#ff0000"
		: ($type=1)
			$background:="#ffff00"
		: ($type=0)
			$background:=Background color:K23:2
	End case 
	OBJECT SET RGB COLORS:C628(*; This:C1470.id; Foreground color:K23:1; $background)