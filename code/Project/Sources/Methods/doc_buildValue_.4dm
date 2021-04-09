//%attributes = {}
//! #brief factory for `cs.DocValue_`
//! #author Wai-Kin 2021-Apr-3
#DECLARE($line : cs:C1710.DocLine_; $section : cs:C1710.DocSection_)->$used : Boolean
$used:=True:C214

var $extracted; $raw : Text
var $found : Collection
$found:=New collection:C1472
var $parts : Object

Case of 
	: (OB Instance of:C1731($section; cs:C1710.DocMethod_) & \
		Match regex:C1019("[\t]*#DECLARE.*"; $line.code))
		var $value : Collection
		If ($line.code="@(@)@")
			$extracted:=Split string:C1554($line.code; "("; sk trim spaces:K86:2)[1]
			$extracted:=Split string:C1554($extracted; ")"; sk trim spaces:K86:2)[0]
			For each ($raw; Split string:C1554($extracted; ";"; sk trim spaces:K86:2))
				$parts:=doc_splitValueType_($raw)
				$parts.creates:="param"
				$found.push($parts)
			End for each 
		End if 
		
		If ($line.code="@->@")
			$extracted:=Split string:C1554($line.code; "->"; sk trim spaces:K86:2)[1]
			$parts:=doc_splitValueType_($extracted)
			$parts.creates:="return"
			$found.push($parts)
		End if 
		
	: (OB Instance of:C1731($section; cs:C1710.DocFunction_) & \
		Match regex:C1019("[\t]*(Function|Class constructor).*"; $line.code))
		If ($line.code="@(@)@")
			$extracted:=Split string:C1554($line.code; "("; sk trim spaces:K86:2)[1]
			$extracted:=Split string:C1554($extracted; ")"; sk trim spaces:K86:2)[0]
			For each ($raw; Split string:C1554($extracted; ";"; sk trim spaces:K86:2))
				$parts:=doc_splitValueType_($raw)
				$parts.creates:="param"
				$found.push($parts)
			End for each 
		End if 
		
		If ($line.code="@->@")
			$extracted:=Split string:C1554($line.code; "->"; sk trim spaces:K86:2)[1]
			$parts:=doc_splitValueType_($extracted)
			$parts.creates:="return"
			$found.push($parts)
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
					$type:=doc_splitValueType_($type; False:C215).type
				Else 
					$type:="Variant"
				End if 
				$extracted:=Substring:C12($extracted; 1; $start-1)
				For each ($raw; Split string:C1554($extracted; ";"; sk trim spaces:K86:2))
					$found.push(New object:C1471("name"; $raw; "type"; $type))
				End for each 
			End if 
			
		: (Match regex:C1019("[\t]*C_"; $line.code; 1; $start; $end))
			If ($start=1)
				$extracted:=Substring:C12($line.code; $start+$end)
				$type:=Split string:C1554($extracted; "("; sk trim spaces:K86:2)[0]
				$type:=Split string:C1554($type; ":"; sk trim spaces:K86:2)[0]
				
				$extracted:=Split string:C1554($line.code; "("; sk trim spaces:K86:2)[1]
				$extracted:=Split string:C1554($extracted; ")"; sk trim spaces:K86:2)[0]
				For each ($raw; Split string:C1554($extracted; ";"; sk trim spaces:K86:2))
					$found.push(New object:C1471("name"; $raw; "type"; $type))
				End for each 
				$used:=True:C214
			End if 
		Else 
			$used:=False:C215
	End case 
End if 

var $input : Object
For each ($input; $found)
	If (Not:C34(OB Is defined:C1231($input; "creates")))
		Case of 
			: (Match regex:C1019("\\$[0-9]+"; $input.name; 1; $start; $end))
				var $num : Integer
				$num:=Num:C11($input.name)
				Case of 
					: ($num=0)
						If (OB Is defined:C1231($section; "return"))
							$brief:=$section.return.brief
							If ($brief#"")
								$brief:="<br />"+$brief
							End if 
							$section.return.brief:=$brief+$line.doc
						Else 
							$input.creates:="return"
						End if 
						
					: ($section.params.length>($num-1))
						var $brief : Text
						$brief:=$section.params[$num-1].brief
						If ($brief#"")
							$brief:="<br />"+$brief
						End if 
						$section.params[$num-1].brief:=$brief+$line.doc
					Else 
						$input.creates:="param"
				End case 
			: (Match regex:C1019("\\$\\{[0-9]\\}+ "; $input.name; 1; $start; $end))
			Else 
				var $searching : Boolean
				$searching:=True:C214
				
				If (OB Is defined:C1231($section; "params"))
					var $param : cs:C1710.DocParam_
					For each ($param; $section.params)
						If ($param.name=$input.name)
							var $brief : Text
							$brief:=$param.brief
							If ($brief#"")
								$brief:="<br />"+$brief
							End if 
							$param.brief:=$brief+$line.doc
							$searching:=False:C215
						End if 
					End for each 
				End if 
				
				If ($searching)
					$input.creates:="value"
				End if 
		End case 
	End if 
	
	If (OB Is defined:C1231($input; "creates"))
		var $creates : cs:C1710.DocValue_
		Case of 
			: ($input.creates="param")
				$creates:=cs:C1710.DocParam_.new($line; $input.name; $input.type)
				$section.params.push($creates)
			: ($input.creates="return")
				$creates:=cs:C1710.DocReturn_.new($line; $input.name; $input.type)
				$section.return:=$creates
			: ($input.creates="value")
				$creates:=cs:C1710.DocValue_.new($line; $input.name; $input.type)
				$section.local.push($creates)
		End case 
		$creates.brief:=$line.doc
	End if 
End for each 
