//%attributes = {}
wk_assertNoParameters(Count parameters:C259)

Use (Storage:C1525)
	Storage:C1525.utils_except:=New shared object:C1526
End use 
Use (Storage:C1525.utils_except)
	Storage:C1525.utils_except.uncaught:=New shared object:C1526
	Storage:C1525.utils_except.escape:=New shared collection:C1527
End use 

While (True:C214)
	var $removing : Collection
	$removing:=New collection:C1472
	Use (Storage:C1525.utils_except.uncaught)
		For each ($key; OB Keys:C1719(Storage:C1525.utils_except.uncaught))
			var $key : Text
			var $id : Integer
			
			$id:=Num:C11($key)
			If (Process state:C330($id)=Aborted:K13:1)
				// Add error to
				var $throwable : Object
				For each ($throwable; Storage:C1525.utils_except.uncaught[$key])
					var $exception : Object
					$exception:=error_create(\
						"Uncaught Exception in process: "+String:C10($key); \
						Warning message:K38:2; $throwable)
					error_addException($exception; False:C215; True:C214)
					$removing.push($key)
				End for each 
				OB REMOVE:C1226(Storage:C1525.utils_except.uncaught; $key)
			End if 
		End for each 
	End use 
	
	Use (Storage:C1525.utils_except.escape)
		For each ($key; $removing)
			var $index : Integer
			$index:=Storage:C1525.utils_except.escape.indexOf($key)
			If ($index#-1)
				Storage:C1525.utils_except.escape.remove($index)
			End if 
		End for each 
	End use 
End while 