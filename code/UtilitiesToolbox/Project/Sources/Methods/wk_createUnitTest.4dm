//%attributes = {}
#DECLARE($nameParam : Text; $categoryParam : Text)->$tester : cs:C1710.UnitTest

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)

// Check parameters with wk_localParam or wk_objectParam
var $name : Text
If (wk_assertLocalParameter($assert; ->$name))
	$name:=$nameParam
End if 

var $category : Text
If (wk_assertLocalParameter($assert; ->$category; ""))
	$category:=$categoryParam
End if 

wk_assertParameterCount($assert)


var $caller : Object
$caller:=getMethodCaller

var $unitTest : 4D:C1709.DataClass

EXECUTE METHOD:C1007(<>TABLE_LOADER; $unitTest; "UnitTest")
var $find : 4D:C1709.EntitySelection
$find:=$unitTest.query("methodName = $1"; $caller.name)

var $entity : 4D:C1709.Entity

If ($find.length=0)
	$entity:=$unitTest.new()
	$entity.testName:=$name
	$entity.category:=$category
	$entity.methodName:=$caller.name
	$entity.save()
Else 
	$entity:=$find.first()
	$entity.testName:=$name
	$entity.category:=$category
	$entity.save()
End if 

$tester:=cs:C1710.UnitTest.new($name; $category)