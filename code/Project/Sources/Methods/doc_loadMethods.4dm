//%attributes = {}
var $folders : Text

$folders:=Get 4D folder:C485(Database folder:K5:14)+"Project\\Sources\\"

ARRAY TEXT:C222($rawArr; 0)
C_COLLECTION:C1488($methodPaths)
$methodPaths:=New collection:C1472

DOCUMENT LIST:C474($folders+"Methods"; $rawArr)
ARRAY TO COLLECTION:C1563($methodPaths; $rawArr)
var $methods : Collection

$methods:=doc_listChildren($methodPaths)
