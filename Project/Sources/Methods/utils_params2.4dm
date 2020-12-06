//%attributes = {}


$fristName:=utils_setParam($1;Is text:K8:3)
$lastName:=utils_setParam($2;Is text:K8:3)
$isCompany:=utils_setParam($3;Is boolean:K8:9;False:C215)
$address:=utils_setParam($4;Is text:K8:3;"")
utils_countParams(4;Count parameters:C259)

C_TEXT:C284($1;$2;$fristName;$lastName)
C_BOOLEAN:C305($3;$isCompany)
C_TEXT:C284($4;$address)