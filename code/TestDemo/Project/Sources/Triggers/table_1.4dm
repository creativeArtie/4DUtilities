//  Trigger for [anyTable]
C_LONGINT:C283($0)
$0:=0  // Assume the database request will be granted
Case of 
	: (Trigger event:C369=On Saving New Record Event:K3:1)
		// Perform appropriate actions for the saving of a newly created record
	: (Trigger event:C369=On Saving Existing Record Event:K3:2)
		// Perform appropriate actions for the saving of an already existing record
	: (Trigger event:C369=On Deleting Record Event:K3:3)
		// Perform appropriate actions for the deletion of a record
End case 