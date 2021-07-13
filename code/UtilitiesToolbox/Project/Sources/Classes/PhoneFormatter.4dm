Class extends Formatter
Class constructor($countryCode : Text)
	Super:C1705("phone")
	
	This:C1470.countryCode:=$countryCode
	
Function extract($input : Text)->$answer : Text
	var $input : Text
	$answer:=""
	// Couldn't use String(Num($token)) because the phone number can get too long
	var $elmt : Integer
	For ($elmt; 1; Length:C16($input))
		If (Match regex:C1019("[0-9]"; Substring:C12($input; $elmt; 1)))
			$answer:=$answer+Substring:C12($input; $elmt; 1)
		End if 
	End for 
	
Function update($token : Text)
	If ($token#"")
		This:C1470.findMatch:=False:C215
		var $search : Text
		This:C1470.formatted:=$token
		This:C1470.value:=$token
		$search:=""
		var $phoneFormats : 4D:C1709.DataClass
		EXECUTE METHOD:C1007(<>TABLE_LOADER; $phoneFormats; "PhoneFormats")
		If (This:C1470.countryCode#"")
			$search:="(countryCode='"+This:C1470.countryCode+"') OR "
		End if 
		
		If (Length:C16($token)>=1)
			$search:=$search+"(callingCode='"+Substring:C12($token; 1; 1)+"')"
		End if 
		
		If (Length:C16($token)>=2)
			$search:=$search+" OR (callingCode='"+Substring:C12($token; 1; 2)+"')"
		End if 
		
		If (Length:C16($token)>=3)
			$search:=$search+" OR (callingCode='"+Substring:C12($token; 1; 3)+"')"
		End if 
		var $selection : 4D:C1709.EntitySelection
		$selection:=$phoneFormats.query($search)
		
		$selection:=$selection.orderByFormula(\
			Formula:C1597(orderPhoneFormats(This:C1470.countryCode))\
			)
		
		var $copy : Text
		var $i : Integer
		var $entity : 4D:C1709.Entity
		$copy:=$token
		While ($i#$selection.length)
			var $trying : Boolean
			$trying:=True:C214
			$entity:=$selection[$i]
			If (Match regex:C1019($entity.matchFormat; $copy))
				This:C1470.formatted:=String:C10(Num:C11($copy); $entity.outputFormat)
				This:C1470.findMatch:=True:C214
				$trying:=False:C215
				$i:=$selection.length
			End if 
			
			If ($trying & (This:C1470.countryCode=$entity.countryCode))
				If (Match regex:C1019($entity.matchFormat; $entity.callingCode+$copy))
					This:C1470.formatted:=String:C10(Num:C11($entity.callingCode+$copy); $entity.outputFormat)
					This:C1470.findMatch:=True:C214
					$trying:=False:C215
					$i:=$selection.length
				End if 
			End if 
			
			If ($trying & ($entity.trunkCode="") & \
				($entity.trunkCode#$entity.callingCode))
				If (Match regex:C1019($entity.trunkCode+".*"; $copy))
					$copy:=Substring:C12($copy; Length:C16($entity.trunkCode))
					$trying:=False:C215
				End if 
			End if 
			
			If ($trying)
				$i:=$i+1
				$copy:=$token
			End if 
		End while 
	Else 
		This:C1470.findMatch:=False:C215
		This:C1470.formatted:=""
		This:C1470.value:=""
	End if 