//%attributes = {"shared":true}
#DECLARE($counter : Object)
ASSERT:C1129(Count parameters:C259=1)

ASSERT:C1129($counter.count>=$counter.total; getMethodCallerText+"Too many parameters.")
