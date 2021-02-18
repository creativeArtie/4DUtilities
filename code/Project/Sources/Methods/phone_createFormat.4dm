//%attributes = {}
#DECLARE($order : Real; $countryCode : Text; $callingCode : Text; \
$truckCode : Text; $matchFormat : Text; $outputFormat : Text)->$format : 4D:C1709.Entity

var $entity : cs:C1710.PhoneFormatsEntity

$entity:=ds:C1482.PhoneFormats.new()
$entity.order:=utils_getRequireValue($1; Is real:K8:4)
$entity.countryCode:=Uppercase:C13(utils_getRequireValue($2; Is text:K8:3))
$entity.callingCode:=utils_getRequireValue($3; Is text:K8:3)
$entity.trunkCode:=utils_getRequireValue($4; Is text:K8:3)
$entity.matchFormat:=utils_getRequireValue($5; Is text:K8:3)
$entity.outputFormat:=utils_getRequireValue($6; Is text:K8:3)
utils_countParams(6; Count parameters:C259)

var $find : cs:C1710.PhoneFormatsSelection
$find:=ds:C1482.PhoneFormats.query("countryCode=:1 & order=:2"; $entity.countryCode; $entity.order)
If ($find.length=0)
	$entity.save()
End if 
