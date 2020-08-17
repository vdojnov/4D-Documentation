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
```


## ```ceil(Real x)```

**Description:** Returns the smallest integer greater than or equal x

**Parameters:** Takes one parameter of type Real


```4D
var $result : Real
$result:=$math.ceil(-4)
```


## ```copySign(Real x, Real y)```

**Description:** Returns x with the sign of y

**Parameters:** Takes two parameters of type Real

```4D
var $result : Real
$result:=$math.copySign(4;-3)
```


## ```cos(Real x)```

**Description:** Returns the cosine of x, where x is in Radians

**Parameters:** Takes one parameters of type Real 

```4D
var $result : Real
$result:=$math.cos(-4)
```


## ```exp(Real x)```

**Description:** Returns Euler's number e raised to the power of x.

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.exp(-4)
```


## ```factorial(Real x)```

**Description:** Returns the factorial of x

**Parameters:** Takes one NON-NEGATIVE parameters of type Real

```4D
var $result : Real
$result:=$math.factorial(5)
```


## ```floor(Real x)```

**Description:** Returns the largest integer less than or equal to x

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.floor(-4)
```


## ```hypot(Real x, Real y)```

**Description:** Find the hypotenuse of a right angle triangle (x^2 + y^2)

**Parameters:** Takes two parameters of type Real, x and y representing non-hypotenuse sides of the triangle

```4D
var $result : Real
$result:=$math.hypot(-4)
```


## ```log(x)```

**Description:** Returns the logarithm of x to the base *e*

**Parameters:** Takes one parameters of type Real

```4D
var $result : Real
$result:=$math.log(-4)
```


## ```max(Real x, Real y, Real z,..., Real n)```

**Description:** Returns the largest number of inputted values

**Parameters:** Take at least two or more parameters of type Real

```4D
var $result : Real
$result:=$math.max(-4)
```


## ```min(Real x, Real y, Real z,..., Real n)```

**Description:** Returns the smallest number of inputted values

**Parameters:** Take at least two or more parameters of type Real

```4D
var $result : Real
$result:=$math.min(-4)
```


## ```pow(x, y)```

**Description:** Returns x raised to the power y

**Parameters:** Takes two parameters of type Real

```4D
var $result : Real
$result:=$math.pow(-4)
```


## ```random()```
Takes zero, one, or two parameters

### ```random()```


**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.random(-4)
```


## ```round()```

**Description:** Returns

**Parameters:** 

```4D
var $result : Real
$result:=$math.round(-4)
```


## ```sign()```

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.sign(-4)
```


## ```sin()```

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.sin(-4)
```


## ```sqrt()```

**Description:** 

**Parameters:** 

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


## ```tan()```

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.tan(-4)
```


## ```toDegrees()```

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.toDegrees(-4)
```


## ```toRadians()```

**Description:** 

**Parameters:** 

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

