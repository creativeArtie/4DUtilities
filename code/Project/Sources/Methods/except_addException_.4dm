//%attributes = {}
#DECLARE($exception : cs:C1710.Exception)
var $count : Integer
$exception:=utils_assertParameter($1; ->$count; Count parameters:C259)
utils_assertParameterCount($count; Count parameters:C259)

var $collection : Collection
var $shared : Object
$collection:=except_getExceptions_
Use ($collection)
	$shared:=OB Copy:C1225($exception; ck shared:K85:29; $collection)
	$collection.push($shared)
End use 

var $entity : cs:C1710.ExceptionsEntity
$entity:=ds:C1482.Exceptions.new()
$entity.fromObject($exception)
$entity.save()
