//%attributes = {}
//consoleLog( function with parameters, Result, Status Message)
import coll
var $1,$2,$textResult,$function,$statusMessage : Text
var $3 : Real
var $logMessage : Object



$function:=$1
$textResult:=String:C10($3)
$statusMessage:=$2

$logMessage:=New object:C1471
$logMessage.date:=Current date:C33
$logMessage.time:=Current time:C178
$logMessage.function:=$function
$logMessage.result:=$textResult
$logMessage.message:=$statusMessage
coll.push($logMessage)