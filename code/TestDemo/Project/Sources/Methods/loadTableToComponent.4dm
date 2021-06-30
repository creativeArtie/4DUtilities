//%attributes = {"shared":true}
#DECLARE($table : Text)->$tableEntity : 4D:C1709.DataClass

Case of 
	: ($table="Exceptions")
		$tableEntity:=ds:C1482.Exceptions
		//: ($table="PhoneFormats")
		//$tableEntity:=ds.Exceptions
End case 