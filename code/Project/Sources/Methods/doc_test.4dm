//%attributes = {}
$MyTextVar:="This is a test"
ON ERR CALL:C155("IO ERROR HANDLER")
$vhDocRef:=Create document:C266("")
// Store document with the ".txt" extension
// In this case, the .txt extension is always added to the name; it is not possible to change it
If (OK=1)  // If document has been created successfully
	CLOSE DOCUMENT:C267($vhDocRef)  //Closes the document
	TEXT TO DOCUMENT:C1237(Document; $MyTextVar; "ASCII")
	// We write the document
Else 
	// Error management
End if 