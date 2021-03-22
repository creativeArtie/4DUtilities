Class extends DocFile_
Class constructor($name : Text; $path : cs:C1710.File)
	Super:C1705()
	This:C1470.functions:=New collection:C1472
	This:C1470.code:=New collection:C1472
	This:C1470.name:=utils_getRequireValue($1)
	This:C1470.extends:="Object"
	Super:C1706.setPrivate_()
	
	var $details : cs:C1710.DocClass_
	var $comments : Collection
	$comments:=New collection:C1472
	
	var $parsed : cs:C1710.DocLine_
	var $function : cs:C1710.DocFunction_
	For each ($parsed; doc_splitLines($path))
		
		Case of 
			: ($parsed.code="Class extends @")
				This:C1470.extends:=Split string:C1554($parsed.code; " ")[2]
				
			: ($parsed.code="Class constructor@")
				If ($function#Null:C1517)
					This:C1470.functions.push($function)
				End if 
				$function:=cs:C1710.DocFunction_.new($parsed)
				
			: ($parsed.code="Function @")
				If ($function#Null:C1517)
					This:C1470.functions.push($function)
				End if 
				$function:=cs:C1710.DocFunction_.new($parsed)
				
			: (($parsed.tag="abstract") & ($function#Null:C1517))
				$function.type:="abstract"
				
			Else 
				If ($function#Null:C1517)
					$function.paraseCommonTags($parsed)
				Else 
					This:C1470.paraseCommonTags($parsed)
				End if 
		End case 
	End for each 
	
	If ($function#Null:C1517)
		This:C1470.functions.push($function)
	End if 
	
	
Function getFile->$file : 4D:C1709.File
	var $path : Text
	$path:=Convert path system to POSIX:C1106(Get 4D folder:C485(Database folder:K5:14))+"Documentation/Classes"
	$path:=$path+"/"+This:C1470.name+".md"
	
	$file:=File:C1566($path; fk posix path:K87:1)
	$file.create()
	
Function generateText
	/// #brief print the class
	var $text : Text
	var $classDoc : Text
	var $commentLine : Text
	
	This:C1470.title:="Class "+This:C1470.name
	
	/// 1. Adds the header
	This:C1470.addHeading("Class <mark>cs."+This:C1470.name+"</mark>"+This:C1470.getTypeBadge(); \
		1; ""; True:C214)
	This:C1470.addDescription(True:C214)
	
	This:C1470.addHeading("Method list"; 2)
	
	var $htmlTable : cs:C1710.DocHtmlTable_
	var $function : cs:C1710.DocFunction_
	
	$htmlTable:=cs:C1710.DocHtmlTable_.new("table-hover")
	$htmlTable.addHeader("Method Name")
	$htmlTable.addHeader("Method Brief")
	
	For each ($function; This:C1470.functions)
		$function.addSummaryRow($htmlTable)
	End for each 
	This:C1470.addLine($htmlTable.getHTMLtable())
	
	This:C1470.addHeading("Methods"; 2)
	
	For each ($function; This:C1470.functions)
		$function.text_:=""
		$function.addDetail(This:C1470)
	End for each 
	