Class constructor($classes : Text)
	This:C1470.classes:=$classes
	This:C1470.headers:=New collection:C1472
	This:C1470.row:=New collection:C1472
	
Function addHeader($header : Text)
	This:C1470.headers.push($header)
	
Function addData($class : Text; $data : Collection)
	This:C1470.row.push(New object:C1471("class"; $class; "data"; $data))
	
Function hasData->$isFilled : Boolean
	$isFilled:=This:C1470.row.length>0
	
Function getHTMLtable->$doc : Text
	var $headers : Text
	var $cell : Text
	$headers:="  <tr>"
	For each ($cell; This:C1470.headers)
		$headers:=$headers+"  <td>"+$cell+"</th>\n"
	End for each 
	$headers:=$headers+"  </tr>"
	
	var $content : Text
	var $row : Object
	
	$content:=""
	
	For each ($row; This:C1470.row)
		$content:=$content+"  <tr>\n"
		For each ($cell; $row.data)
			$content:=$content+"    <td class='"+$row.class+"'>"+$cell+"</td>\n"
		End for each 
		$content:=$content+"  </tr>\n"
	End for each 
	
	$0:="<table class='table "+This:C1470.classes+"'>\n"+\
		"  <thead>\n"+$headers+"</thead>\n"+\
		"  <tbody>\n"+$content+"</tbody>\n"+\
		"</table>"