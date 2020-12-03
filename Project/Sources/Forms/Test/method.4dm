Case of 
	: (Form event code:C388=On Load:K2:1)
		var $validate : cs:C1710.Validator
		Form:C1466.validate:=cs:C1710.Validator.new()
		Form:C1466.validate.addOptional(\
			cs:C1710.CheckFilled.new();\
			cs:C1710.UseField.new(OBJECT Get pointer:C1124(Object named:K67:5;"i_first"))\
			)
		
		Form:C1466.validate.addMandatory(\
			cs:C1710.CheckWhen.new(\
			Formula:C1597(OBJECT Get pointer:C1124(Object named:K67:5;"i_first")->#"");\
			cs:C1710.CheckFilled.new()\
			);\
			cs:C1710.UseField.new(OBJECT Get pointer:C1124(Object named:K67:5;"i_last"))\
			)
		
		Form:C1466.validate.addOptional(\
			cs:C1710.CheckWhen.new(\
			Formula:C1597(OBJECT Get pointer:C1124(Object named:K67:5;"i_first")->#"");\
			cs:C1710.CheckAge.new(10;20)\
			);\
			cs:C1710.UseField.new(OBJECT Get pointer:C1124(Object named:K67:5;"i_age"))\
			)
		Form:C1466.validate.runChecks()
	: (Form event code:C388=On Data Change:K2:15)
		Form:C1466.validate.runChecks()
End case 