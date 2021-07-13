//%attributes = {}
#DECLARE($countryCodeParam : Text)->$result : Integer


var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $countryCode : Text
If (wk_assertLocalParameter($assert; ->$countryCode))
	$countryCode:=$countryCodeParam
End if 

wk_assertParameterCount($assert)

If (This:C1470.countryCode=$countryCode)
	$result:=This:C1470.formatOrder
Else 
	$result:=(Character code:C91(This:C1470.countryCode)*100000)+\
		(Character code:C91(Substring:C12(This:C1470.countryCode; 2))*1000)+\
		This:C1470.formatOrder
End if 

