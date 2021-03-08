Class constructor($countParams : Integer)
	ASSERT:C1129(Count parameters:C259=1; "Wrong number of paramters")
	This:C1470.countParams:=$countParams
	This:C1470.currentParam:=1
	
Function checkRequired($input : Variant; $function : 4D:C1709.Function)->$answer : Variant
	// paramater checking
	Case of 
		: (Count parameters:C259=1)
			$function:=Formula:C1597(True:C214)
		: (Count parameters:C259=2)
		Else 
			ASSERT:C1129(False:C215; "Wrong number of paramters")
	End case 
	
	// run asserts
	If (This:C1470.countParams>=This:C1470.currentParam)
		ASSERT:C1129($function.apply(This:C1470; $input); "Assert failed: "+$function.source)
	Else 
		ASSERT:C1129(False:C215; "Missing paramater for "+This:C1470.currentParam)
	End if 
	This:C1470.currentParam:=This:C1470.currentParam+1
	$answer:=$input
	
	
Function checkRequirePointer($input : Pointer; $type : Integer)->$answer : Pointer
	// paramater checking
	Case of 
		: (Count parameters:C259=1)
			$type:=Is variant:K8:33
		: (Count parameters:C259=2)
		Else 
			ASSERT:C1129(False:C215; "Wrong number of paramters")
	End case 
	
	// run asserts
	If (This:C1470.countParams>=This:C1470.currentParam)
		If ($type#Is variant:K8:33)
			ASSERT:C1129(Value type:C1509($input->)==$type; "Wrong data type for "+This:C1470.currentParam)
		End if 
	Else 
		ASSERT:C1129(False:C215; "Missing paramater for "+This:C1470.currentParam)
	End if 
	This:C1470.currentParam:=This:C1470.currentParam+1
	$answer:=$input
	
Function checkOptional($input : Variant; $default : Variant; \
$function : 4D:C1709.Function)->$answer : Variant
	// paramater checking
	Case of 
		: (Count parameters:C259=2)
			$function:=Formula:C1597(True:C214)
		: (Count parameters:C259=3)
		Else 
			ASSERT:C1129(False:C215; "Wrong number of paramters")
	End case 
	
	// run asserts
	ASSERT:C1129($function.apply(This:C1470; $default); "Assert failed: "+$function.source)
	If (This:C1470.countParams>=This:C1470.currentParam)
		If ($function.apply(This:C1470; $input))
			ASSERT:C1129($function.apply(This:C1470; $input); "Assert failed: "+$function.source)
			$answer:=$default
		Else 
			$answer:=$input
		End if 
	Else 
		$answer:=$default
	End if 
	This:C1470.currentParam:=This:C1470.currentParam+1
	
Function checkOptionalPointer($input : Pointer; $default : Variant; \
$type : Integer)->$answer : Pointer
	// paramater checking
	Case of 
		: (Count parameters:C259=2)
			$type:=Is variant:K8:33
		: (Count parameters:C259=3)
		Else 
			ASSERT:C1129(False:C215; "Wrong number of paramters")
	End case 
	
	// run asserts
	If ($type#Is variant:K8:33)
		ASSERT:C1129(Value type:C1509($default->)=$type; "Wrong type for param:"+This:C1470.currentParam)
	End if 
	
	If (This:C1470.countParams>=This:C1470.currentParam)
		If (($type#Is variant:K8:33) & (Value type:C1509($value->)=$type)
			ASSERT:C1129(Value type:C1509($value->)=$type; "Wrong type for param:"+This:C1470.currentParam)
			$answer:=$default
		Else 
			$answer:=$input
		End if 
	Else 
		$answer:=$default
	End if 
	This:C1470.currentParam:=This:C1470.currentParam+1
	
Function assertMax
	ASSERT:C1129(This:C1470.currentParam<=This:C1470.countParams)