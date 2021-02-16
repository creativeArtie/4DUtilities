//%attributes = {}
var $text1 : Text
var $text2 : Text
var $int1 : Integer
var $basic : Object
var $use : Object

// required
$text1:=utils_setParam($1; Is text:K8:3)
$int1:=utils_setParam($2; Is integer:K8:5)
$use:=utils_setParam($3; cs:C1710.Use)

// optional
$basic:=utils_setParam($4; Is object:K8:27; New object:C1471("prop"; "value"))
$text2:=utils_setParam($5; Is text:K8:3; "Default Text")

utils_countParams(5; Count parameters:C259)  // max parameters
