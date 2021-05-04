//%attributes = {"shared":true}
//! #brief traps error as exceptions
//! #author Wai-Kin Chau
//! it is the same as `ON ERR CALL("except_onErrCall_")`

#DECLARE->$exception : cs:C1710.Exception
utils_assertParameterCount(0; Count parameters:C259)

ON ERR CALL:C155("except_onErrCall_")