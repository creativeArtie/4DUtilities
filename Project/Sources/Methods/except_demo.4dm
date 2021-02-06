//%attributes = {}
C_OBJECT:C1216($signal)
$signal:=New signal:C1641("Except Demo")

CALL WORKER:C1389("Exception Demo";"except_runTest";$signal)

While ($signal.wait())
End while 
TRACE:C157

except_listAllExceptions