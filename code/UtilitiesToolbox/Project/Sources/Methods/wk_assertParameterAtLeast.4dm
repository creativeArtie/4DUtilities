//%attributes = {}
#DECLARE($counter : Object; $atLeast : Integer)
ASSERT:C1129(Count parameters:C259=2)

ASSERT:C1129($counter.total>=$atLeast; getMethodCallerText+\
"Too few parameters, at least: "+String:C10($counter.count)+\
" currently:"+String:C10($counter.total))