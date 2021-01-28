//%attributes = {}
$fristName:=utils_setParam($1;Is text:K8:3)
$lastName:=utils_setParam($2;Is text:K8:3)
$isCompany:=utils_setParam($3;Is boolean:K8:9;False:C215)
$address:=utils_setParam($4;Is text:K8:3;"")
$use:=utils_setParam($5;cs:C1710.Use;cs:C1710.UseValue.new(23))
utils_countParams(5;Count parameters:C259)

C_TEXT:C284($1;$2;$fristName;$lastName)
C_BOOLEAN:C305($3;$isCompany)
C_TEXT:C284($4;$address)
C_OBJECT:C1216($5;$use)