Class constructor
	
	//STATUS MESSAGES
	This:C1470.success:="Success"
	This:C1470.invalidInput:="Error: Invalid Input"
	This:C1470.divideByZero:="Error: Cannot divide by zero"
	This:C1470.ParametersMissing:="Error: Missing at least one parameter"
	
	//CONSTANTS
	//---------
	This:C1470.E:=e number:K30:4
	This:C1470.PI:=Pi:K30:1
	
	
	
Function sum
	var $0,$1,$sum : Real
	C_REAL:C285({$2})
	var $numParameters,$i : Integer
	$numParameters:=Count parameters:C259
	$sum:=0
	Case of 
		: ($numParameters>1)
			For ($i;1;$numParameters)
				$sum:=$sum+${$i}
			End for 
		Else 
			ALERT:C41(This:C1470.invalidInput)
	End case 
	$0:=$sum
	
	
Function average
	var $0,$1,$sum,$average : Real
	C_REAL:C285({$2})
	var $statusMessage : Text
	var $numParameters,$i : Integer
	$numParameters:=Count parameters:C259
	$sum:=0
	Case of 
		: ($numParameters>0)
			For ($i;1;$numParameters)
				$sum:=$sum+${$i}
			End for 
		Else 
			$statusMessage:=This:C1470.$statusMessage
	End case 
	$average:=$sum/$numParameters
	$0:=$average
	
