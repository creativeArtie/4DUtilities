Class constructor($name : Text; $category : Text)
	This:C1470.name:=$name
	This:C1470.category:=$category
	This:C1470.test:=New collection:C1472
	This:C1470.subCategory:=""
	
Function test($testerParam : 4D:C1709.Function; $inputParam : Collection; $expectedParam)
	
	var $assert : Object
	$assert:=wk_assertParameterSetup(Count parameters:C259)
	
	var $tester : 4D:C1709.Function
	If (wk_assertLocalParameter($assert; ->$tester))
		$tester:=$testerParam
	End if 
	
	var $input : Collection
	If (wk_assertLocalParameter($assert; ->$input))
		$input:=$inputParam
	End if 
	
	var $expected
	If (wk_assertLocalParameter($assert; ->$expected; True:C214))
		$expected:=$expectedParam
	End if 
	
	wk_assertParameterCount($assert)
	var $result
	$result:=$tester.apply(Null:C1517; $input)
	
	var $resultType; $expectedType : Integer
	$resultType:=Value type:C1509($result)
	$expectedType:=Value type:C1509($expected)
	var $error : Text
	If ($resultType#$expectedType)
		$error:="Value types are different."
	End if 
	
	If ($error#"")
		Case of 
			: ($resultType=Is object:K8:27)
			: ($resultType=Is collection:K8:32)
			Else 
				If ($result#$expected)
					$error:="Test failed."
				End if 
		End case 
	End if 
	
	var $report : Object
	$report:=New object:C1471("source"; $tester.source; \
		"category"; This:C1470.category\
		)
	