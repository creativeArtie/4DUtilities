//! #brief a single line of 4D code splitted into comment and code
Class constructor($text : Text; $file : Text; $line : Integer)
	
	var $count : Real
	This:C1470.code:=utils_assertParameter($1; ->$count; Count parameters:C259)
	This:C1470.doc:=""
	This:C1470.tag:=""
	This:C1470.file:=utils_assertParameter($2; ->$count; Count parameters:C259)
	This:C1470.line:=utils_assertParameter($3; ->$count; Count parameters:C259)
	utils_assertParameterCount($count; Count parameters:C259)
	
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