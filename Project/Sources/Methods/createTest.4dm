//%attributes = {}
var $test : cs:C1710.TransferObject
var $dao : cs:C1710.DataAccess
var $obj : cs:C1710.TransferObject

$dao:=cs:C1710.DataAccess.new()
$obj:=$dao.createObject("info")
$obj.addProperty("boolean";Is boolean:K8:9)
$obj.addProperty("Hello";Is real:K8:4;232)
$obj.addProperty("message";Is text:K8:3)
//$test.addProperty(213;Is boolean)
//$test.addProperty("failed";"abc")
$dao.saveObject($obj)