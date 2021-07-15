//%attributes = {"shared":true}
#DECLARE($countryCodeParam : Text)->$formatter : cs:C1710.PhoneFormatter


var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $countryCode : Text
If (wk_assertLocalParameter($assert; ->$countryCode; ""))
	$countryCode:=$countryCodeParam
End if 

wk_assertParameterCount($assert)

$formatter:=cs:C1710.PhoneFormatter.new($countryCode)
