//%attributes = {"shared":true}
#DECLARE($inputParam : Object; $defaultParam : Object)->$result : Object

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

var $input : Object
If (wk_assertLocalParameter($assert; ->$input))
	$input:=$inputParam
End if 

var $default : Object
If (wk_assertLocalParameter($assert; ->$default))
	$default:=$defaultParam
	ASSERT:C1129($default#Null:C1517)
End if 

wk_assertParameterCount($assert)

$result:=New object:C1471

var $name : Text

For each ($name; OB Keys:C1719($default))
	var $isReplacing : Boolean
	
	$isReplacing:=OB Is defined:C1231($input; $name)
	If ($isReplacing)
		$isReplacing:=Value type:C1509($input[$name])=Value type:C1509($default[$name])
	End if 
	
	If ($isReplacing)
		var $runChild : Boolean
		$runChild:=Value type:C1509($default[$name])=Is object:K8:27
		
		If ($runChild)
			$runChild:=OB Class:C1730($default[$name])=4D:C1709.Object
		End if 
		
		If ($runChild)
			$runChild:=OB Keys:C1719($default[$name]).length>0
		End if 
		
		If ($runChild)
			$result[$name]:=wk_updateValueFromObject($input[$name]; $default[$name])
		Else 
			If (Value type:C1509($input[$name])=Is object:K8:27)
				$result[$name]:=OB Copy:C1225($input[$name])
			Else 
				$result[$name]:=$input[$name]
			End if 
		End if 
	Else   // $isReplacing=False
		$result[$name]:=$default[$name]
	End if 
End for each 