Function min
	var $0,$1,$result : Real
	var $numParameters,$i : Integer
	C_REAL:C285({$2})
	var $collection : Collection
	var $textParameters,$statusMessage : Text
	
	$collection:=New collection:C1472
	$numParameters:=Count parameters:C259
	Case of 
		: ($numParameters>0)
			For ($i;1;$numParameters)
				$collection.push(${$i})
				$textParameters:=$textParameters+String:C10(${$i})
				If ($i#$numParameters)
					$textParameters:=$textParameters+";"
				End if 
			End for 
		Else 
			$statusMessage:=This:C1470.ParametersMissing
	End case 
	$result:=$collection.min()
	$0:=$result
	
Function sqrt
	C_REAL:C285($1;$0)
	$0:=Square root:C539($1)
	
Function cbrt
	SET REAL COMPARISON LEVEL:C623(10^-20)
	var $0,$1,$num,$result : Real
	$num:=$1
	
	$result:=$num^(1/3)
	$0:=$result
	
	
Function hypot
	var $1,$2,$0 : Real
	$0:=Square root:C539(($1^2)+($2^2))
	
Function pow
	C_REAL:C285($1;$2;$0)
	$0:=($1)^($2)
	
Function round
	var $0,$1,$result : Real
	var $2 : Integer
	
	Case of 
		: (Count parameters:C259=1)
			$result:=Round:C94($1;0)
		: (Count parameters:C259=2)
			$result:=Round:C94($1;$2)
	End case 
	
	$0:=$result
	
	
Function abs
	var $0,$1,$result,$num : Real
	$num:=$1
	$result:=Abs:C99($num)
	$0:=$result
	
	
Function ceil
	SET REAL COMPARISON LEVEL:C623(10^-20)
	var $1,$num,$difference : Real
	var $result,$0 : Integer
	$num:=$1
	$difference:=Dec:C9($num)
	
	Case of 
		: ($difference=0)
			$result:=$num
		Else 
			$result:=($num\1)+1
	End case 
	
	$0:=$result
	
	//Returns the largest integer less than or equal to x
Function floor
	var $0,$result : Integer
	var $1,$num : Real
	
	$num:=$1
	$result:=Trunc:C95($1;0)
	$0:=$result
	
	
Function cos
	var $0,$1,$result,$radian,$degree : Real
	var $2,$isRadian : Boolean
	
	$isRadian:=$2
	
	Case of 
		: ((Count parameters:C259=1) | ($isRadian))
			$radian:=$1
			$result:=Cos:C18($radian)
		: (Not:C34($isRadian))
			$degree:=$1
			$radian:=This:C1470.toRadian($degree)
			$result:=Cos:C18($radian)
	End case 
	
	$0:=This:C1470.round($result;8)
	
	
Function tan
	var $0,$1,$result,$radian,$degree : Real
	var $2,$isRadian : Boolean
	
	$isRadian:=$2
	
	Case of 
		: ((Count parameters:C259=1) | ($isRadian))
			$radian:=$1
			$result:=Tan:C19($radian)
		: (Not:C34($isRadian))
			$degree:=$1
			$radian:=This:C1470.toRadian($degree)
			$result:=Tan:C19($radian)
	End case 
	
	$0:=This:C1470.round($result;8)
	
	
	
Function sin
	SET REAL COMPARISON LEVEL:C623(10^-200)
	var $0,$1,$result,$radian,$degree : Real
	var $2,$isRadian : Boolean
	
	$isRadian:=$2
	
	Case of 
		: ((Count parameters:C259=1) | ($isRadian))
			$radian:=$1
			$result:=Sin:C17($radian)
		: (Not:C34($isRadian))
			$degree:=$1
			$radian:=This:C1470.toRadian($degree)
			$result:=Sin:C17($radian)
	End case 
	
	$0:=This:C1470.round($result;8)
	
Function exp
	SET REAL COMPARISON LEVEL:C623(10^-20)
	var $0,$1 : Real
	$0:=Exp:C21($1)
	
Function log
	SET REAL COMPARISON LEVEL:C623(10^-20)
	var $0,$1 : Real
	$0:=Log:C22($1)
	
Function random
	var $0,$1,$2,$random,$vStart,$vEnd : Real
	
	Case of 
		: (Count parameters:C259=0)
			$random:=(Random:C100%(32767))/32767
			
		: (Count parameters:C259=1)
			$vStart:=0
			$vEnd:=$1
			$random:=(Random:C100%($vEnd-$vStart+1))+$vStart
			
		: (Count parameters:C259=2)
			$vStart:=$1
			$vEnd:=$2
			$random:=(Random:C100%($vEnd-$vStart+1))+$vStart
	End case 
	$0:=$random
	
	
Function print
	var $1 : Real
	ALERT:C41(String:C10($1))
	
Function toString
	var $1 : Real
	var $0 : Text
	$0:=String:C10($1)
	
Function int
	var $1 : Real
	var $0 : Integer
	$0:=Int:C8($1)
	
Function toRadians
	var $0,$1,$radian,$degree : Real
	$degree:=$1
	$radian:=$degree/Radian:K30:3
	$0:=$radian
	
Function toDegrees
	var $0,$1,$radian,$degree : Real
	$radian:=$1
	$degree:=$radian/Degree:K30:2
	$0:=$degree
	
Function sign
	var $1,$0,$num,$sign : Real
	$num:=$1
	Case of 
		: ($num=0)
			$sign:=0
		: ($num>0)
			$sign:=1
		: ($num<0)
			$sign:=-1
	End case 
	$0:=$sign
	
	
	//copysign(x, y) Returns x with the sign of y
Function copySign
	var $0,$1,$2,$result,$num1,$num2 : Real
	$num1:=$1
	$num2:=$2
	
	Case of 
		: (($num1<0) & ($num2<0))
			$result:=$num1
		: (($num1>=0) & ($num2<0))
			$result:=$num1*-1
		: (($num1>=0) & ($num2>=0))
			$result:=$num1
		: (($num1<0) & ($num2>=0))
			$result:=$num1*-1
	End case 
	
	$0:=$result
	
	
	
	
Function max
	var $1,$0,$result : Real
	C_REAL:C285({$2})
	var $numParameters,$i : Integer
	var $collection : Collection
	var $statusMessage,$function,$textParameters : Text
	$collection:=New collection:C1472
	$numParameters:=Count parameters:C259
	Case of 
		: ($numParameters>0)
			For ($i;1;$numParameters)
				$collection.push(${$i})
				$textParameters:=$textParameters+String:C10(${$i})
				If ($i#$numParameters)
					$textParameters:=$textParameters+";"
				End if 
			End for 
			$statusMessage:=This:C1470.success
			$function:=This:C1470.functionToText("max";$textParameters)
		Else 
			$statusMessage:=This:C1470.ParametersMissing
			$function:=This:C1470.functionToText("max";String:C10($1))
	End case 
	$result:=$collection.max()
	This:C1470.consoleLog($function;$statusMessage;$result)
	$0:=$result
	
	
Function factorial
	C_LONGINT:C283($0;$1;$result;$num)
	var $statusMessage,$function : Text
	$num:=$1
	$result:=0
	
	Case of 
		: ($num<0)
			$statusMessage:=This:C1470.invalidInput
			$result:=-1
		Else 
			$result:=1
			While ($num>1)
				$result:=$result*$num
				$num:=$num-1
			End while 
			$statusMessage:=This:C1470.success
	End case 
	$function:=This:C1470.functionToText("factorial";String:C10($1))
	This:C1470.consoleLog($function;$statusMessage;$result)
	$0:=$result
	
Function factorialObject
	C_LONGINT:C283($1;$num)
	C_OBJECT:C1216($0;$result)
	$num:=$1
	$result:=New object:C1471
	$result.value:=0
	
	Case of 
		: ($num<0)
			$statusMessage:=This:C1470.invalidInput
			$result.value:=-1
		Else 
			$result.value:=1
			While ($num>1)
				$result.value:=$result.value*$num
				$num:=$num-1
			End while 
			$result.statusMessage:=This:C1470.success
	End case 
	$0:=$result
	
	
Function factorialMemConsole
	C_LONGINT:C283($0;$1;$result;$num)
	var $statusMessage,$function : Text
	$num:=$1
	$result:=0
	
	Case of 
		: ($num<0)
			$statusMessage:=This:C1470.invalidInput
			$result:=-1
		Else 
			$result:=1
			While ($num>1)
				$result:=$result*$num
				$num:=$num-1
			End while 
			$statusMessage:=This:C1470.success
	End case 
	$function:=This:C1470.functionToText("factorial";String:C10($1))
	consoleLog($function;$statusMessage;$result)
	$0:=$result
	
	
	// HELPER FUNCTIONS
Function consoleLog
	//consoleLog( function with parameters, Result, Status Message)
	
	var $1,$2,$textResult,$function,$statusMessage : Text
	var $3 : Real
	var $logMessage : Object
	
	$function:=$1
	$textResult:=String:C10($3)
	$statusMessage:=$2
	
	$logMessage:=ds:C1482.MathLog.new()
	$logMessage.date:=Current date:C33
	$logMessage.time:=Current time:C178
	$logMessage.function:=$function
	$logMessage.result:=$textResult
	$logMessage.message:=$statusMessage
	$logMessage.save()
	
Function functionToText
	//functionToText($funcName; $param1; $param2; $param3)
	
	var $1,$0,$result,$funcName,$param1,$param2,$param3 : Text
	var $2,$3,$4 : Text
	$funcName:=$1
	$param1:=String:C10($2)
	$param2:=String:C10($3)
	$param3:=String:C10($4)
	
	Case of 
		: (Count parameters:C259=1)
			$result:=$funcName+"()"
		: (Count parameters:C259=2)
			$result:=$funcName+"("+$param1+")"
		: (Count parameters:C259=3)
			$result:=$funcName+"("+$param1+";"+$param2+")"
		: (Count parameters:C259=4)
			$result:=$funcName+"("+$param1+";"+$param2+";"+$param3+")"
	End case 
	$0:=$result
	
	
	
	// ASSERT Library https://www.tutorialspoint.com/junit/junit_using_assertion.htm
	