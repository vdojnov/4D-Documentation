Function sum
	C_COLLECTION($1;$coll)
	C_REAL($0;$sum)
	C_LONGINT($length;$i)
	$coll:=$1
	$length:=$coll.length
	$i:=0
	While ($i<$length)
		$sum:=$sum+$coll[$i]
		$i:=$i+1
	End while 
	
	$0:=$sum
	
Function average
	C_COLLECTION($1;$coll)
	C_REAL($0)
	C_LONGINT($length;$i)
	$coll:=$1
	$length:=$coll.length
	
	$0:=This.sum($coll)/$length
	
Function max
	C_REAL($0;$1;$2;$result;$num1;$num2)
	$num1:=$1
	$num2:=$2
	
	If ($num1>=$num2)
		$result:=$num1
	Else 
		$result:=$num2
	End if 
	
	$0:=$result
	
	
Function min
	C_REAL($0;$1;$2;$result;$num1;$num2)
	$num1:=$1
	$num2:=$2
	
	If ($num1<=$num2)
		$result:=$num1
	Else 
		$result:=$num2
	End if 
	
	$0:=$result
	
Function sqrt
	C_REAL($1)
	$0:=Square root($1)
	
Function hypot
	var $1,$2,$0 : Real
	$0:=Square root(($1^2)+($2^2))
	
Function pow
	C_REAL($1;$2)
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
	
	$0:=$result
	
	
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
	
	$0:=$result
	
	
	
Function sin
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
	
	$0:=$result
	
	
Function exp
	var $0,$1 : Real
	$0:=Exp($1)
	
Function log
	var $0,$1 : Real
	$0:=Log($1)
	
	
Function random
	var $0,$1,$2,$random,$vStart,$vEnd : Real
	
	Case of 
		: (Count parameters=0)
			$random:=(Random%(10000))/10000
			
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
	$num:=$1
	$result:=0
	
	Case of 
		: ($num<0)
			
		Else 
			If ($num<=1)
				$result:=1
			Else 
				$result:=$num*This.factorial($num-1)
			End if 
	End case 
	
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
	
	
	
	//-----------------------------------
	// CONSTANTS
Function pi
	$0:=Pi
	
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
	





	
	
	// TODO
	// --------
	//-log10
	//-copysign
	//-sign
	//-allow sum and average to take collections and numbers
	
	
	
	
	
	
	// ------------------------------------
	//NEEDS WORK
	
	// Use the Dec() function to solve
	
	
	
	
	
	
	
	
	
