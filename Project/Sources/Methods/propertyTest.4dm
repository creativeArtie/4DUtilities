//%attributes = {}
var $doa : cs:C1710.DataAccess
var $data : cs:C1710.TransferObject
$doa:=cs:C1710.DataAccess.new()
$data:=$doa.createObject("tester")

var $value : Variant
$data.addProperty("val_bool";Is boolean:K8:9;True:C214)
$value:=$data.getPropertyValue("val_bool")
ASSERT:C1129(Value type:C1509($value)=Is boolean:K8:9)

$data.addProperty("val_date";Is date:K8:7;!12-12-12!)
$value:=$data.getPropertyValue("val_date")
ASSERT:C1129(Value type:C1509($value)=Is date:K8:7)

$data.addProperty("val_time";Is time:K8:8;?12:43:22?)
$value:=$data.getPropertyValue("val_time")
ASSERT:C1129(Value type:C1509($value)=Is time:K8:8)

$data.addProperty("val_real";Is real:K8:4;123.23)
$value:=$data.getPropertyValue("val_real")
ASSERT:C1129(Value type:C1509($value)=Is real:K8:4)

$data.addProperty("val_text";Is text:K8:3;"Hello World!")
$value:=$data.getPropertyValue("val_text")
ASSERT:C1129(Value type:C1509($value)=Is text:K8:3)