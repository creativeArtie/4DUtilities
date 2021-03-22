/// #brief a single line of 4D code splitted into comment and code
Class constructor($text : Text; $file : Text; $line : Integer)
	
	This:C1470.code:=utils_getRequireValue($1; Is text:K8:3)
	This:C1470.doc:=""
	This:C1470.tag:=""
	This:C1470.file:=$file
	This:C1470.line:=$line
	
	var $doc : Text
	$doc:="///"  // The line `$doc:="///"` is sadly adding into 4D Docs...
	If ($text=("@"+$doc+"@"))
		This:C1470.doc:=Substring:C12($text; Position:C15($doc; $text)+Length:C16($doc))
		This:C1470.code:=Substring:C12($text; 0; Position:C15($doc; $text)-1)
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
	If (This:C1470.doc#"")
		This:C1470.doc:=This:C1470.doc+"\n"
	End if 
	This:C1470.doc:=This:C1470.doc+$doc