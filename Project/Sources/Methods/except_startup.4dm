//%attributes = {}
Use (Storage:C1525)
	Storage:C1525.utils_except:=New shared object:C1526
End use 

Use (Storage:C1525.utils_except)
	Storage:C1525.utils_except.uncaught:=New shared object:C1526
End use 

var $uncaught : Collection

var $caller : Object
$caller:=utils_getMethodCaller(Current method name:C684)

While (True:C214)
	Use (Storage:C1525.utils_except.uncaught)
		For each ($key; OB Keys:C1719(Storage:C1525.utils_except.uncaught))
			var $key : Text
			var $id : Integer
			
			$id:=Num:C11($key)
			If (Process state:C330($id)=Aborted:K13:1)
				// Add error to 
				For each ($throwable; Storage:C1525.utils_except.uncaught[$key])
					except_addException(cs:C1710.Exception.new(\
						"Uncaught Exception in process: "+String:C10($key); \
						Get call chain:C1662[0]; Warning message:K38:2; \
						$throwable))
				End for each 
				OB REMOVE:C1226(Storage:C1525.utils_except.uncaught; $key)
			End if 
		End for each 
	End use 
End while 