//%attributes = {}
#DECLARE->$isComponent : Boolean
var $chain : Collection
var $first; $last : Object

$chain:=Get call chain:C1662
$last:=$chain[$chain.length-1]
$first:=$chain[0]

$isComponent:=$last.database#$first.database