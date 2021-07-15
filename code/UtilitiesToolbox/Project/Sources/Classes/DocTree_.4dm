Class constructor($nameParam : Text)
	This:C1470.children:=New object:C1471
	var $count : Real
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	
	If (wk_assertObjectParameter($assert; This:C1470; "name"; "Object"))
		This:C1470.name:=$nameParam
	End if 
	
	wk_assertParameterCount($assert)
	
	
Function addClass($classParam : cs:C1710.DocClass_; $rootParam : cs:C1710.DocTree_)->$filled : Boolean
	
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $class : cs:C1710.DocClass_
	If (wk_assertLocalParameter($assert; ->$class))
		$class:=$classParam
	End if 
	var $root; $current : cs:C1710.DocTree_
	$current:=cs:C1710.DocTree_.new($class.name)
	If (wk_assertLocalParameter($assert; ->$root; $current))
		$root:=$rootParam
	End if 
	
	wk_assertParameterCount($assert)
	
	
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
	
Function printGraph($currentParam : Text; $inputParam : cs:C1710.DocMermaid_)->$graph : Text
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $current : Text
	If (wk_assertLocalParameter($assert; ->$current))
		$current:=$currentParam
	End if 
	
	var $input : cs:C1710.DocMermaid_
	If (wk_assertLocalParameter($assert; ->$input; cs:C1710.DocMermaid_.new()))
		$input:=$inputParam
	End if 
	
	wk_assertParameterCount($assert)
	
	
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
	
	