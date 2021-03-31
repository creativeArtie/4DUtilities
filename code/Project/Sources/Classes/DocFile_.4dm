//! #brief create a file for the 4D Documentation and for browser
Class extends DocSection_
Class constructor
	Super:C1705()
	This:C1470.title:=""
	
Function generateText->$text : Text
	//! #abstract
Function getFile->$file : 4D:C1709.File
	//! #abstract
Function generate
	//! #brief generate the file
	var $file : 4D:C1709.File  //! the generated file
	
	$file:=This:C1470.getFile()
	
	This:C1470.text_:=""
	This:C1470.generateText()
	
	var $text : Text  //! parsed text
	var $template : Text  //! parsing template
	$template:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"template.shtml"; "UTF-8")
	PROCESS 4D TAGS:C816($template; $text; "<!--"+This:C1470.brief+"-->"; This:C1470.title; This:C1470.text_)
	
	TEXT TO DOCUMENT:C1237(Convert path POSIX to system:C1107($file.path); $text; "ASCII")
	
Function addDescription
	//! #brief add the file discription
	
	This:C1470.addLine(This:C1470.brief)
	
	var $line : Text  //! a single line from `This.comments` loop
	For each ($line; This:C1470.comments)
		This:C1470.addLine($line+"\n")
	End for each 
	
Function addHeading($header : Text; $level : Integer; $id : Text; $withSummary : Boolean)->$answer : Text
	//! #brief helper function for adding a markdown header
	
	var $count : Real
	$header:=utils_assertParameter($1; ->$count; Count parameters:C259)
	$level:=utils_assertParameter($2; ->$count; Count parameters:C259; 1)
	$id:=utils_assertParameter($3; ->$count; Count parameters:C259; "")
	$withSummary:=utils_assertParameter($4; ->$count; Count parameters:C259; False:C215)
	utils_assertParameterCount($count; Count parameters:C259)
	
	var $idAttr : Text  //! id attribute which can be linked from the "Method list" section.
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
	//! #brief helper function for adding a markdown paragraph
	This:C1470.text_:=This:C1470.text_+$line+"\n\n"
	