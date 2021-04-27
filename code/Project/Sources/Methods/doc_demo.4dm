//%attributes = {}
//! #brief test demo
//! This demoes every documtation options available to a method
//! #author Wai-Kin

#DECLARE($text : Text; $more : Real)
var $1 : Text  //! param data
var $more : Real  //! add more
var $3 : Object  //! more params
var ${4} : Integer  //! list input

//! 1. Numberered Item 1
//! 2. Numberered Item 2

//! #todo Use this method to demo documentations.

// Check point to use: $name:="doc_demo"

var $number : Integer  //! *fun* number
var $variant

var $count : Real
$text:=utils_assertParameter($1; ->$count; Count parameters:C259; "Default")
$2:=utils_assertParameter($more; ->$count; Count parameters:C259; 23)
