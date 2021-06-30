Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.validator:=wk_validate_create
		var $checker; $field : Object
		var $ptr : Pointer
		
		$checker:=wk_validate_fillValue
		$field:=wk_validate_fieldWidget("fristName"; "First Name")
		Form:C1466.validator.addManadatory($checker; $field)
		
		$field:=wk_validate_fieldWidget("company")
		Form:C1466.validator.addOptional($checker; $field)
		
		$checker:=wk_validate_ageValue(12; 100)
		$field:=wk_validate_fieldWidget("age")
		Form:C1466.validator.addOptional($checker; $field)
End case 

Form:C1466.validator.runCheck()