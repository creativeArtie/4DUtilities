//%attributes = {"shared":true}
Use (Storage:C1525)
	Storage:C1525.utils_except:=New shared object:C1526
End use 

Use (Storage:C1525.utils_except)
	Storage:C1525.utils_except.uncaught:=New shared object:C1526
End use 

C_COLLECTION:C1488($uncaught)

C_OBJECT:C1216($caller)
$caller:=utils_getMethodCaller(Current method name:C684)

While (True:C214)
	Use (Storage:C1525.utils_except.uncaught)
		For each ($key;OB Keys:C1719(Storage:C1525.utils_except.uncaught))
			C_TEXT:C284($key)
			C_LONGINT:C283($id)
			$id:=Num:C11($key)
			If (Process state:C330($id)=Aborted:K13:1)
				// Add error to 
				$uncaught:=New collection:C1472
				For each ($throwable;Storage:C1525.utils_except.uncaught[$key])
					$uncaught.push(cs:C1710.Exception.new(\
						"Uncaught Exception in process: "+String:C10($key);\
						$throwable))
				End for each 
				OB REMOVE:C1226(Storage:C1525.utils_except.uncaught;$key)
				If (OB Is defined:C1231(Storage:C1525.utils_except;"logTable"))
					Storage:C1525.utils_except.logTable.fromCollection($uncaught).save()
				End if 
			End if 
		End for each 
	End use 
End while 