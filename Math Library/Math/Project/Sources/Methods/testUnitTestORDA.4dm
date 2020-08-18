//%attributes = {}
import Math

var $unitTest,$currentTest,$testMax,$testMin,Math : Object

$unitTest:=ds:C1482.UnitTest.new()

$unitTest.time:=Current time:C178
$unitTest.date:=Current date:C33
$unitTest.save()


$testMax:=ds:C1482.UnitTestResults.new()
$testMax.testID:=$unitTest.ID
$testMax.result:=Math.max(9;3)
$testMax.functionCalled:="Math.max(9;3)"
$testMax.expectedResult:=9
$testMax.testPassed:=($testMax.result=$testMax.expectedResult)
$testMax.save()



$testMin:=ds:C1482.UnitTestResults.new()
$testMin.testID:=$unitTest.ID
$testMin.result:=Math.min(5;1)
$testMin.functionCalled:="Math.min(5;1)"
$testMin.expectedResult:=1
$testMin.testPassed:=($testMin.result=$testMin.expectedResult)
$testMin.save()
