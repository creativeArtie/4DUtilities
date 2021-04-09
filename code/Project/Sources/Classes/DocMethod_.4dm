Class extends DocFile_
Class constructor($name : Text; $path : cs:C1710.File; $common : cs:C1710.DocCommon_)
	Super:C1705()
	This:C1470.code:=New collection:C1472
	var $count : Real
	This:C1470.name:=utils_assertParameter($1; ->$count; Count parameters:C259)
	$path:=utils_assertParameter($2; ->$count; Count parameters:C259)
	$common:=utils_assertParameter($3; ->$count; Count parameters:C259)
	utils_assertParameterCount($count; Count parameters:C259)
	This:C1470.params:=New collection:C1472
	This:C1470.title:="Method"+$path.name
	Super:C1706.setPrivate_()
	
	var $parsed : cs:C1710.DocLine_
	
	For each ($parsed; doc_splitLines($path))
		Case of 
			Else 
				This:C1470.paraseCommonTags($parsed; $common)
		End case 
	End for each 
	
Function getFile->$file : 4D:C1709.File
	var $path : Text
	$path:=Convert path system to POSIX:C1106(Get 4D folder:C485(Database folder:K5:14)+"Documentation/Methods")
	$path:=$path+"/"+This:C1470.name+".md"
	$file:=File:C1566($path; fk posix path:K87:1)
	$file.create()
	
Function generateText
	This:C1470.declare:=This:C1470.name
	This:C1470.title:="Method "+This:C1470.name
	
	This:C1470.addHeading("Method <mark>"+This:C1470.name+"</mark>"+This:C1470.getTypeBadge(); \
		1; ""; True:C214)
	
	var $table : cs:C1710.DocHtmlTable_
	$table:=cs:C1710.DocHtmlTable_.new()
	$table.addHeader("Name")
	$table.addHeader("Type")
	$table.addHeader("Brief")
	
	var $param : cs:C1710.DocParam_
	var $i : Integer
	$i:=1
	var $params : Text
	For each ($param; This:C1470.params)
		$table.addData($param.name+" (parameter "+String:C10($i)+")"; $param.type; \
			$param.getDescription())
		If ($params="")
			$params:="("
		Else 
			$params:=$params+";"
		End if 
		$params:=$params+$param.getDeclare()
		$i:=$i+1
		
	End for each 
	
	If ($params#"")
		This:C1470.declare:=This:C1470.declare+$params+")"
	End if 
	
	If (OB Is defined:C1231(This:C1470; "return"))
		$table.addData(This:C1470.return.name+" (return value)"; This:C1470.return.type; \
			This:C1470.return.getDescription())
		This:C1470.declare:=This:C1470.declare+"->"+This:C1470.return.getDeclare()
	End if 
	
	var $value : cs:C1710.DocValue_
	For each ($value; This:C1470.local)
		$table.addData($value.name; $value.type; $value.getDescription())
	End for each 
	
	If ($table.hasData())
		This:C1470.addLine($table.getHTMLtable())
	End if 
	
	This:C1470.addHeading("Description"; 2)
	This:C1470.addLine(This:C1470.brief)
	
	var $line : Text
	For each ($line; This:C1470.comments)
		This:C1470.addLine($line+"\n")
	End for each 
	
	