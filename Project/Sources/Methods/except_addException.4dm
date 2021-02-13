//%attributes = {}
C_OBJECT:C1216($exception; $1; $entity)

$exception:=utils_setParam($1; cs:C1710.Exception)
utils_countParams(1; Count parameters:C259)

C_COLLECTION:C1488($collection)
$collection:=except_getExceptions
Use ($collection)
	$shared:=OB Copy:C1225($exception; ck shared:K85:29; $collection)
	$collection.push($shared)
End use 

$entity:=ds:C1482.Exceptions.new()
$entity.fromObject($exception)
$entity.save()
