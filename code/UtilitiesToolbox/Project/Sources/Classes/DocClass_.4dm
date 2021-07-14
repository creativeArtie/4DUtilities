Class extends DocFile_
Class constructor($nameParam : Text; $pathParam : 4D:C1709.File; $commonParam : cs:C1710.DocCommon_)
	Super:C1705()
	This:C1470.functions:=New collection:C1472
	This:C1470.code:=New collection:C1472
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	If (wk_assertObjectParameter($assert; This:C1470; "name"))
		This:C1470.name:=$nameParam
	End if 
	var $path
	If (wk_assertLocalParameter($assert; ->$path))
		$path:=$pathParam
	End if 
	
	var $common
	If (wk_assertLocalParameter($assert; ->$common))
		$common:=$commonParam
	End if 
	
	wk_assertParameterCount($assert)
	
	This:C1470.extends:="Object"
	Super:C1706.setPrivate_()
	
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
					$function.paraseCommonTags($parsed; $common)
				Else 
					This:C1470.paraseCommonTags($parsed; $common)
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
	//! #brief print the class
	
	This:C1470.title:="Class "+This:C1470.name
	
	//! 1. Adds the header
	This:C1470.addHeading("Class <mark>cs."+This:C1470.name+"</mark>"+This:C1470.getTypeBadge(); \
		1; ""; True:C214)
	
	If (This:C1470.brief#"")
		This:C1470.addLine("\n**Brief**: "+This:C1470.brief+"\n")
	End if 
	
	This:C1470.addHeading("Description"; 2)
	
	This:C1470.addLine(This:C1470.root.printGraph(This:C1470.name))
	
	This:C1470.addDescription()
	
	This:C1470.addHeading("Method list"; 2)
	
	var $htmlTable : cs:C1710.DocHtmlTable_
	var $function : cs:C1710.DocFunction_
	
	$htmlTable:=cs:C1710.DocHtmlTable_.new()
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
	