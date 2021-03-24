Class constructor($name : Text)
	This:C1470.children:=New object:C1471
	This:C1470.name:=utils_getOptionValue($name; "Object")
	
Function addClass($class : cs:C1710.DocClass_; $root : cs:C1710.DocTree_)->$filled : Boolean
	var $current : cs:C1710.DocTree_
	$current:=cs:C1710.DocTree_.new($class.name)
	$root:=utils_getOptionValue($root; $current)
	C_BOOLEAN:C305($filled)
	$filled:=False:C215
	If ($class.extends=This:C1470.name)
		OB SET:C1220(This:C1470.children; $class.name; $current)
		$class.root:=$root
		$filled:=True:C214
	End if 
	
	var $child : Text
	For each ($child; This:C1470.children) While (Not:C34($filled))
		If (Count parameters:C259=1)
			$filled:=This:C1470.children[$child].addClass($class; This:C1470.children[$child])
		Else 
			$filled:=This:C1470.children[$child].addClass($class; $root)
		End if 
	End for each 
	
Function printGraph($current : Text; $input : cs:C1710.DocMermaid_)->$graph : Text
	$current:=utils_getRequireValue($1)
	$input:=utils_getOptionValue($2; cs:C1710.DocMermaid_.new())
	
	var $name : Text
	$name:="class"+This:C1470.name
	
	If (Count parameters:C259=1)
		$input.addLine("graph TB")
	End if 
	var $spaces : Text
	$spaces:="    "
	If (This:C1470.name=$current)
		$input.addLine($spaces+"class"+This:C1470.name+"([Current Class: cs."+This:C1470.name+"])")
	Else 
		$input.addLine($spaces+"class"+This:C1470.name+"[cs."+This:C1470.name+"]")
	End if 
	
	var $name : Text
	var $child : cs:C1710.DocTree_
	For each ($name; This:C1470.children)
		$child:=This:C1470.children[$name]
		$input.addLine($spaces+"class"+This:C1470.name+" --> class"+$child.name)
		var $temp : Text
		$temp:=$child.printGraph($current; $input)
	End for each 
	$graph:=$input.getText()
	
	