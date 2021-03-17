Class constructor
	This:C1470.brief:=""
	This:C1470.comments:=New collection:C1472
	This:C1470.params:=New collection:C1472
	This:C1470.type:=""
	This:C1470.text_:=""
	This:C1470.title:=""
	
Function setPrivate_
	/// #brief check if the name ends with "_" meaning private
	If (This:C1470.name="@_")
		This:C1470.type:="private"
	End if 
	
Function generateText->$text : Text
	
Function getFile->$file : 4D:C1709.File
	
Function generate
	
	var $file : 4D:C1709.File
	
	$file:=This:C1470.getFile()
	
	This:C1470.text_:=""
	This:C1470.generateText()
	
	var $text : Text
	$text:="<!DOCTYPE html>\n"+\
		"<!--"+(This:C1470.brief)+"-->\n"+\
		"<html>\n"+\
		"<header>\n"+\
		"  <script src='https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js'></script>\n"+\
		"  <script src='https://cdn.jsdelivr.net/npm/marked/marked.min.js'></script>\n"+\
		"  <script>mermaid.initialize({startOnLoad:true});</script>\n"+\
		"  <link \n"+\
		"    href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css'\n"+\
		"    rel='stylesheet'\n"+\
		"    integrity='sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl'\n"+\
		"    crossorigin='anonymous'>\n"+\
		"  <script \n"+\
		"    src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js'\n"+\
		"    integrity='sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0'\n"+\
		"    crossorigin='anonymous'\n"+\
		"  ></script>\n"+\
		"  <title>"+(This:C1470.title)+"</title>\n"+\
		"  <meta charset='ASCII' />\n"+\
		"  <meta name='generator' value='4D Documentation' />\n"+\
		"</header>\n"+\
		"<body>\n"+\
		"<div id='content' class='container'>\n\n"+(This:C1470.text_)+"</div>\n"+\
		"    <script>\n"+\
		"      document.getElementById('content').innerHTML =\n"+\
		"      marked(document.getElementById('content').innerHTML);\n"+\
		"</script>\n"+\
		"</body>\n"
	
	TEXT TO DOCUMENT:C1237(Convert path POSIX to system:C1107($file.path); $text; "ASCII")
	
Function addHeading($header : Text; $level : Integer; $withSummary : Boolean)->$answer : Text
	$header:=utils_getRequireValue($header)
	$level:=utils_getOptionValue($level; 1)
	
	var $i : Integer
	var $prefix : Text
	For ($i; 1; $level)
		$prefix:=$prefix+"#"
	End for 
	This:C1470.addLine($prefix+" "+$header)
	
	If ($withSummary)
		If (OB Is defined:C1231(This:C1470; "author"))
			This:C1470.addLine("**Author**: *"+This:C1470.author+"*")
		End if 
	End if 
	
Function addDescription($useHeading : Boolean)
	$useHeading:=utils_getOptionValue($1; True:C214)
	
	If ($useHeading)
		This:C1470.addHeading("Description"; 2; False:C215)
	End if 
	
	This:C1470.addLine(This:C1470.brief)
	
	var $line : Text
	For each ($line; This:C1470.comments)
		This:C1470.addLine($line+"\n")
	End for each 
	
Function addLine($line : Text)
	This:C1470.text_:=This:C1470.text_+$line+"\n\n"
	
Function paraseCommonTags($comment : cs:C1710.Comment_)
	Case of 
		: ($comment.tag="brief")
			This:C1470.brief:=$comment.doc
			
		: ($comment.tag="author")
			This:C1470.author:=$comment.doc
			
		: ($comment.tag="param")
			var $name : Text
			var $brief : Text
			If (Match regex:C1019(".* .*"; $comment.doc))
				var $pos : Integer
				$pos:=Position:C15(" "; $comment.doc)
				$name:=Substring:C12($comment.doc; 0; $pos-1)
				$brief:=Substring:C12($comment.doc; $pos+1)
			Else 
				$name:=$comment.doc
			End if 
			This:C1470.params.push(cs:C1710.DocParam_.new($name; $brief))
		Else 
			This:C1470.comments.push($comment.doc)
	End case 
	