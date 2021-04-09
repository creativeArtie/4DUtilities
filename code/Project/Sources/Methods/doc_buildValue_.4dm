//%attributes = {}
//! #brief factory for `cs.DocValue_`
//! #author Wai-Kin 2021-Apr-3
#DECLARE($line : cs:C1710.DocLine_; $section : cs:C1710.DocSection_)->$used : Boolean
$used:=True:C214

var $extracted; $raw : Text
var $found : Collection
$found:=New collection:C1472

Case of 
	: (OB Instance of:C1731($section; cs:C1710.DocMethod_) & \
		Match regex:C1019("[\t]*#DECLARE.*"; $line.code))
		var $value : Collection
		If ($line.code="@(@)@")
			$extracted:=Split string:C1554($line.code; "(")[1]
			$extracted:=Split string:C1554($extracted; ")")[0]
			For each ($raw; Split string:C1554($extracted; ";"))
				var $parts : Object
				$found.push(New object:C1471(\
					"value"; $raw; \
					"type"; "param"))
			End for each 
		End if 
		
		If ($line.code="@->@")
			$extracted:=Split string:C1554($line.code; "->")[1]
			$found.push(New object:C1471(\
				"value"; $extracted; \
				"type"; "return"))
		End if 
		
	: (OB Instance of:C1731($section; cs:C1710.DocFunction_) & \
		Match regex:C1019("[\t]*(Function|Class constructor).*"; $line.code))
		If ($line.code="@(@)@")
			$extracted:=Split string:C1554($line.code; "(")[1]
			$extracted:=Split string:C1554($extracted; ")")[0]
			For each ($raw; Split string:C1554($extracted; ";"))
				$found.push(New object:C1471(\
					"value"; $raw; \
					"type"; "param"))
			End for each 
		End if 
		
		If ($line.code="@->@")
			$extracted:=Split string:C1554($line.code; "->")[1]
			$found.push(New object:C1471(\
				"value"; $extracted; \
				"type"; "return"))
		End if 
	Else 
		$used:=False:C215
End case 

If (Not:C34($used))
	$used:=True:C214
	var $start; $end : Integer
	var $type : Text
	Case of 
		: (Match regex:C1019("[\t]*var "; $line.code; 1; $start; $end))
			If ($start=1)
				$extracted:=Substring:C12($line.code; $start+$end)
				If (Match regex:C1019(":"; $extracted; 1; $start; $end))
					$type:=Substring:C12($extracted; $start+$end)
				Else 
					$type:="Variant"
				End if 
				$extracted:=Substring:C12($extracted; 1; $start-1)
				For each ($raw; Split string:C1554($extracted; ";"))
					$found.push(New object:C1471("value"; $raw+" : "+$type))
				End for each 
			End if 
			
		: (Match regex:C1019("[\t]*C_"; $line.code; 1; $start; $end))
			If ($start=1)
				$extracted:=Substring:C12($line.code; $start+$end)
				$type:=Split string:C1554($extracted; "(")[0]
				$type:=Split string:C1554($type; ":")[0]
				
				$extracted:=Split string:C1554($line.code; "(")[1]
				$extracted:=Split string:C1554($extracted; ")")[0]
				For each ($raw; Split string:C1554($extracted; ";"))
					$found.push(New object:C1471("value"; $raw+" : "+$type))
				End for each 
				$used:=True:C214
			End if 
		Else 
			$used:=False:C215
	End case 
End if 

var $input : Object
For each ($input; $found)
	If (Not:C34(OB Is defined:C1231($input; "type")))
		Case of 
			: (Match regex:C1019("\\$[0-9]+ "; $input.value; 1; $start; $end))
				var $num : Integer
				$num:=Num:C11($input.value)
				//! #todo code for parameters
				If (Not:C34(OB Is defined:C1231($section; "params")))
					$section.params:=New collection:C1472
				End if 
				Case of 
					: ($num=0)
						If (OB Is defined:C1231($section; "return"))
							$brief:=$section.return.brief
							If ($brief#"")
								$brief:="<br />"+$brief
							End if 
							$section.return.brief:=$brief+$line.doc
						Else 
							$input.type:="return"
						End if 
						
					: ($section.params.length>($num-1))
						var $brief : Text
						$brief:=$section.params[$num-1].brief
						If ($brief#"")
							$brief:="<br />"+$brief
						End if 
						$section.params[$num-1].brief:=$brief+$line.doc
						
						
					Else 
						
				End case 
			: (Match regex:C1019("\\$\\{[0-9]\\}+ "; $input.value; 1; $start; $end))
			Else 
				var $searching : Boolean
				$searching:=True:C214
				
				If (OB Is defined:C1231($section; "params"))
					var $param : cs:C1710.DocParam_
					For each ($param; $section.params)
						If (($param.name+"@")=$input.value)
							TRACE:C157
						End if 
					End for each 
				End if 
				
				If ($searching)
					$input.type:="value"
				End if 
		End case 
	End if 
	
	If (OB Is defined:C1231($input; "type"))
		var $value : cs:C1710.DocValue_
		Case of 
			: ($input.type="param")
				$value:=cs:C1710.DocParam_.new($line; $input.value)
				$section.params.push($value)
			: ($input.type="return")
				$value:=cs:C1710.DocReturn_.new($line; $input.value)
				$section.return:=$value
			: ($input.type="value")
				$value:=cs:C1710.DocValue_.new($line; $input.value)
				$section.local.push($value)
		End case 
		$value.brief:=$line.doc
	End if 
End for each 
