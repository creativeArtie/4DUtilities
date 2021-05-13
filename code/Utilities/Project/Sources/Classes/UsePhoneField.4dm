Class extends UseField
Class constructor($name : Text; $countryCode : Text)
	var $count : Real
	Super:C1705(utils_assertParameter($1; ->$count; Count parameters:C259))
	$countryCode:=utils_assertParameter($2; ->$count; Count parameters:C259; "")
	utils_assertParameterCount($count; Count parameters:C259)
	This:C1470.digits:=""
	This:C1470.countryCode:=Uppercase:C13($countryCode)
	This:C1470.text:=""
	This:C1470.findMatch:=False:C215
	
Function getValue->$value : Object
	$value:=New object:C1471(\
		"value"; This:C1470.digits; \
		"findMatch"; This:C1470.findMatch)
	
Function extractDigits->$answer : Text
	var $input : Text
	$answer:=""
	$input:=Super:C1706.getValue()
	// Couldn't use String(Num($token)) because the phone number can get too long
	var $elmt : Integer
	For ($elmt; 1; Length:C16($input))
		If (Match regex:C1019("[0-9]"; Substring:C12($input; $elmt; 1)))
			$answer:=$answer+Substring:C12($input; $elmt; 1)
		End if 
	End for 
	
Function handleEvents
	If (Form event code:C388=On Data Change:K2:15)
		This:C1470.digits:=This:C1470.extractDigits()
		If (This:C1470.digits#"")
			This:C1470.text:=This:C1470.formatPhone(This:C1470.digits)
			(This:C1470.pointer)->:=This:C1470.text
		End if 
	End if 
	
Function formatPhone($token : Text)->$answer : Text
	This:C1470.findMatch:=False:C215
	var $search : Text
	$answer:=$token
	$search:=""
	READ ONLY:C145([PhoneFormats:1])
	If (This:C1470.countryCode#"")
		$search:="(CountryCode='"+This:C1470.countryCode+"') OR "
	End if 
	
	If (Length:C16($token)>=1)
		$search:=$search+"(CallingCode='"+Substring:C12($token; 1; 1)+"')"
	End if 
	
	If (Length:C16($token)>=2)
		$search:=$search+" OR (CallingCode='"+Substring:C12($token; 1; 2)+"')"
	End if 
	
	If (Length:C16($token)>=3)
		$search:=$search+" OR (CallingCode='"+Substring:C12($token; 1; 3)+"')"
	End if 
	
	QUERY BY SQL:C942([PhoneFormats:1]; $search)
	
	If (This:C1470.countryCode#"")
		If (Match regex:C1019("[a-zA-Z]{2}"; This:C1470.countryCode))
			ORDER BY FORMULA:C300([PhoneFormats:1]; [PhoneFormats:1]countryCode:3=This:C1470.countryCode; >; [PhoneFormats:1]formatOrder:2; >)
		Else 
			ORDER BY FORMULA:C300([PhoneFormats:1]; [PhoneFormats:1]callingCode:4=This:C1470.countryCode; >; [PhoneFormats:1]formatOrder:2; >)
		End if 
	Else 
		ORDER BY:C49([PhoneFormats:1]formatOrder:2; >)
	End if 
	
	var $copy : Text
	FIRST RECORD:C50([PhoneFormats:1])
	$copy:=$token
	While (Not:C34(End selection:C36([PhoneFormats:1])))
		var $trying : Boolean
		$trying:=True:C214
		
		// assumes phone number include international format
		If (Match regex:C1019([PhoneFormats:1]matchFormat:6; $copy))
			$answer:=String:C10(Num:C11($copy); [PhoneFormats:1]outputFormat:7)
			This:C1470.findMatch:=True:C214
			$trying:=False:C215
			LAST RECORD:C200([PhoneFormats:1])
			NEXT RECORD:C51([PhoneFormats:1])
		End if 
		
		// assumes the phone number has no calling code
		If ($trying & (This:C1470.countryCode=[PhoneFormats:1]countryCode:3))
			If (Match regex:C1019([PhoneFormats:1]matchFormat:6; [PhoneFormats:1]callingCode:4+$copy))
				$answer:=String:C10(Num:C11([PhoneFormats:1]callingCode:4+$copy); [PhoneFormats:1]outputFormat:7)
				This:C1470.findMatch:=True:C214
				LAST RECORD:C200([PhoneFormats:1])
				NEXT RECORD:C51([PhoneFormats:1])
				$trying:=False:C215
			End if 
		End if 
		
		// if the trunk code is not equal to the calling code, strip and retry
		If (([PhoneFormats:1]trunkCode:5="") & ([PhoneFormats:1]trunkCode:5#[PhoneFormats:1]callingCode:4))
			If (Match regex:C1019([PhoneFormats:1]trunkCode:5+".*"; $copy))
				$copy:=Substring:C12($copy; Length:C16([PhoneFormats:1]trunkCode:5))
				$trying:=False:C215
			End if 
		End if 
		
		If ($trying)
			NEXT RECORD:C51([PhoneFormats:1])
			$copy:=$token
		End if 
		
	End while 
	