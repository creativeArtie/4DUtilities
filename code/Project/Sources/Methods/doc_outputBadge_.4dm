//%attributes = {}
#DECLARE($type : Text; $title : Text; $text : Text)->$ans : Text
$0:=" <span class='badge "+$type+"' data-bs-toggle='tooltip' "+\
"title='"+$title+"' >"+$text+"</span>"