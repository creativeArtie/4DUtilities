Case of 
	: (Form event code:C388=On Timer:K2:25)
		Form:C1466.errors:=New collection:C1472
		var $pid : Text
		Use (Storage:C1525.utils_except.uncaught)
			For each ($pid; Storage:C1525.utils_except.uncaught)
				var $except : cs:C1710.Exception
				For each ($except; Storage:C1525.utils_except.uncaught[$pid])
					var $object : Object
					$object:=New object:C1471
					$object.pid:=$pid
					$object.name:=$except.name
					$object.line:=$except.line
					$object.message:=$except.message
					Form:C1466.errors.push($object)
				End for each 
			End for each 
		End use 
	: (Form event code:C388=On Unload:K2:2)
		SET TIMER:C645(0)
	: (Form event code:C388=On Load:K2:1)
		SET TIMER:C645(10)
End case 