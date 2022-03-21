Class constructor($class : Collection; $methods : Collection; $forms : Collection)
	This:C1470.names:=New object:C1471("classes"; $class; "methods"; $methods; "forms"; $forms)
	This:C1470.extends:=New object:C1471
	This:C1470.classes:=New collection:C1472
	
Function loadClasses($rawClasses : Object; $names : Collection; $slowDown : Integer)
	ASSERT:C1129(Count parameters:C259=3)
	var $progress : Integer
	var $progressIdx; $progressTotal : Real
	$progressTotal:=OB Keys:C1719($rawClasses).length
	$progressIdx:=0
	$progress:=Progress New
	var $name : Text
	For each ($name; $rawClasses)
		Progress SET PROGRESS($progress; $progressIdx/$progressTotal; "Parsing "+$name)
		DELAY PROCESS:C323(Current process:C322; $slowDown)
		$progressIdx:=$progressIdx+1
		This:C1470.classes.push(cs:C1710.DocClass.new($name; $rawClasses[$name]; This:C1470))
	End for each 
	Progress QUIT($progress)
Function loadMethods($rawClasses : Object; $names : Collection; $slowDown : Integer)
	ASSERT:C1129(Count parameters:C259=3)
	var $progress : Integer
	var $progressIdx; $progressTotal : Real
	$progressTotal:=OB Keys:C1719($rawClasses).length
	$progressIdx:=0
	$progress:=Progress New
	var $name : Text
	For each ($name; $rawClasses)
		Progress SET PROGRESS($progress; $progressIdx/$progressTotal; "Parsing "+$name)
		DELAY PROCESS:C323(Current process:C322; $slowDown)
		$progressIdx:=$progressIdx+1
		This:C1470.classes.push(cs:C1710.DocNamedMethod.new($name; $rawClasses[$name]; This:C1470))
	End for each 
	Progress QUIT($progress)