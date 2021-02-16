//%attributes = {}
#DECLARE($exception : cs:C1710.Exception)
$exception:=utils_setParam($1; cs:C1710.Exception)
utils_countParams(1; Count parameters:C259)

var $collection : Collection
$collection:=except_getExceptions
Use ($collection)
	$shared:=OB Copy:C1225($exception; ck shared:K85:29; $collection)
	$collection.push($shared)
End use 

var $entity : cs:C1710.ExceptionsEntity
$entity:=ds:C1482.Exceptions.new()
$entity.fromObject($exception)
$entity.save()