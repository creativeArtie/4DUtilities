//%attributes = {"shared":true}
#DECLARE($issuesParam : Collection)->$result : Boolean

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $issues : Collection
If (wk_assertLocalParameter($assert; ->$issues; New collection:C1472))
	$issues:=$issuesParam
End if 

wk_assertParameterCount($assert)


var $continue : Boolean
$continue:=True:C214
$result:=True:C214

If (<>HOST_DATABASE=Null:C1517)
	$issues.push("wk_setupToolbox has not run on host database init.")
	$continue:=False:C215
	$result:=False:C215
End if 

If ($continue)
	If (<>TABLE_LOADER="")
		$issues.push("Missing method for table injection")
		$continue:=False:C215
		$result:=False:C215
	Else 
		var $build : 4D:C1709.Function
		$build:=Formula:C1597(New object:C1471("name"; $1; "type"; $2))
		$result:=checkTable($issues; "Exceptions"; New collection:C1472(\
			$build.call(Null:C1517; "message"; "string"); \
			$build.call(Null:C1517; "importance"; "number"); \
			$build.call(Null:C1517; "reason"; "object"); \
			$build.call(Null:C1517; "database"; "string"); \
			$build.call(Null:C1517; "line"; "number"); \
			$build.call(Null:C1517; "name"; "string"); \
			$build.call(Null:C1517; "type"; "string"); \
			$build.call(Null:C1517; "processName"; "string"); \
			$build.call(Null:C1517; "processId"; "number"); \
			$build.call(Null:C1517; "thrownTimestamp"; "string")\
			))
		
		$result:=$result & checkTable($issues; "PhoneFormats"; New collection:C1472(\
			$build.call(Null:C1517; "formatOrder"; "number"); \
			$build.call(Null:C1517; "countryCode"; "string"); \
			$build.call(Null:C1517; "callingCode"; "string"); \
			$build.call(Null:C1517; "trunkCode"; "string"); \
			$build.call(Null:C1517; "matchFormat"; "string"); \
			$build.call(Null:C1517; "outputFormat"; "string")\
			))
	End if 
End if 
