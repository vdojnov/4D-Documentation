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

### ```abs(x)```

**Description:** Returns the absolute value of x (|_x_|)

**Parameters:** Takes one parameter of type Real

```4D
var $result : Real
$result:=$math.abs(-4)
    //Returns 4
```

### ```average()```

**Description:** Returns the average of the value of parameters

**Parameters:** Take at least two or more parameters of type Real

```4D
var $result : Real
$result:=$math.average(1;2;3;4;5)
    //Returns 3
```

## ```cbrt()```

**Description:** Returns the cube root of of a number

**Parameters:** Takes one parameter of type Real

```4D
var $result : Real
$result:=$math.cbrt(16)
```


## ceil()

**Description:** Returns the smallest integer greater than or equal to the input

**Parameters:** Takes one parameter of type Real


```4D
var $result : Real
$result:=$math.ceil(-4)
```


## copySign()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.copySign(4;-3)
```


## cos()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.cos(-4)
```


## exp()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.exp(-4)
```


## factorial()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.factorial(5)
```


## floor()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.floor(-4)
```


## hypot()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.hypot(-4)
```


## log()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.log(-4)
```


## max()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.max(-4)
```


## min()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.min(-4)
```


## pow()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.pow(-4)
```


## random()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.random(-4)
```


## round()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.round(-4)
```


## sign()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.sign(-4)
```


## sin()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.sin(-4)
```


## sqrt()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.sqrt(-4)
```


## sum()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.sum(-4)
```


## tan()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.tan(-4)
```


## toDegrees()

**Description:** 

**Parameters:** 

```4D
var $result : Real
$result:=$math.toDegrees(-4)
```


## toRadians()

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

