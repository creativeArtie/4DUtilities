Class extends DocBase
Class constructor
	Super:C1705()
	This:C1470.parameters:=New collection:C1472
	This:C1470.localVariable:=New collection:C1472
	
Function parseDeclare($line : cs:C1710.RawLine)
	var $pos_found; $length_found; $ptr : Real
	var $raw; $param; $name; $type : Text
	var $parts : Collection
	$ptr:=1
	If (Match regex:C1019("\\(.+\\)"; $line.code; 1; $pos_found; $length_found))
		$raw:=Substring:C12($line.code; $pos_found+1; $length_found-2)
		For each ($param; Split string:C1554($raw; ";"))
			This:C1470.parameters.push(This:C1470.buildParameter($param; $line.row; $ptr))
			$ptr:=$ptr+1
		End for each 
		
		If (Match regex:C1019("->"; $line.code; 1; $pos_found; $length_found))
			$raw:=Substring:C12($line.code; $pos_found+$length_found)
			This:C1470.buildParameter($raw; $line.row; 0)
		End if 
	End if 
	
Function buildParameter($raw : Text; $row : Real; $pos : Real)->$param : cs:C1710.DocParameter
	var $0 : cs:C1710.DocParameter
	var $parts : Collection
	var $name; $type : Text
	
	$parts:=Split string:C1554($raw; ":")
	$name:=$parts[0]
	Case of 
		: ($parts.length=2)
			$type:=$parts[1]
		: ($parts.length=3)
			$type:="cs."+Split string:C1554($parts[2]; ".")[1]
		Else 
			$type:="variant"
	End case 
	$param:=cs:C1710.DocParameter.new($name; $type; $row; $pos)
	
Function parseLine($line : cs:C1710.RawLine; $base : cs:C1710.DocRoot)
	var $pos_found; $length_found; $ptr : Real
	Case of 
		: (Match regex:C1019("^[\t]*var"; $line.code; 1; $pos_found; $length_found))
			var $raw : Collection
			var $type : Text
			$raw:=Split string:C1554(Substring:C12($line.code; $pos_found+$length_found); ":")
			Case of 
				: ($raw.length=2)
					$type:=$raw[1]
				: ($raw.length=3)
					$type:="cs."+Split string:C1554($raw[2]; ".")[1]
				Else 
					$type:="variant"
			End case 
			
			var $name : Text
			For each ($name; Split string:C1554($raw[0]; ";"))
				Case of 
					: (Match regex:C1019("\\$[0-9]+"; $name; 1; $pos_found; $length_found))
						var $param : cs:C1710.DocParameter
						$param:=This:C1470.parameters.find("doc_findParameter"; Num:C11($name))
						If (Value type:C1509($param)=Null:C1517)
							$param:=cs:C1710.DocParameter.new(""; $type; $line.code; Num:C11($name))
							This:C1470.parameters.push($param)
						End if 
						If ($line.doc#"")
							$param.document.push($line.doc)
						End if 
					: (Match regex:C1019("\\$"; $name; 1; $pos_found; $length_found))
						var $var : cs:C1710.DocLocalVariable
						$var:=This:C1470.localVariable.find("doc_findLocalVariable"; $name)
						If (Value type:C1509($var)=Is undefined:K8:13)
						Else 
						End if 
					Else 
						
				End case 
			End for each 
	End case 