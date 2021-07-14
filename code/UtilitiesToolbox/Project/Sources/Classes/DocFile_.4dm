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
	
	var $brief : Text
	If (This:C1470.brief#"")
		$brief:=This:C1470.brief
	End if 
	If (This:C1470.declare#"")
		If (This:C1470.brief#"")
			$brief:=$brief+"\n"
		End if 
		$brief:=$brief+This:C1470.declare
	End if 
	
	var $text : Text  //! parsed text
	var $template : Text  //! parsing template
	$template:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"template.shtml"; "UTF-8")
	PROCESS 4D TAGS:C816($template; $text; "<!--"+$brief+"-->"; This:C1470.title; This:C1470.text_)
	
	TEXT TO DOCUMENT:C1237(Convert path POSIX to system:C1107($file.path); $text; "ASCII")
	
Function addDescription
	//! #brief add the file discription
	
	This:C1470.addLine(This:C1470.brief+"\n\n")
	
	var $line : Text  //! a single line from `This.comments` loop
	For each ($line; This:C1470.comments)
		This:C1470.addLine($line+"\n")
	End for each 
	
Function addHeading($headerParam : Text; $levelParam : Integer; \
$idParam : Text; $withSummaryParam : Boolean)->$answer : Text
	//! #brief helper function for adding a markdown header
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $header : Text
	If (wk_assertLocalParameter($assert; ->$header))
		$header:=$headerParam
	End if 
	var $level : Integer
	If (wk_assertLocalParameter($assert; ->$level; 1))
		$level:=$levelParam
	End if 
	
	var $id : Text
	If (wk_assertLocalParameter($assert; ->$id; ""))
		$id:=$idParam
	End if 
	var $withSummary : Boolean
	If (wk_assertLocalParameter($assert; ->$withSummary; False:C215))
		$withSummary:=$withSummaryParam
	End if 
	
	wk_assertParameterCount($assert)
	
	
	var $idAttr : Text  //! id attribute which can be linked from the "Method list" section.
	If ($id="")
		$idAttr:=""
	Else 
		$idAttr:=" id='"+$id+"'"
	End if 
	This:C1470.addLine("<h"+String:C10($level)+$idAttr+">"+$header+"</h"+String:C10($level)+">\n\n")
	
	If ($withSummary)
		If (OB Is defined:C1231(This:C1470; "author"))
			This:C1470.addLine("**Author**: *"+This:C1470.author+"*\n")
		End if 
	End if 
	
Function addLine($line : Text)
	//! #brief helper function for adding a markdown paragraph
	This:C1470.text_:=This:C1470.text_+$line
	