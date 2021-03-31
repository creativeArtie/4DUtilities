//! #brief create a mermaid chart
Class constructor
	This:C1470.text_:=""
	
Function addLine($line : Text)
	This:C1470.text_:=This:C1470.text_+$line+"\n"
	
Function getText->$answer : Text
	$answer:="<pre class='mermaid'>\n"+\
		This:C1470.text_+"\n</pre>"
	
	