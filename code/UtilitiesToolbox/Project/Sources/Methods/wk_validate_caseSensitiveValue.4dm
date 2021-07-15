//%attributes = {}
#DECLARE($text : Text)->$result : cs:C1710.CheckCaseSenitiveText

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $text : Text
If (wk_assertLocalParameter($assert; ->$text))
	$text:=$textParam
End if 

wk_assertParameterCount($assert)

$result:=cs:C1710.CheckCaseSenitiveText.new($text)
