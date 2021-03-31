//! #brief Runs the test and gets the template message
//! #author Wai-Kin Chau
Function test
	//! #brief Test the values
	//! By the time this method is called,\
				`This.setValue()` will be called in cs.Validator
	ASSERT:C1129(False:C215; "Needs implementation.")  //! #abstract
Function getMessageTemplate->$template : Text
	//! #brief Gets the template message
	ASSERT:C1129(False:C215; "Needs implementation.")  //! #abstract
Function setValue($value : Variant)
	//! #brief Set the checking value
	var $1 : Variant
	Case of 
		: (Count parameters:C259=1)
			This:C1470.value:=$1
		Else 
			ASSERT:C1129(False:C215; "Not enough parameters.")
	End case 
	
Function getValue->$result
	//! #brief Gets the checking value
	$0:=This:C1470.value.getValue()