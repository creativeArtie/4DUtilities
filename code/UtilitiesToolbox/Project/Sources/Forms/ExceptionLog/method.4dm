var $update : Boolean
$update:=False:C215
Case of 
	: (Form event code:C388=On Timer:K2:25)
		$update:=True:C214
	: (Form event code:C388=On Unload:K2:2)
		SET TIMER:C645(0)
	: (Form event code:C388=On Load:K2:1)
		SET TIMER:C645(5)
		$update:=True:C214
		Form:C1466.errors:=New collection:C1472
		Form:C1466.log:=New collection:C1472
End case 

If ($update)
	var $index : Integer
	Form:C1466.errors.clear()
	var $pid : Text
	Use (Storage:C1525.utils_except.uncaught)
		For each ($pid; Storage:C1525.utils_except.uncaught)
			var $except : Object
			For each ($except; Storage:C1525.utils_except.uncaught[$pid])
				Form:C1466.errors.push(OB Copy:C1225($except))
			End for each 
		End for each 
	End use 
	var $exceptions : 4D:C1709.DataClass
	$index:=Form:C1466.logIndex
	EXECUTE METHOD:C1007(<>TABLE_LOADER; $exceptions; "Exceptions")
	Form:C1466.log:=$exceptions.all()
	If ($index>LISTBOX Get number of rows:C915(*; "logList"))
		$index:=LISTBOX Get number of rows:C915(*; "logList")
	End if 
	LISTBOX SELECT ROW:C912(*; "logList"; $index)
End if 