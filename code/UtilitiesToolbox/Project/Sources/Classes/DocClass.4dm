Class extends DocBase
Class constructor($name : Text; $file : cs:C1710.RawFile; $base : cs:C1710.DocRoot)
	Super:C1705()
	This:C1470.name:=$name
	This:C1470.parent:=""
	This:C1470.constructor:=Null:C1517
	This:C1470.methods:=New collection:C1472
	var $line : Object
	var $parsing; $current : cs:C1710.DocCode
	For each ($line; $file.lines)
		Case of 
			: ($line.code="Class extends @")
				This:C1470.parent:=Substring:C12($line.code; Length:C16("Class extends ")+1)
				If (OB Is defined:C1231($base.extends; This:C1470.parent))
					$base.extends[This:C1470.parent].push($name)
				Else 
					$base.extends[This:C1470.parent]:=New collection:C1472($name)
				End if 
			: ($line.code="Class constructor@")
				$parsing:=cs:C1710.DocClassConstructor.new($line)
			: ($line.code="Function@")
				$parsing:=cs:C1710.DocClassFunction.new($line)
			: ($current#Null:C1517)
				$current.parseLine($line; $base)
		End case 
		
		If (OB Class:C1730($parsing)#Null:C1517)
			If ($current#Null:C1517)
				Case of 
					: (OB Instance of:C1731($current; cs:C1710.DocClassConstructor))
						This:C1470.constructor:=$current
					Else 
						This:C1470.methods.push($current)
				End case 
			End if 
			$current:=$parsing
			$parsing:=Null:C1517
		End if 
		
	End for each 