Class extends DocSection_
Class constructor($line : Text)
	Super:C1705()
	This:C1470.name:=""
	This:C1470.return:=New object:C1471
	
	$raw:=Substring:C12($line; Length:C16("Function "))
	var $locate : Integer
	$locate:=Position:C15("("; $raw)
	If ($locate>0)
		This:C1470.name:=Substring:C12($raw; 0; $locate-1)
	End if 
	$locate:=Position:C15("->"; $raw)
	If ($locate>0)
		This:C1470.name:=Substring:C12($raw; 0; $locate-1)
	End if 
	
	If (This:C1470.name="")
		This:C1470.name:=$raw
	End if 
	Super:C1706.setPrivate_()