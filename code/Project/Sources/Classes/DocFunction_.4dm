Class extends DocSection_
Class constructor($line : Text)
	Super:C1705()
	This:C1470.name:=""
	This:C1470.return:=New object:C1471
	var $raw : Text
	If ($line="Function @")
		$raw:=Substring:C12($line; Length:C16("Function ")+1)
		This:C1470.name:=$raw
	Else 
		$raw:=Substring:C12($line; Length:C16("Class constructor")+1)
		This:C1470.type:="constructor"
	End if 
	
	var $locate : Integer
	$locate:=Position:C15("("; $raw)
	If ($locate>0)
		This:C1470.name:=Substring:C12($raw; 0; $locate-1)
	End if 
	$locate:=Position:C15("->"; $raw)
	If ($locate>0)
		This:C1470.name:=Substring:C12($raw; 0; $locate-1)
	End if 
	
	If (This:C1470.name="")
		This:C1470.name:="Class constructor"
	End if 
	
	Super:C1706.setPrivate_()
	
Function generateText->$text : Text
	Case of 
		: (This:C1470.type="constructor")
			This:C1470.addHeading("**Class Constructor**"; 2)
	End case 
	
Function addSummaryRow($table : cs:C1710.DocFunctionTable_)
	var $rowCss : Text
	var $name : Text
	$name:=This:C1470.name
	Case of 
		: (This:C1470.type="constructor")
			$rowCss:="table-success"
			$name:="<strong>"+$name+"<strong>"+\
				doc_outputBadge_("bg-primary"; "Class Constructor"; "constructor")+"\n"
			
		: (This:C1470.type="abstract")
			$rowCss:="table-warning"
			$name:="<em>"+$name+"</em>"+\
				doc_outputBadge_("bg-warning"; "Needs implementation in subclass"; "abstract")+"\n"
			
		: (This:C1470.type="private")
			$rowCss:="table-danger"
			$name:="<em>"+$name+"</em>"+\
				doc_outputBadge_("bg-danger"; "To be use internally in a namespace"; "private")+"\n"
		Else 
			$rowCss:="table-success"
			$name:=$name
	End case 
	$table.addData($rowCss; New collection:C1472($name; This:C1470.brief))