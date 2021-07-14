//! #brief a single line of 4D code splitted into comment and code
Class constructor($textParam : Text; $fileParam : Text; $lineParam : Integer)
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $text : Text
	If (wk_assertLocalParameter($assert; ->$text))
		$text:=$textParam
	End if 
	This:C1470.code:=$text
	This:C1470.doc:=""
	This:C1470.tag:=""
	If (wk_assertObjectParameter($assert; This:C1470; "file"))
		This:C1470.file:=$fileParam
	End if 
	If (wk_assertObjectParameter($assert; This:C1470; "line"))
		This:C1470.line:=$lineParam
	End if 
	
	wk_assertParameterCount($assert)
	
	var $doc : Text
	$doc:="//!"  // The line `$doc:="//!"` is sadly adding into 4D Docs...
	If ($text=("@"+$doc+"@"))
		var $splitted : Collection
		$splitted:=Split string:C1554($text; $doc)
		This:C1470.code:=$splitted[0]
		This:C1470.doc:=$splitted[1]
		This:C1470.hasDoc:=True:C214
	Else 
		This:C1470.hasDoc:=False:C215
	End if 
	If (This:C1470.code#"")
		This:C1470.code:=Split string:C1554(This:C1470.code; "//")[0]
	End if 
	
	If (This:C1470.doc="@#@")
		var $tagged : Text
		$tagged:=Substring:C12(This:C1470.doc; Position:C15("#"; This:C1470.doc)+1)
		If (Position:C15(" "; $tagged)>0)
			This:C1470.tag:=Substring:C12($tagged; 0; Position:C15(" "; $tagged)-1)
			This:C1470.doc:=Substring:C12($tagged; Position:C15(" "; $tagged)+1)
		Else 
			This:C1470.tag:=$tagged
			This:C1470.doc:=""
		End if 
	End if 
Function addDoc($doc : Text)
	//If (This.doc#"")
	//This.doc:=This.doc+"\n"
	//End if 
	This:C1470.doc:=This:C1470.doc+$doc