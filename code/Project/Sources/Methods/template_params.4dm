//%attributes = {}
var $text1 : Text
var $text2 : Text
var $int1 : Integer
var $basic : Object
var $use : Object

// required
$text1:=utils_getRequireValue($1; Is text:K8:3)
$int1:=utils_getRequireValue($2; Is integer:K8:5)
$use:=utils_getRequireValue($3; cs:C1710.Use)

// optional
$basic:=utils_getOptionValue($4; New object:C1471("prop"; "value"); Is object:K8:27)
$text2:=utils_getOptionValue($5; "Default Text"; Is text:K8:3)

utils_countParams(5; Count parameters:C259)  // max parameters
