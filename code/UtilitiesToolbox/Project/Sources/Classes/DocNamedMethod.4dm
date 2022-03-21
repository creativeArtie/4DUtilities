Class extends DocCode
Class constructor($name : Text; $file : cs:C1710.RawFile; $root : cs:C1710.DocRoot)
	Super:C1705()
	This:C1470.name:=$name
	var $line : Object
	For each ($line; $file.lines)
		Case of 
			: ($line.code="#DECLARE@")
				This:C1470.parseDeclare($line)
			Else 
				This:C1470.parseLine($line; $root)
		End case 
	End for each 