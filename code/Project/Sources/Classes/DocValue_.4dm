Class constructor($line : cs:C1710.DocLine_; $value : Text; $type : Text)
	
	var $count : Real
	This:C1470.file:=utils_assertParameter($line; ->$count; Count parameters:C259).file
	$value:=utils_assertParameter($value; ->$count; Count parameters:C259)
	$type:=utils_assertParameter($type; ->$count; Count parameters:C259; "")
	utils_assertParameterCount($count; Count parameters:C259)
	This:C1470.line:=$line.line
	
	Case of 
		: (Count parameters:C259=2)
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
			
		: (Count parameters:C259=3)
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
	
Function getDescription()->$text : Text
	If (This:C1470.brief#"")
		$text:=This:C1470.brief+"<br />"
	End if 
	$text:=$text+"<em>Declared on line "+String:C10(This:C1470.line)+".</em>"
	