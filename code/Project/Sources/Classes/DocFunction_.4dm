//! #brief a function of a class
Class extends DocSection_
Class constructor($parsed : cs:C1710.DocLine_)
	Super:C1705()
	This:C1470.name:=""
	This:C1470.params:=New collection:C1472
	
	If (doc_buildValue_($parsed; This:C1470))
	End if 
	
	If ($parsed.code="Function @")
		This:C1470.name:=Split string:C1554($parsed.code; " ")[1]
		This:C1470.name:=Split string:C1554(This:C1470.name; "(")[0]
		This:C1470.name:=Split string:C1554(This:C1470.name; "->")[0]
	Else 
		This:C1470.name:="Class constructor"
		This:C1470.type:="constructor"
	End if 
	
	Super:C1706.setPrivate_()
	
Function getParams->$answer : Text
	$answer:=""
	var $param : cs:C1710.DocParam_
	For each ($param; This:C1470.params)
		If ($answer#"")
			$answer:=$answer+"; "
		End if 
		$answer:=$answer+$param.getDeclare()
	End for each 
	
Function getReturn->$answer : Text
	If (OB Is defined:C1231(This:C1470; "return"))
		$answer:=" -> "+This:C1470.return.getDeclare()
	End if 
	
Function addDetail($class : cs:C1710.DocClass_)
	Case of 
		: (This:C1470.type="constructor")
			$class.addHeading("<strong>Class Constructor</strong>"; 3; "class-constructor")
		Else 
			var $id : Text
			$id:=Replace string:C233(This:C1470.name; " "; "-")
			$class.addHeading(This:C1470.name+This:C1470.getTypeBadge(); 3; $id)
	End case 
	
	var $table : cs:C1710.DocHtmlTable_
	$table:=cs:C1710.DocHtmlTable_.new()
	$table.addHeader("Name")
	$table.addHeader("Type")
	$table.addHeader("Brief")
	
	var $param : cs:C1710.DocParam_
	var $i : Integer
	$i:=1
	For each ($param; This:C1470.params)
		$table.addData($param.getDeclare()+" (parameter "+String:C10($i)+")"; \
			$param.type; $param.getDescription()\
			)
		$i:=$i+1
		
	End for each 
	If (OB Is defined:C1231(This:C1470; "return"))
		$table.addData(This:C1470.return.getDeclare()+" (return value)"; This:C1470.return.type; \
			This:C1470.return.getDescription())
	End if 
	
	var $value : cs:C1710.DocValue_
	For each ($value; This:C1470.local)
		$table.addData($value.getDeclare(); $value.type; $value.getDescription())
	End for each 
	
	If ($table.hasData())
		$class.addLine($table.getHTMLtable())
	End if 
	
	$class.addLine(This:C1470.brief)
	
	var $line : Text
	For each ($line; This:C1470.comments)
		$class.addLine($line+"\n")
	End for each 
	
Function addSummaryRow($table : cs:C1710.DocFunctionTable_)
	var $rowCss : Text
	var $name : Text
	$name:=This:C1470.name
	var $id : Text
	$id:=Replace string:C233(This:C1470.name; " "; "-")
	Case of 
		: (This:C1470.type="constructor")
			$rowCss:="table-success"
			$name:="<a href='#class-constructor'><strong>"+$name+"("+This:C1470.getParams()+")"+\
				This:C1470.getReturn()+"<strong>"+This:C1470.getTypeBadge()+"</a>"
			
		: (This:C1470.type="abstract")
			$rowCss:="table-warning"
			$name:="<a href='#"+$id+"'><em>"+$name+"("+This:C1470.getParams()+")"+\
				This:C1470.getReturn()+"</em>"+This:C1470.getTypeBadge()+"</a>"
			
		: (This:C1470.type="private")
			$rowCss:="table-danger"
			$name:="<a href='#"+$id+"'><em>"+$name+"("+This:C1470.getParams()+")"+\
				This:C1470.getReturn()+"</em>"+This:C1470.getTypeBadge()+"</a>"
		Else 
			$rowCss:="table-success"
			$name:="<a href='#"+$id+"'>"+$name+"("+This:C1470.getParams()+")"+\
				This:C1470.getReturn()+This:C1470.getTypeBadge()+"</a>"
	End case 
	$table.addData($name; This:C1470.brief)