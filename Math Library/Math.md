<!-- Type your summary here -->
# Math Library Documentation

## Instantiation 

To instantiate a new Math Class to be able to use the functions you need to declare a new variable, and create the new object.


```4D
var $math : cs.Math
$math:=cs.Math.new()
```
We can now use the $math Variable to perform math functions and access math constants.

## Constants

### PI
The mathematical constant pi (_π_), approximately `3.14159`.

```4D
var $pi : Real
$pi:=$math.PI
```

### E

Euler's constant (_e_), approximately `2.718`.

```4D
var $e : Real
$e:=$math.E
```

## Functions

### ```abs(Real x)```

**Description:** Returns the absolute value of x (|_x_|)

**Parameters:** Takes one parameter of type Real

```4D
var $result : Real
$result:=$math.abs(-4)
    //Returns 4
```

### ```average(Real x, Real y, Real z,..., Real n)```

**Description:** Returns the average of inputted values

**Parameters:** Take at least two or more parameters of type Real

```4D
var $result : Real
$result:=$math.average(1;2;3;4;5)
    //Returns 3
```

## ```cbrt(Real x)```

**Description:** Returns the cube root of x

**Parameters:** Takes one parameter of type Real

```4D
var $result : Real
$result:=$math.cbrt(16)
    //Returns 4
```


## ```ceil(Real x)```

**Description:** Returns the smallest integer greater than or equal x

**Parameters:** Takes one parameter of type Real


```4D
var $result : Real
$result:=$math.ceil(4.02)
    //Returns 5
```


## ```copySign(Real x, Real y)```

**Description:** Returns x with the sign of y

**Parameters:** Takes two parameters of type Real

```4D
var $result : Real
$result:=$math.copySign(4;-3)
    //Returns -4
```


## ```cos(Real x)```

**Description:** Returns the cosine of x, where x is in Radians

**Parameters:** Takes one parameters of type Real 

```4D
var $result : Real
$pi:=$math.PI
$result:=$math.cos($pi)
    //Returns 1
```


## ```exp(Real x)```

**Description:** Returns Euler's number e raised to the power of x.

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.exp(3)
    //Returns e^3
```


## ```factorial(Real x)```

**Description:** Returns the factorial of x

**Parameters:** Takes one NON-NEGATIVE parameters of type Integer

```4D
var $result : Integer
$result:=$math.factorial(5)
    //Returns 120
```


## ```floor(Real x)```

**Description:** Returns the largest integer less than or equal to x

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.floor(4.05)
    //Returns 4

$result:=$math.floor(-4.05)
    //Returns -5
```


## ```hypot(Real x, Real y)```

**Description:** Find the hypotenuse of a right angle triangle (x^2 + y^2)

**Parameters:** Takes two parameters of type Real, x and y representing non-hypotenuse sides of the triangle

```4D
var $result : Real
$result:=$math.hypot(3;4)
    //Returns 5
```


## ```log(x)```

**Description:** Returns the logarithm of x to the base *e*

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$e:=$math.E
$result:=$math.log($e)
    // Returns 1
```


## ```max(Real x, Real y, Real z,..., Real n)```

**Description:** Returns the largest number of inputted values

**Parameters:** Take at least two or more parameters of type Real

```4D
var $result : Real
$result:=$math.max(4;5;2;7;3)
    // Returns 7
```


## ```min(Real x, Real y, Real z,..., Real n)```

**Description:** Returns the smallest number of inputted values

**Parameters:** Take at least two or more parameters of type Real

```4D
var $result : Real
$result:=$math.min(4;5;2;7;3)
    // Returns 2
```


## ```pow(Real x, Real y)```

**Description:** Returns x raised to the power y

**Parameters:** Takes two parameters of type Real

```4D
var $result : Real
$result:=$math.pow(3;2)
    // Returns 9
```


## ```random()```
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
## ```round()```
#### Takes one, or two parameters

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

**Description:** Returns

**Parameters:** 

```4D
var $result : Real
$result:=$math.round(-4)
```


## ```sign(x)```

**Description:** Returns the sign of the x, indicating whether x is positive (+1), negative (-1), or zero(0).

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.sign(-4)
```


## ```sin(Real x)```

**Description:**  Returns the sine of x, where x is in Radians

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.sin(-4)
```


## ```sqrt(Real x)```

**Description:** Returns the square root of x

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.sqrt(-4)
```


## ```sum()```

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.sum(-4)
```


## ```tan(Real x)```

**Description:** Returns the tangent of x,  where x is in Radians

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.tan(-4)
```


## ```toDegrees(Real x)```

**Description:** Converts an angle measured in radians to an approximately equivalent angle measured in degrees

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.toDegrees(-4)
```


## ```toRadians(Real x)```

**Description:** Converts an angle measured in degrees to an approximately equivalent angle measured in radians.

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.toRadians(-4)
```








**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.abs(-4)
```

