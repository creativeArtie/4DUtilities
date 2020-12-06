//%attributes = {}


C_TEXT:C284($1;$2;$fristName;$lastName)
C_BOOLEAN:C305($3;$isCompany)
C_TEXT:C284($4;$address)

$isCompany:=False:C215
$address:=""
Case of 
	: (Count parameters:C259=2)
		$fristName:=$1
		$lastName:=$2
	: (Count parameters:C259=3)
		$fristName:=$1
		$lastName:=$2
		$isCompany:=$3
	: (Count parameters:C259=4)
		$fristName:=$1
		$lastName:=$2
		$isCompany:=$3
		$address:=$4
	Else 
		ASSERT:C1129(False:C215;"Method utils_param1 needs 2 to 4 parameters")
End case 
