//%attributes = {}
#DECLARE($validatorParam : cs:C1710.Validator; $formatParam : Text; \
$idParam : Text; $nameParam : Text; $countryCodeParam : Text; $requiredParam : Boolean)->$field : cs:C1710.AccessField

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $validator : cs:C1710.Validator
If (wk_assertLocalParameter($assert; ->$validator))
	$validator:=$validatorParam
End if 

var $format : Text
If (wk_assertLocalParameter($assert; ->$format))
	$format:=$formatParam
End if 

var $id : Text
If (wk_assertLocalParameter($assert; ->$id))
	$id:=$idParam
End if 

var $name : Text
If (wk_assertLocalParameter($assert; ->$name))
	$name:=$nameParam
End if 

var $required : Boolean
If (wk_assertLocalParameter($assert; ->$required))
	$required:=$requiredParam
End if 


var $countryCode : Text
If (wk_assertLocalParameter($assert; ->$countryCode; ""))
	$countryCode:=$countryCodeParam
End if 

wk_assertParameterCount($assert)

var $formatter : cs:C1710.Formatter
Case of 
	: ($format="phone")
		$formatter:=cs:C1710.PhoneFormatter.new($countryCode)
	Else 
		ASSERT:C1129(False:C215; "Unknown format: "+$format)
End case 

var $check : cs:C1710.CheckFormat

$field:=cs:C1710.AccessFormat.new($id; $name; $formatter)
$check:=cs:C1710.CheckFormat.new($formatter)

If ($required)
	$validator.addManadatory($check; $field)
Else 
	$validator.addOptional($check; $field)
End if 