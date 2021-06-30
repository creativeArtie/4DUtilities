//%attributes = {"shared":true}
#DECLARE->$issues : Collection

$issues:=New collection:C1472
var $continue : Boolean
$continue:=True:C214

If (<>HOST_DATABASE=Null:C1517)
	$issues.push("wk_setupToolbox has not run on host database init.")
	$continue:=False:C215
End if 

If ($continue)
	If (<>TABLE_LOADER="")
		$issues.push("Missing method for table injection")
		$continue:=False:C215
	Else 
		checkTable($issues; "Exceptions"; \
			New collection:C1472("message"; "importance"; "reason"; \
			"database"; "line"; "name"; "type"; \
			"processName"; "processId"; "thrownTimestamp"))
		checkTable($issues; "PhoneFormats"; New collection:C1472(\
			"formatOrder"; "countryCode"; "callingCode"; "trunkCode"; \
			"matchFormat"; "outputFormat"))
	End if 
End if 
