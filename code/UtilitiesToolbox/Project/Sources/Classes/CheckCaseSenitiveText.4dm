Class extends Checker
Class constructor($textParam : Text)
	
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $text : Variant
	If (wk_assertLocalParameter($assert; ->$text))
		$text:=$textParam
	End if 
	
	wk_assertParameterCount($assert)
	
	Super:C1705("$1 is not \""+$text+"\" (case senitive).")
	This:C1470.text:=$text
	
	
Function test($value : Variant)->$result : Boolean
	
	$0:=Length:C16($value)=Length:C16(This:C1470.text)
	If ($0)
		var $elmt : Integer
		For ($elmt; 1; Length:C16($value))
			If (Character code:C91(Substring:C12($value; $elmt; 1))#\
				Character code:C91(Substring:C12(This:C1470.text; $elmt; 1)))
				$0:=False:C215
				$elmt:=Length:C16($value)
			End if 
		End for 
	End if 