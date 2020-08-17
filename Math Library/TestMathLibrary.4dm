//https://doc.4d.com/4Dv15/4D/15.6/Dec.301-3818404.en.html 
//var Math : cs.Math
//$math:=cs.Math.new()

import Math

var $result,$result1 : Real


//-----------------
// 5 Paremeters
$result:=Math.max(4;5;3;2;1)
ASSERT($result=5)
// 3 Parameters
$result:=Math.max(4;5;3)
ASSERT($result=5)
//-----------------
// 5 Paremeters
$result:=Math.min(4;5;3;2;1)
ASSERT($result=1)
// 3 Parameters
$result:=Math.min(4;5;3)
ASSERT($result=3)
//-----------------
// 5 Paremeters
$result:=Math.sum(4;5;3;2;1)
ASSERT($result=15)
// 3 Parameters
$result:=Math.sum(4;5;3)
ASSERT($result=12)
//-----------------
// 5 Paremeters
$result:=Math.average(4;5;3;2;1)
ASSERT($result=3)
// 3 Parameters
$result:=Math.average(4;5;3)
ASSERT($result=4)
//-----------------
$result:=Math.sqrt(4)
ASSERT($result=2)
$result:=Math.sqrt(16)
ASSERT($result=4)
//-----------------
$result:=Math.pow(2;2)
ASSERT($result=4)
$result:=Math.pow(2;3)
ASSERT($result=8)
//-----------------
//Round up
$result:=Math.round(4.536)
ASSERT($result=5)
//Round down
$result:=Math.round(4.436)
ASSERT($result=4)
// round to n number of decimals
$result:=Math.round(4.4536;3)
ASSERT($result=4.454)
//-----------------
$result:=Math.abs(-53.9)
ASSERT($result=53.9)
$result:=Math.abs(53.9)
ASSERT($result=53.9)
//-----------------
// works when decimals are bigger than 0.00000000001
$result:=Math.ceil(53.00000001)
ASSERT($result=54)
$result:=Math.ceil(53)
ASSERT($result=53)
//-----------------
// numver between 0 inclusive and 1 exclusive
$result:=Math.random()
ASSERT(($result>=0) & ($result<1))
  // Random number between 0 and N inclusive
$result:=Math.random(5)
ASSERT(($result<=5) & ($result>=0))
// Random number between $1 and $2 inclusive
$result:=Math.random(5;10)
ASSERT(($result<=10) & ($result>=5))
//-----------------
$result:=Math.factorial(5)
ASSERT($result=120)
$result:=Math.factorial(0)
ASSERT($result=1)
//-----------------
$result:=Math.cbrt(8)
ASSERT($result=2)
$result:=Math.cbrt(27)
ASSERT($result=3)
//-----------------
$result:=Math.hypot(3;4)
ASSERT($result=5)
$result:=Math.hypot(5;12)
ASSERT($result=13)
//-----------------
$result:=Math.sign(4)
ASSERT($result=1)
$result:=Math.sign(-4)
ASSERT($result=-1)
$result:=Math.sign(0)
ASSERT($result=0)
//-----------------
$result:=Math.copySign(4;1)
ASSERT($result=4)
$result:=Math.copySign(4;-1)
ASSERT($result=-4)
$result:=Math.copySign(4;0)
ASSERT($result=4)
$result:=Math.copySign(-4;0)
ASSERT($result=4)
//-----------------
$result:=Math.exp(1)
ASSERT($result=Math.E)
$result:=Math.exp(5)
ASSERT(Math.round($result;3)=Math.round(Math.pow(Math.E;5);3))
//-----------------
$result:=Math.floor(5.3)
ASSERT($result=5)
$result:=Math.floor(-5.3)
ASSERT($result=-6)
$result:=Math.floor(0)
ASSERT($result=0)
//-----------------
$result:=Math.log(Math.E)
ASSERT($result=1)
//-----------------
$result:=Math.cos(0)
ASSERT($result=1)
$result:=Math.cos(Math.PI)
ASSERT($result=-1)
//-----------------
$result:=Math.tan(0)
ASSERT($result=0)
$result:=Math.cos(Math.PI)
ASSERT($result=-1)
//-----------------
$result:=Math.sin(0)
ASSERT($result=0)
$result:=Math.sin(Math.PI)
ASSERT($result=0)
//-----------------
$result:=Math.toDegrees(Math.PI)
ASSERT($result=180)
$result:=Math.toDegrees(Math.PI/2)
ASSERT($result=90)
//-----------------
$result:=Math.toRadians(360)
ASSERT($result=(2*Math.PI))
$result:=Math.toRadians(45)
ASSERT($result=(Math.PI/4))
//-----------------
$result:=Math.int(36.9)
ASSERT($result=36)
$result:=Math.int(36.1)
ASSERT($result=36)
//-----------------
var $t : Text
$t:=Math.toString(8)
ASSERT(type($t)=Is text)
$t:=Math.toString($result)
ASSERT(type($t)=Is text)



