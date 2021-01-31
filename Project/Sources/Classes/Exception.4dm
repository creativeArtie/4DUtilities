Class extends Loggable
Class constructor
	var $1 : Text
	var $2 : Object
	var $3 : cs:C1710.Loggable
	Case of 
		: (Count parameters:C259=2)
			Super:C1705($1;$2)
		: (Count parameters:C259=3)
			Super:C1705($1;$2;$3)
		Else 
			utils_countParams(3;Count parameters:C259)
	End case 