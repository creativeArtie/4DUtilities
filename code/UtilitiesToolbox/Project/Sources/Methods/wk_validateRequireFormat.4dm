//%attributes = {"shared":true}
#DECLARE($validatorParam : cs:C1710.Validator; $formatParam : Text; \
$idParam : Text; $countryCodeParam : Text; $nameParam : Text)->$field : cs:C1710.AccessField

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

var $pointer : Pointer
$pointer:=OBJECT Get pointer:C1124(Object named:K67:5; $id)
ASSERT:C1129($pointer#Null:C1517)
var $name : Text
If (wk_assertLocalParameter($assert; ->$name; getPointerName($pointer)))
	$name:=$nameParam
End if 

var $countryCode : Text
If (wk_assertLocalParameter($assert; ->$countryCode; ""))
	$countryCode:=$countryCodeParam
End if 

wk_assertParameterCount($assert)

$field:=validate_format($validator; $format; $countryCode; $id; $name; True:C214)