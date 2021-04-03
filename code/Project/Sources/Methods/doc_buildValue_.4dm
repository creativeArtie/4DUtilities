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
	If (OB Is defined:C1231($input; "type"))
		If ($input.type="param")
			$section.params.push(cs:C1710.DocParam_.new($line; $input.value))
		Else 
			$section.return:=cs:C1710.DocReturn_.new($line; $input.value)
		End if 
	Else 
		Case of 
			: (Match regex:C1019("\\$[0-9]+ "; $input.value; 1; $start; $end))
				var $num : Integer
				$num:=Num:C11($input.value)
				//! #todo code for parameters
				If (OB Is defined:C1231($section; "params"))
					Case of 
						: ($section.params.length>$num)
							var $brief : Text
							$section.params[$num].brief:=$section.params[$num].brief+$line.doc
						: ($section.params.length=$num)
							
						Else 
					End case 
				End if 
			: (Match regex:C1019("\\$\\{[0-9]\\}+ "; $input.value; 1; $start; $end))
				
			Else 
				var $check : Text
				$check:=Split string:C1554($input.value; ":"; sk trim spaces:K86:2)[0]
				var $existed : cs:C1710.DocParam_
				var $isNew : Boolean
				$isNew:=True:C214
				
				If (OB Is defined:C1231($section; "params"))
					For each ($existed; $section.params)
						If ($existed.name=$check)
							$existed.brief:=$existed.brief+$line.doc
							$isNew:=False:C215
						End if 
					End for each 
				End if 
				
				If ($isNew)
					If (OB Is defined:C1231($section; "return"))
						If ($section.return.name=$check)
							$section.return.brief:=$section.return.brief+$line.doc
							$isNew:=False:C215
						End if 
					End if 
				End if 
				
				If ($isNew)
					$section.local.push(cs:C1710.DocValue_.new($line; $input.value))
				End if 
		End case 
	End if 
End for each 
