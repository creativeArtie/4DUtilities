//%attributes = {}
var $doa : cs:C1710.DataAccess
var $obj : cs:C1710.TransferObject

$doa:=cs:C1710.DataAccess.new()
$obj:=$doa.getObject("info";1)

ALERT:C41($obj.getPropertyValue("Message"))

$doa.deleteObject($obj)