Class extends DocFile_
Class constructor
	Super:C1705()
	This:C1470.title:="General"
	This:C1470.todo:=New collection:C1472
	
Function addCode($line : cs:C1710.DocLine_; $section : cs:C1710.DocSection_)
	Case of 
		: ($line.tag="todo")
			This:C1470.todo.push($line)
			$section.comments.push("<div class='alert alert-warning'>\n"+\
				"<h4 class='alert-heading'>TODO</h4>\n\n"+\
				$line.doc+"\n</div>")
		: ($line.hasDoc)
			$section.comments.push($line.doc)
	End case 
	
Function generateText->$text : Text
	
	This:C1470.text_:="# todo\n"
	var $table : cs:C1710.DocHtmlTable_
	
	$table:=cs:C1710.DocHtmlTable_.new("")
	$table.addHeader("file")
	$table.addHeader("line")
	$table.addHeader("details")
	var $line : cs:C1710.DocLine_
	For each ($line; This:C1470.todo)
		$table.addData(""; New collection:C1472($line.file; String:C10($line.line); $line.doc))
	End for each 
	This:C1470.addLine($table.getHTMLtable())
	
Function getFile->$file : 4D:C1709.File
	var $path : Text
	$path:=Convert path system to POSIX:C1106(Get 4D folder:C485(Database folder:K5:14))+"Documentation/"
	$path:=$path+"general.md"
	
	$file:=File:C1566($path; fk posix path:K87:1)
	$file.create()