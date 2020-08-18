//%attributes = {}
//consoleLog( function with parameters, Result, Status Message)

var $1,$3,$textResult,$function,$statusMessage : Text
var $2 : Real
var $logMessage : Object

$function:=$1
$textResult:=String:C10($2)
$statusMessage:=$3

$logMessage:=ds:C1482.MathLog.new()

$logMessage.date:=Current date:C33
$logMessage.time:=Current time:C178
$logMessage.function:=$function
$logMessage.result:=$textResult
$logMessage.message:=$statusMessage

$logMessage.save()