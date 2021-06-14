//%attributes = {}
#DECLARE($exception : Object; $toShared : Boolean; $toDatabase : Boolean)
ASSERT:C1129(Count parameters:C259=3)

If ($toShared)
	var $collection : Collection
	var $shared : Object
	$collection:=error_listUncaught
	Use ($collection)
		$shared:=OB Copy:C1225($exception; ck shared:K85:29; $collection)
		$collection.push($shared)
	End use 
End if 

If ($toDatabase)
	var $exceptions : 4D:C1709.DataClass
	EXECUTE METHOD:C1007(<>TABLE_LOADER; $exceptions; "Exceptions")
	var $entity : 4D:C1709.Entity
	$entity:=$exceptions.new()
	$entity.fromObject($exception)
	$entity.save()
End if 