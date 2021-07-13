//%attributes = {}
#DECLARE($formatOrderParam : Real; $countryCodeParam : Text; $callingCodeParam : Text; \
$trunkCodeParam : Text; $matchFormatParam : Text; $outputFormatParam : Text)->$format : 4D:C1709.Entity

var $phoneFormats : 4D:C1709.DataClass
EXECUTE METHOD:C1007(<>TABLE_LOADER; $phoneFormats; "PhoneFormats")

var $entity : 4D:C1709.Entity
$entity:=$phoneFormats.new()


var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

If (wk_assertObjectParameter($assert; $entity; "formatOrder"))
	$entity.formatOrder:=$formatOrderParam
End if 

If (wk_assertObjectParameter($assert; $entity; "countryCode"))
	$entity.countryCode:=$countryCodeParam
End if 

If (wk_assertObjectParameter($assert; $entity; "callingCode"))
	$entity.callingCode:=$callingCodeParam
End if 

If (wk_assertObjectParameter($assert; $entity; "trunkCode"))
	$entity.trunkCode:=$trunkCodeParam
End if 

If (wk_assertObjectParameter($assert; $entity; "matchFormat"))
	$entity.matchFormat:=$matchFormatParam
End if 

If (wk_assertObjectParameter($assert; $entity; "outputFormat"))
	$entity.outputFormat:=$outputFormatParam
End if 

wk_assertParameterCount($assert)

var $find : 4D:C1709.EntitySelection
$find:=$phoneFormats.query("countryCode=:1 & formatOrder=:2"; $entity.countryCode; $entity.formatOrder)
If ($find.length=0)
	$entity.save()
End if 
