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
	var $separator : Text
	var $cell : Text
	$headers:="|"
	$separator:="|"
	For each ($cell; This:C1470.headers)
		$headers:=$headers+Replace string:C233($cell; "\n"; "<br />")+"|"
		$separator:=$separator+"--|"
	End for each 
	
	
	var $content : Text
	var $row : Object
	
	$content:=""
	
	For each ($row; This:C1470.row)
		$content:=$content+"|"
		For each ($cell; $row.data)
			$content:=$content+Replace string:C233($cell; "\n"; "<br />")+"|"
		End for each 
		$content:=$content+"|\n"
	End for each 
	
	$0:=$headers+"\n"+$separator+"\n"+$content+"\n"