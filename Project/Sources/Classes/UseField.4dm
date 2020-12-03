Class extends Use
Class constructor
	var $1 : Pointer
	var $2 : Text
	ASSERT:C1129(Not:C34(Is nil pointer:C315($1)))
	Super:C1705()
	Case of 
		: (Count parameters:C259=1)
			This:C1470.pointer:=$1
			var $name : Text
			var $tableNum : Integer
			var $fieldNum : Integer
			RESOLVE POINTER:C394($1;$name;$tableNum;$fieldNum)
			If ($tableNum=-1)
				// Variable of array
				This:C1470.name:=$name
			Else 
				If ($name#"")
					// array element
					This:C1470.name:=$name+"["+String:C10($tableNum)+"]"
					If ($fieldNum#-1)
						This:C1470.name:=This:C1470.name+"["+String:C10($fieldNum)+"]"
					End if 
				Else 
					// table or field
					This:C1470.name:=Table name:C256($tableNum)
					If ($fieldNum#-1)
						This:C1470.name:=This:C1470.name+" - "+Field name:C257($tableNum;$fieldNum)
					End if 
				End if 
			End if 
		: (Count parameters:C259=2)
			This:C1470.pointer:=$1
			This:C1470.name:=$2
	End case 
	This:C1470.message:=""
Function getValue
	$0:=(This:C1470.pointer)->
Function setError
	var $1 : Text
	Case of 
		: (Count parameters:C259=1)
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	Super:C1706.setError($1)
	
	OBJECT SET RGB COLORS:C628(This:C1470.pointer->;Foreground color:K23:1;"#ff0000")
	This:C1470.state:=2
	
Function setWarning
	var $1 : Text
	Case of 
		: (Count parameters:C259=1)
		Else 
			ASSERT:C1129(False:C215;"Wrong number of params.")
	End case 
	Super:C1706.setWarning($1)
	OBJECT SET RGB COLORS:C628(This:C1470.pointer->;Foreground color:K23:1;"#ffff00")
	This:C1470.state:=1
Function setPass
	Super:C1706.setPass()
	OBJECT SET RGB COLORS:C628(This:C1470.pointer->;Foreground color:K23:1;Background color:K23:2)
	This:C1470.state:=0