//%attributes = {}
//! #brief creates a new phone format entity and save it
//! #author Wai-Kin
#DECLARE($order : Real; $countryCode : Text; $callingCode : Text; \
$truckCode : Text; $matchFormat : Text; $outputFormat : Text)->$format : 4D:C1709.Entity

var $entity : cs:C1710.PhoneFormatsEntity

var $count : Integer
$entity:=ds:C1482.PhoneFormats.new()
$entity.formatOrder:=utils_assertParameter($1; ->$count; Count parameters:C259)\
  //! [PhoneFormats]formatOrder
$entity.countryCode:=Uppercase:C13(utils_assertParameter($2; ->$count; Count parameters:C259))\
  //! [PhoneFormats]countryCode
$entity.callingCode:=utils_assertParameter($3; ->$count; Count parameters:C259)\
  //! [PhoneFormats]callingCode
$entity.trunkCode:=utils_assertParameter($4; ->$count; Count parameters:C259)\
  //! [PhoneFormats]trunkCode
$entity.matchFormat:=utils_assertParameter($5; ->$count; Count parameters:C259))\
  //! [PhoneFormats]matchFormat
$entity.outputFormat:=utils_assertParameter($6; ->$count; Count parameters:C259))\
  //! [PhoneFormats]outputFormat
utils_assertParameterCount($count; Count parameters:C259)

var $find : cs:C1710.PhoneFormatsSelection
$find:=ds:C1482.PhoneFormats.query("countryCode=:1 & formatOrder=:2"; $entity.countryCode; $entity.order)
If ($find.length=0)
	$entity.save()
End if 
