Class extends DocSection_
Class constructor($line : Text)
	Super:C1705()
	This:C1470.name:=""
	This:C1470.params:=New collection:C1472
	
	var $paramSplit : Collection
	$paramSplit:=Split string:C1554($line; "(")
	
	var $returnSplit : Collection
	$returnSplit:=Split string:C1554($line; "->")
	
	var $named : Text
	
	If ($paramSplit.length>1)
		$named:=$paramSplit[0]
		var $rawParams : Text
		$rawParams:=Split string:C1554($paramSplit[1]; ")")[0]
		
		var $params : Collection
		$params:=Split string:C1554($rawParams; ";")
		
		var $param : Text
		For each ($param; $params)
			This:C1470.params.push(cs:C1710.DocParam_.new($param))
		End for each 
	End if 
	
	If ($returnSplit.length>1)
		If ($named="")
			$named:=$returnSplit[0]
		End if 
		
		var $return : Text
		This:C1470.return:=cs:C1710.DocReturn_.new($returnSplit[1])
	End if 
	
	If ($named="")
		$named:=$paramSplit[0]
	End if 
	
	If ($named="Function @")
		This:C1470.name:=Split string:C1554($named; " ")[1]
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
	$table:=cs:C1710.DocHtmlTable_.new("")
	$table.addHeader("Name")
	$table.addHeader("Type")
	$table.addHeader("Brief")
	
	var $param : cs:C1710.DocParam_
	var $i : Integer
	$i:=1
	For each ($param; This:C1470.params)
		$table.addData("table-primary"; \
			New collection:C1472($param.name+" (parameter "+String:C10($i)+")"; $param.type; $param.brief)\
			)
		$i:=$i+1
		
	End for each 
	If (OB Is defined:C1231(This:C1470; "return"))
		$table.addData("table-secondary"; \
			New collection:C1472(This:C1470.return.name+" (return value)"; This:C1470.return.type; \
			This:C1470.return.brief)\
			)
	End if 
	
	var $value : cs:C1710.DocValue_
	For each ($value; This:C1470.local)
		$table.addData("table-info"; \
			New collection:C1472($value.name; $value.type; $value.brief)\
			)
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
	$table.addData($rowCss; New collection:C1472($name; This:C1470.brief))