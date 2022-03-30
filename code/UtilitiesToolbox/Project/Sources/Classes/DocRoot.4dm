Class constructor($classesParam : Collection; $methodsParam : Collection; $formsParam : Collection)
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $classes : Object
	If (wk_assertLocalParameter($assert; ->$classesParam))
		$classes:=$classesParam
	End if 
	
	var $names : Object
	$names:=New object:C1471
	If (wk_assertObjectParameter($assert; $names; "methods"))
		$names.methods:=$methodsParam
	End if 
	
	If (wk_assertObjectParameter($assert; $names; "forms"))
		$names.forms:=$formsParam
	End if 
	
	wk_assertParameterCount($assert)
	
	var $className : Text
	$names.classes:=New object:C1471
	For each ($className; $classes)
		$names["classes"][$className]:=$classes[$className].functions
	End for each 
	
	This:C1470.names:=$names
	This:C1470.extends:=New object:C1471
	This:C1470.classes:=New collection:C1472
	
Function loadClasses($rawClasses : Object; $slowDown : Integer)
	var $progress : Integer
	var $progressIdx; $progressTotal : Real
	$progressTotal:=OB Keys:C1719($rawClasses).length
	$progressIdx:=0
	$progress:=Progress New
	Progress SET TITLE($progress; "Parsing Classes")
	
	var $name : Text
	For each ($name; $rawClasses)
		Progress SET PROGRESS($progress; $progressIdx/$progressTotal; "Parsing "+$name)
		DELAY PROCESS:C323(Current process:C322; $slowDown)
		$progressIdx:=$progressIdx+1
		This:C1470.classes.push(cs:C1710.DocClass.new($name; $rawClasses[$name]; This:C1470))
	End for each 
	Progress QUIT($progress)
	
Function loadMethods($rawClasses : Object; $slowDown : Integer)
	ASSERT:C1129(Count parameters:C259=2)
	var $progress : Integer
	var $progressIdx; $progressTotal : Real
	$progressTotal:=OB Keys:C1719($rawClasses).length
	$progressIdx:=0
	$progress:=Progress New
	Progress SET TITLE($progress; "Parsing Methods")
	var $name : Text
	For each ($name; $rawClasses)
		Progress SET PROGRESS($progress; $progressIdx/$progressTotal; "Parsing "+$name)
		DELAY PROCESS:C323(Current process:C322; $slowDown)
		$progressIdx:=$progressIdx+1
		This:C1470.classes.push(cs:C1710.DocNamedMethod.new($name; $rawClasses[$name]; This:C1470))
	End for each 
	Progress QUIT($progress)