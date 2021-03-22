/// #brief create a file for the 4D Documentation and for browser
Class extends DocSection_
Class constructor
	Super:C1705()
	This:C1470.title:=""
	
Function generateText->$text : Text
	/// #abstract
Function getFile->$file : 4D:C1709.File
	/// #abstract
Function generate
	/// #brief generate the file 
	var $file : 4D:C1709.File  /// the generated file
	
	$file:=This:C1470.getFile()
	
	This:C1470.text_:=""
	This:C1470.generateText()
	
	var $text : Text  /// the template HTML, hard coded
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
		"    crossorigin='anonymous'\n"+\
		"  >\n"+\
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
	
Function addDescription($useHeading : Boolean)
	/// #brief add the file discription
	$useHeading:=utils_getOptionValue($1; True:C214)
	
	If ($useHeading)
		This:C1470.addHeading("Description"; 2)
	End if 
	
	This:C1470.addLine(This:C1470.brief)
	
	var $line : Text  /// a single line from `This.comments` loop
	For each ($line; This:C1470.comments)
		This:C1470.addLine($line+"\n")
	End for each 
	
Function addHeading($header : Text; $level : Integer; $id : Text; $withSummary : Boolean)->$answer : Text
	/// #brief helper function for adding a markdown header
	$header:=utils_getRequireValue($1)
	$level:=utils_getOptionValue($2; 1)
	$id:=utils_getOptionValue($3; "")
	$withSummary:=utils_getOptionValue($4; False:C215)
	
	var $idAttr : Text  /// id attribute which can be linked from the "Method list" section.
	If ($id="")
		$idAttr:=""
	Else 
		$idAttr:=" id='"+$id+"'"
	End if 
	This:C1470.addLine("<h"+String:C10($level)+$idAttr+">"+$header+"</h"+String:C10($level)+">")
	
	If ($withSummary)
		If (OB Is defined:C1231(This:C1470; "author"))
			This:C1470.addLine("**Author**: *"+This:C1470.author+"*")
		End if 
	End if 
	
Function addLine($line : Text)
	/// #brief helper function for adding a markdown paragraph
	This:C1470.text_:=This:C1470.text_+$line+"\n\n"
	