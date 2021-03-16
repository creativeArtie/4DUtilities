Class constructor
	This:C1470.brief:=""
	This:C1470.comments:=New collection:C1472
	This:C1470.params:=New collection:C1472
	This:C1470.type:=""
	
Function setPrivate_
	/// #brief check if the name ends with "_" meaning private
	If (This:C1470.name="@_")
		This:C1470.type:="private"
	End if 