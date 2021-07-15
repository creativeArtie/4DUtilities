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
		
		$checker:=wk_validate_fillValue()
		$field:=wk_validate_comboboxWidget("gender")
		Form:C1466.validator.addOptional($checker; $field)
		
		wk_seedPhoneFormats
		Form:C1466.phoneFormat:=wk_validate_formattedWidget("homephone"; "Home Phone")
		var $formatter : Object
		$formatter:=wk_createPhoneFormat("CA")
		Form:C1466.validator.addManadatoryFormat(Form:C1466.phoneFormat; $formatter)
End case 

Form:C1466.validator.runCheck()
OBJECT SET ENABLED:C1123(*; "ignore"; Form:C1466.validator.canIgnore())
OBJECT SET ENABLED:C1123(*; "commit"; Form:C1466.validator.hasNoIssues())