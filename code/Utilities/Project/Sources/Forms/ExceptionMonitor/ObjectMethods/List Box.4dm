If (Form event code:C388=On Clicked:K2:4)
	If (OB Is defined:C1231(Form:C1466; "current"))
		If (Form:C1466.current#Null:C1517)
			METHOD OPEN PATH:C1213(Form:C1466.current.name; *)
		End if 
	End if 
End if 