/// #brief Runs the test and gets the template message
Function test
	/// #brief Test the values
	ASSERT:C1129(False:C215; "Needs implementation.")  /// #abstract
Function getMessageTemplate->$template : Text
	/// #brief Gets the template message
	ASSERT:C1129(False:C215; "Needs implementation.")  /// #abstract
Function setValue($value : Text)
	var $1 : Variant
	Case of 
		: (Count parameters:C259=1)
			This:C1470.value:=$1
		Else 
			ASSERT:C1129(False:C215; "Not enough parameters.")
	End case 
	
Function getValue
	$0:=This:C1470.value.getValue()