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

### abs()
Returns the absolute value of x (|_x_|)

`Math.abs(`_x_`)`






