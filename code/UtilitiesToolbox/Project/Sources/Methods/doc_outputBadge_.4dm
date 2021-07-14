//%attributes = {"shared":true}
//! #brief creates a bootstrap badge
//! #author Wai-Kin Chau
#DECLARE($typeParam : Text; $titleParam : Text; $textParam : Text)->$ans : Text


var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $type : Text
If (wk_assertLocalParameter($assert; ->$type))
	$type:=$typeParam
End if 

var $title : Text
If (wk_assertLocalParameter($assert; ->$title))
	$title:=$titleParam
End if 

var $text
If (wk_assertLocalParameter($assert; ->$text))
	$text:=$textParam
End if 


wk_assertParameterCount($assert)



$0:=" <span class='badge "+$type+"' data-bs-toggle='tooltip' "+\
"title='"+$title+"' >"+$text+"</span>"