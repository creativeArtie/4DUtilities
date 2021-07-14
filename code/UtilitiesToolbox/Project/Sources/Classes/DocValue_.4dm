Class constructor($lineParam : cs:C1710.DocLine_; $valueParam : Text; $typeParam : Text)
	
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $line : cs:C1710.DocLine_
	If (wk_assertLocalParameter($assert; ->$line))
		$line:=$lineParam
	End if 
	This:C1470.file:=$line.file
	This:C1470.line:=$line.line
	
	var $value : Text
	If (wk_assertLocalParameter($assert; ->$value))
		$value:=$valueParam
	End if 
	var $type : Text
	If (wk_assertLocalParameter($assert; ->$type; ""))
		$type:=$typeParam
	End if 
	
	wk_assertParameterCount($assert)
	
	
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
		$text:=$text+" := "+This:C1470.defaults
	End if 
	
Function getDescription()->$text : Text
	If (This:C1470.brief#"")
		$text:=This:C1470.brief+"<br />"
	End if 
	$text:=$text+"<em>Declared on line "+String:C10(This:C1470.line)+".</em>"
	