//%attributes = {}
#DECLARE($order : Real; $countryCode : Text; $callingCode : Text; \
$truckCode : Text; $matchFormat : Text; $outputFormat : Text)->$format : 4D:C1709.Entity

var $entity : cs:C1710.PhoneFormatsEntity

$entity:=ds:C1482.PhoneFormats.new()
$entity.order:=utils_setParam($1; Is real:K8:4)
$entity.countryCode:=Uppercase:C13(utils_setParam($2; Is text:K8:3))
$entity.callingCode:=utils_setParam($3; Is text:K8:3)
$entity.trunkCode:=utils_setParam($4; Is text:K8:3)
$entity.matchFormat:=utils_setParam($5; Is text:K8:3)
$entity.outputFormat:=utils_setParam($6; Is text:K8:3)
utils_countParams(6; Count parameters:C259)

var $find : cs:C1710.PhoneFormatsSelection
$find:=ds:C1482.PhoneFormats.query("countryCode=:1 & order=:2"; $entity.countryCode; $entity.order)
If ($find.length=0)
	$entity.save()
End if 
