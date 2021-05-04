//%attributes = {}
//! #brief creates a bootstrap badge
//! #author Wai-Kin Chau
#DECLARE($type : Text; $title : Text; $text : Text)->$ans : Text

var $count : Real
$type:=utils_assertParameter($1; ->$count; Count parameters:C259; "")
$title:=utils_assertParameter($2; ->$count; Count parameters:C259; "")
$text:=utils_assertParameter($3; ->$count; Count parameters:C259; "")
utils_assertParameterCount($count; Count parameters:C259)


$0:=" <span class='badge "+$type+"' data-bs-toggle='tooltip' "+\
"title='"+$title+"' >"+$text+"</span>"