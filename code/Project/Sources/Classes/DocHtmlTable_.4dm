Class constructor
	
	This:C1470.headers:=New collection:C1472
	This:C1470.row:=New collection:C1472
	
Function addHeader($header : Text)
	This:C1470.headers.push($header)
	
Function addData
	var ${1} : Variant
	var $row : Collection
	$row:=New collection:C1472
	var $i : Integer
	For ($i; 1; Count parameters:C259)
		$row.push(${$i})
	End for 
	This:C1470.row.push($row)
	
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
	var $row : Collection
	
	$content:=""
	
	For each ($row; This:C1470.row)
		$content:=$content+"|"
		For each ($cell; $row)
			$content:=$content+Replace string:C233($cell; "\n"; "<br />")+"|"
		End for each 
		$content:=$content+"|\n"
	End for each 
	
	$0:="\n"+$headers+"\n"+$separator+"\n"+$content+"\n"