<!-- Type your summary here -->
# Math Library Documentation
1. [Instantiation](#Instantiation)
2. [Constants](#constants)
    1. [Pi](#pi)
    1. [Euler's constant *e*](#e)
3. [Functions](#functions)
    1. [abs()](#abs)
    1. [average()](#average)
    1. [cbrt()](#cbrt)
    1. [ceil()](#ceil)
    1. [copySign()](#copySign)
    1. [cos()](#cos)
    1. [exp()](#exp)
    1. [factorial()](#factorial)
    1. [floor()](#floor)
    1. [hypot()](#hypot)
    1. [int()](#int)
    1. [log()](#log)
    1. [max()](#max)
    1. [min()](#min)
    1. [pow()](#pow)
    1. [print()](#print)
    1. [random()](#random)
    1. [round()](#round)
    1. [sign()](#sign)
    1. [sin()](#sin)
    1. [sqrt()](#sqrt)
    1. [sum()](#sum)
    1. [tan()](#tan)
    1. [toDegrees()](#toDegrees)
    1. [toRadians()](#toRadians)
    1. [toString()](#toString)

## Instantiation <a name="Instantiation"></a>

To instantiate a new Math Class to be able to use the functions you need to declare a new variable, and create the new object.


```4D
var $math : cs.Math
$math:=cs.Math.new()
```
We can now use the $math Variable to perform math functions and access math constants.

## Constants <a name="constants"></a>

### PI - *π* <a name="pi"></a>
The mathematical constant pi (_π_), approximately `3.14159`.

```4D
var $pi : Real
$pi:=$math.PI
```

### Euler's constant - *e* <a name="e"></a>

Euler's constant (_e_), approximately `2.718`.

```4D
var $e : Real
$e:=$math.E
```

## Functions <a name="functions"></a>

### ```abs(Real x)``` <a name="abs"></a>

**Description:** Returns the absolute value of x (|_x_|)

**Parameters:** Takes one parameter of type Real

```4D
var $result : Real
$result:=$math.abs(-4)
    //Returns 4
```

### ```average(Real x, Real y, Real z,..., Real n)``` <a name="average"></a>

**Description:** Returns the average of inputted values

**Parameters:** Take at least two or more parameters of type Real

```4D
var $result : Real
$result:=$math.average(1;2;3;4;5)
    //Returns 3
```

## ```cbrt(Real x)``` <a name="cbrt"></a>

**Description:** Returns the cube root of x

**Parameters:** Takes one parameter of type Real

```4D
var $result : Real
$result:=$math.cbrt(16)
    //Returns 4
```


## ```ceil(Real x)``` <a name="ceil"></a>

**Description:** Returns the smallest integer greater than or equal x

**Parameters:** Takes one parameter of type Real


```4D
var $result : Real
$result:=$math.ceil(4.02)
    //Returns 5
```


## ```copySign(Real x, Real y)``` <a name="copySign"></a>

**Description:** Returns x with the sign of y

**Parameters:** Takes two parameters of type Real

```4D
var $result : Real
$result:=$math.copySign(4;-3)
    //Returns -4
```


## ```cos(Real x)``` <a name="cos"></a>

**Description:** Returns the cosine of x, where x is in Radians

**Parameters:** Takes one parameters of type Real 

```4D
var $result, $pi : Real
$pi:=$math.PI
$result:=$math.cos($pi)
    //Returns -1
```

Cos can also take an additional parameter:

 1. ### ```cos(Real x, Boolean isRadian)```

    **Description:** Returns the cosine of x, and takes another boolean parameter that specifies if x is a radian (or in degrees) 

    **Parameters:** Takes one parameters of type Real, and one Boolean

    ```4D
    var $result : Real
    $result:=$math.cos(180; False)
        //Returns -1
    ``` 


## ```exp(Real x)``` <a name="exp"></a>

**Description:** Returns Euler's number e raised to the power of x.

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.exp(3)
    //Returns e^3
```


## ```factorial(Real x)``` <a name="factorial"></a>

**Description:** Returns the factorial of x

**Parameters:** Takes one NON-NEGATIVE parameters of type Integer

```4D
var $result : Integer
$result:=$math.factorial(5)
    //Returns 120
```


## ```floor(Real x)``` <a name="floor"></a>

**Description:** Returns the largest integer less than or equal to x

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.floor(4.05)
    //Returns 4

$result:=$math.floor(-4.05)
    //Returns -5
```


## ```hypot(Real x, Real y)``` <a name="hypot"></a>

**Description:** Find the hypotenuse of a right angle triangle (x^2 + y^2)

**Parameters:** Takes two parameters of type Real, x and y representing non-hypotenuse sides of the triangle

```4D
var $result : Real
$result:=$math.hypot(3;4)
    //Returns 5
```

## ```int(Real x)``` <a name="int"></a>
**Description:** Returns the integer value of x

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.int(45.8)
    // Returns 45
```

## ```log(Real x)``` <a name="log"></a>

**Description:** Returns the logarithm of x to the base *e*

**Parameters:** Takes one parameters of type Real

```4D
var $result, $e : Real
$e:=$math.E
$result:=$math.log($e)
    // Returns 1
```


## ```max(Real x, Real y, Real z,..., Real n)``` <a name="max"></a>

**Description:** Returns the largest number of inputted values

**Parameters:** Take at least two or more parameters of type Real

```4D
var $result : Real
$result:=$math.max(4;5;2;7;3)
    // Returns 7
```


## ```min(Real x, Real y, Real z,..., Real n)``` <a name="min"></a>

**Description:** Returns the smallest number of inputted values

**Parameters:** Take at least two or more parameters of type Real

```4D
var $result : Real
$result:=$math.min(4;5;2;7;3)
    // Returns 2
```


## ```pow(Real x, Real y)``` <a name="pow"></a>

**Description:** Returns x raised to the power y

**Parameters:** Takes two parameters of type Real

```4D
var $result : Real
$result:=$math.pow(3;2)
    // Returns 9
```

## ```print(Real x, Real y)``` <a name="print"></a>

**Description:** Pops up an Alert with the value of x

**Parameters:** Takes one parameters of type Real

```4D
$math.print(5)
    // Acts as an alert for values of type Real
```

## ```random()``` <a name="random"></a>
#### Takes zero, one, or two parameters


1. ### ```random()```

    **Description:** Returns a number between 0 (inclusive) and 1 (exclusive)

    **Parameters:** Takes no parameters

    ```4D
    var $result : Real
    $result:=$math.random()
        // Return 0.3210269206472 for example
    ```
2.  ### ```random(Real x)```
    **Description:** Returns a number between 0 (inclusive) and x (inclusive)

    **Parameters:** Takes one parameter of type Real

    ```4D
    var $result : Real
    $result:=$math.random(5)
        // Return 3 for example
    ```
3.  ### ```random(Real x, Real y)```
    **Description:** Returns a number between x (inclusive) and y (inclusive)

    **Parameters:** Takes two parameter of type Real

    ```4D
    var $result : Real
    $result:=$math.random(2;5)
        // Return 3 for example
    ```
## ```round()``` <a name="round"></a>
#### Takes one or two parameters

1.  ### ```round(Real x)```
    **Description:** Returns x rounded to the nearest Integer

    **Parameters:** Takes one parameter of type Real

    ```4D
    var $result : Real
    $result:=$math.round(2.575)
        // Return 3
    ```

2.  ### ```round(Real x, Int y)```
    **Description:** Returns x rounded to y decimal places

    **Parameters:** Takes two parameter, x of type Real, y of type Int

    ```4D
    var $result : Real
    $result:=$math.round(2.575;2)
        // Return 2.58
    ```

## ```sign(Real x)``` <a name="sign"></a>

**Description:** Returns the sign of the x, indicating whether x is positive (+1), negative (-1), or zero(0).

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.sign(-4)
    Returns -1

$result:=$math.sign(4)
    Returns 1

$result:=$math.sign(0)
    Returns 0
```

## ```sin(Real x)``` <a name="sin"></a>

**Description:**  Returns the sine of x, where x is in Radians

**Parameters:** Takes one parameters of type Real

```4D
var $result, $pi: Real
$pi:=$math.PI
$result:=$math.sin($pi)
    // Returns 0
```

1. ### ```sin(Real x, Boolean isRadian)```

    **Description:** Returns the sine of x, and takes another boolean parameter that specifies if x is a radian (or in degrees) 

    **Parameters:** Takes one parameters of type Real, and one Boolean

    ```4D
    var $result : Real
    $result:=$math.sin(180; False)
        //Returns 0
    ``` 


## ```sqrt(Real x)``` <a name="sqrt"></a>

**Description:** Returns the square root of x

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.sqrt(9)
    // Returns 3    
```


## ```sum(Real x, Real y, Real z,..., Real n)``` <a name="sum"></a>

**Description:** Returns the sum of inputted values

**Parameters:** Take at least two or more parameters of type Real

```4D
var $result : Real
$result:=$math.sum(1;2;3;4;5)
    // Returns 15
```


## ```tan(Real x)``` <a name="tan"></a>

**Description:** Returns the tangent of x,  where x is in Radians

**Parameters:** Takes one parameters of type Real

```4D
var $result, $pi : Real
$pi:=$math.PI
$result:=$math.tan($pi)
    // Returns -1
```
1. ### ```tan(Real x, Boolean isRadian)```

    **Description:** Returns the tangent of , and takes another boolean parameter that specifies if x is a radian (or in degrees) 

    **Parameters:** Takes one parameters of type Real, and one Boolean

    ```4D
    var $result : Real
    $result:=$math.tan(180; False)
        //Returns -1
    ``` 


## ```toDegrees(Real x)``` <a name="toDegrees"></a>

**Description:** Converts an angle measured in radians to an approximately equivalent angle measured in degrees

**Parameters:** Takes one parameters of type Real

```4D
var $result, $pi : Real
$pi:=$math.PI
$result:=$math.toDegrees($pi)
    // Returns 180
```


## ```toRadians(Real x)``` <a name="toRadians"></a>

**Description:** Converts an angle measured in degrees to an approximately equivalent angle measured in radians.

**Parameters:** Takes one parameters of type Real

```4D
var $result, $pi : Real
$pi:=$math.PI
$result:=$math.toRadians(180)
    // Return 2.14159... <--- (π)
```

## ```toString(Real x)``` <a name="toString"></a>

**Description:** Converts a value of type Real to type Text

**Parameters:** Takes one parameters of type Real

```4D
var $result: Real
$result:=$math.toString(180)
    // Return "180"
```