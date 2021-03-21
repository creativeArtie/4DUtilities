Class constructor($value : Text; $type : Text)
	
	Case of 
		: (Count parameters:C259=1)
			var $split : Collection
			$split:=Split string:C1554($value; ":"; sk trim spaces:K86:2)
			This:C1470.name:=$split[0]
			Case of 
				: ($split.length=3)
					var $typeFirst : Text
					$typeFirst:=Split string:C1554($split[2]; ".")[1]
					This:C1470.type:=$split[1]+"."+$typeFirst
				: ($split.length=2)
					This:C1470.type:=$split[1]
				Else 
					This:C1470.type:="Variant"
			End case 
		: (Count parameters:C259=2)
			This:C1470.name:=$value
			This:C1470.type:=$type
	End case 
	This:C1470.brief:=""
	This:C1470.defaults:=""
	
Function getDeclare->$text : Text
	$text:=This:C1470.name+" : "+This:C1470.type
	If (This:C1470.defaults#"")
		$text:=$text+" = "+This:C1470.defaults
	End if 
	