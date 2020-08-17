Class constructor
	
	//STATUS MESSAGES
	This.success:="Success"
	This.invalidInput:="Error: Invalid Input"
	This.divideByZero:="Error: Cannot divide by zero"
	
	
	//CONSTANTS
	//---------
	This.E:=e number
	This.PI:=Pi
	
	
	
Function sum
	var $0,$1,$sum : Real
	C_real({$2})
	var $numParameters, $i : Integer
	$numParameters:=Count parameters
	$sum:=0
	Case of 
		: ($numParameters>1)
			For ($i;1;$numParameters)
				$sum:=$sum+${$i}
			End for 
		Else 
			ALERT(This.invalidInput)
	End case 
	$0:=$sum
	
	
Function average
	var $0,$1,$sum,$average : Real
	C_real({$2})
	var $numParameters, $i : Integer
	$numParameters:=Count parameters
	$sum:=0
	Case of 
		: ($numParameters>1)
			For ($i;1;$numParameters)
				$sum:=$sum+${$i}
			End for 
		Else 
			ALERT(This.invalidInput)
	End case 
	$average:=$sum/$numParameters
	$0:=$average
	
Function min
	var $0,$1,$result : Real
	var $numParameters, $i: Integer
	C_REAL({$2})
	var $collection : Collection
	var $textParameters : Text
	
	$collection:=New collection
	$numParameters:=Count parameters
	Case of 
		: ($numParameters>1)
			For ($i;1;$numParameters)
				$collection.push(${$i})
				$textParameters:=$textParameters+String(${$i})
				If ($i#$numParameters)
					$textParameters:=$textParameters+";"
				End if 
			End for 
		Else 
			ALERT(This.invalidInput)
	End case 
	$result:=$collection.min()
	$0:=$result
	
Function sqrt
	C_REAL($1;$0)
	$0:=Square root($1)
	
Function cbrt
	SET REAL COMPARISON LEVEL(10^-20)
	var $0,$1,$num,$result : Real
	$num:=$1
	
	$result:=$num^(1/3)
	$0:=$result
	
	
Function hypot
	var $1,$2,$0 : Real
	$0:=Square root(($1^2)+($2^2))
	
Function pow
	C_REAL($1;$2;$0)
	$0:=($1)^($2)
	
Function round
	var $0,$1,$2,$result : Real
	
	Case of 
		: (Count parameters=1)
			$result:=Round($1;0)
		: (Count parameters=2)
			$result:=Round($1;$2)
	End case 
	
	$0:=$result
	
	
Function abs
	var $0,$1,$result,$num : Real
	$num:=$1
	$result:=Abs($num)
	$0:=$result
	
	
Function ceil
	SET REAL COMPARISON LEVEL(10^-20)
	var $1,$num,$difference : Real
	var $result,$0 : Integer
	$num:=$1
	$difference:=Dec($num)
	
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
	$result:=Trunc($1;0)
	$0:=$result
	
	
Function cos
	var $0,$1,$result,$radian,$degree : Real
	var $2,$isRadian : Boolean
	
	$isRadian:=$2
	
	Case of 
		: ((Count parameters=1) | ($isRadian))
			$radian:=$1
			$result:=Cos($radian)
		: (Not($isRadian))
			$degree:=$1
			$radian:=This.toRadian($degree)
			$result:=Cos($radian)
	End case 
	
	$0:=this.round($result;8)
	
	
Function tan
	var $0,$1,$result,$radian,$degree : Real
	var $2,$isRadian : Boolean
	
	$isRadian:=$2
	
	Case of 
		: ((Count parameters=1) | ($isRadian))
			$radian:=$1
			$result:=Tan($radian)
		: (Not($isRadian))
			$degree:=$1
			$radian:=This.toRadian($degree)
			$result:=Tan($radian)
	End case 
	
	$0:=this.round($result;8)
	
	
	
Function sin
	SET REAL COMPARISON LEVEL(10^-200)
	var $0,$1,$result,$radian,$degree : Real
	var $2,$isRadian : Boolean
	
	$isRadian:=$2
	
	Case of 
		: ((Count parameters=1) | ($isRadian))
			$radian:=$1
			$result:=Sin($radian)
		: (Not($isRadian))
			$degree:=$1
			$radian:=This.toRadian($degree)
			$result:=Sin($radian)
	End case 
	
	$0:=this.round($result;8)
	
Function exp
	SET REAL COMPARISON LEVEL(10^-20)
	var $0,$1 : Real
	$0:=Exp($1)
	
Function log
	SET REAL COMPARISON LEVEL(10^-20)
	var $0,$1 : Real
	$0:=Log($1)
	
Function random
	var $0,$1,$2,$random,$vStart,$vEnd : Real
	
	Case of 
		: (Count parameters=0)
			$random:=(Random%(32767))/32767
			
		: (Count parameters=1)
			$vStart:=0
			$vEnd:=$1
			$random:=(Random%($vEnd-$vStart+1))+$vStart
			
		: (Count parameters=2)
			$vStart:=$1
			$vEnd:=$2
			$random:=(Random%($vEnd-$vStart+1))+$vStart
	End case 
	$0:=$random
	
Function factorial
	C_LONGINT($0;$1;$result;$num)
	var $statusMessage,$function : Text
	$num:=$1
	$result:=0
	
	Case of 
		: ($num<0)
			$statusMessage:=This.invalidInput
			$result:=-1
		Else 
			$result:=1
			While ($num>1)
				$result:=$result*$num
				$num:=$num-1
			End while 
			$statusMessage:=This.success
	End case 
	$function:=This.functionToText("factorial";string($1))
	This.consoleLog($function;$statusMessage;$result)
	$0:=$result
	
Function print
	var $1 : Real
	ALERT(String($1))
	
Function toString
	var $1 : Real
	var $0 : Text
	$0:=String($1)
	
Function int
	var $1 : Real
	var $0 : Integer
	$0:=Int($1)
	
Function toRadians
	var $0,$1,$radian,$degree : Real
	$degree:=$1
	$radian:=$degree/Radian
	$0:=$radian
	
Function toDegrees
	var $0,$1,$radian,$degree : Real
	$radian:=$1
	$degree:=$radian/Degree
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
	var $0,$1,$2,$result,$num1, $num2: Real
	$num1:=$1
	$num2:=$2
	
	Case of 
		: (($num1< 0) & ($num2 < 0))
			$result:=$num1
		: (($num1>=0) & ($num2<0))
			$result:=$num1*-1
		: (($num1>=0) & ($num2>=0))
			$result:=$num1
		: (($num1< 0) & ($num2>=0))
			$result:=$num1*-1
	End case
	
	$0:=$result
	
Function max
	var $1,$0,$result : Real
	c_real({$2})
	var $numParameters, $i :Integer
	var $collection : Collection
	var $statusMessage,$function,$textParameters : Text
	$collection:=New collection
	$numParameters:=Count parameters
	Case of 
		: ($numParameters>1)
			For ($i;1;$numParameters)
				$collection.push(${$i})
				$textParameters:=$textParameters+String(${$i})
				If ($i#$numParameters)
					$textParameters:=$textParameters+";"
				End if 
			End for 
			$statusMessage:=This.success
			$function:=This.functionToText("max";$textParameters)
		Else 
			$statusMessage:=This.invalidInput
			$function:=This.functionToText("max";string($1))
	End case 
	$result:=$collection.max()
	This.consoleLog($function;$statusMessage;$result)
	$0:=$result
	
	
	// HELPER FUNCTIONS
Function consoleLog
	//consoleLog( function with parameters, Result, Status Message)
	
	var $1,$2,$textResult,$function,$statusMessage : Text
	var $3 : Real
	var $logMessage : Object
	
	$function:=$1
	$textResult:=String($3)
	$statusMessage:=$2
	
	$logMessage:=ds.MathLog.new()
	
	$logMessage.date:=Current date
	$logMessage.time:=Current time
	$logMessage.function:=$function
	$logMessage.result:=$textResult
	$logMessage.message:=$statusMessage
	
	$logMessage.save()
	
Function functionToText
	//functionToText($funcName; $param1; $param2; $param3)
	
	var $1,$0,$result,$funcName,$param1,$param2,$param3 : Text
	var $2,$3,$4 : text
	$funcName:=$1
	$param1:=String($2)
	$param2:=String($3)
	$param3:=String($4)
	
	Case of 
		: (Count parameters=1)
			$result:=$funcName+"()"
		: (Count parameters=2)
			$result:=$funcName+"("+$param1+")"
		: (Count parameters=3)
			$result:=$funcName+"("+$param1+";"+$param2+")"
		: (Count parameters=4)
			$result:=$funcName+"("+$param1+";"+$param2+";"+$param3+")"
	End case 
	$0:=$result
	
	
	
	// ASSERT Library https://www.tutorialspoint.com/junit/junit_using_assertion.htm
