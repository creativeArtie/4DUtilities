Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.validator:=validate_create
		var $checker; $field : Object
		$checker:=validate_fillValue
		var $ptr : Pointer
		$field:=validate_fieldWidget("fristName"; "First Name")
		Form:C1466.validator.addManadatory($checker; $field)
		
		$field:=validate_fieldWidget("company")
		Form:C1466.validator.addOptional($checker; $field)
		
		$checker:=validate_ageValue
		$field:=validate_fieldWidget("age")
		Form:C1466.validator.addOptional($checker; $field)
End case 

Form:C1466.validator.runCheck()