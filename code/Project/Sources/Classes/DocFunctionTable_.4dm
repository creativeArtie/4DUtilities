Class extends DocHtmlTable_
Class constructor
	Super:C1705("table-hover")
	This:C1470.addHeader("Method Name")
	This:C1470.addHeader("Method Brief")
Function addFunction($function : cs:C1710.DocFunction_)
	var $class : Text
	var $name : Text
	Case of 
		: ($function.type="abstract")
			$class:="table-warning"
			$name:="<em>"+$function.name+"</em>"+\
				doc_outputBadge_("bg-warning"; "Needs implementation in subclass"; "abstract")+"\n"
		: ($function.type="private")
			$class:="table-danger"
			$name:="<em>"+$function.name+"</em>"+\
				doc_outputBadge_("bg-danger"; "To be use internally in a namespace"; "private")+"\n"
		Else 
			$class:="table-success"
			$name:=$function.name
	End case 
	var $data : Collection
	$data:=New collection:C1472($name; $function.brief)
	This:C1470.addData($class; $data)
Function getHTMLtable->$doc : Text
	$0:="<h2> Methods </h2>"+Super:C1706.getHTMLtable()