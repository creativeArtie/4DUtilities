Class extends Formatter
Class constructor()
	Super:C1705("email")
	
Function extract($input : Text)->$answer : Text
	$answer:=$input
	
Function update($token : Text)
	If ($token#"")
		This:C1470.findMatch:=Match regex:C1019(\
			"^[A-Za-z0-9._%+\\-]+@[A-Za-z0-9.\\-]+\\.[A-Za-z][A-Za-z]+$"; $token)
		var $search : Text
		This:C1470.formatted:=$token
		This:C1470.value:=$token
	Else 
		This:C1470.findMatch:=False:C215
		This:C1470.formatted:=""
		This:C1470.value:=""
	End if 