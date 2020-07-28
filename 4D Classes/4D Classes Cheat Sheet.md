# Classes in 4D - Cheat Sheet

* You can intanciate Objects from anywhere in you code when a Class is defined
* A class object is a shared object and can therefore be accessed from different 4D processes simultaneously
* A class can ```extend``` another class inheriting from its fucntions
* Class names should be [ECMAScript](https://en.wikipedia.org/wiki/ECMAScript) compliant 



<!-- To access available classes you must use _cs._ which refers to Class Store.

```4D
    // Get property of an object 
$property:= cs.ClassName.property

$functionOutput:= cs.ClassName.function()
``` -->

# Class KeyWords

Three 4D keywords can be used in class definitions:

* ```Class constructor``` to define the properties of the objects (i.e. the prototype).
* ```Function <Name>``` to define member methods of the objects.
* ```Class extends <ClassName>``` to define inheritance.

## Class Constructor

We will write a ```Class constructor``` of a class named "Person" as an example:

```4D
    // Class: Person

Class constructor

C_TEXT($1;$2)
C_LONGINT($3)
This.firstName:= $1
This.lastName:= $2
This.age:= $3
```

## Class Functions

To write a class function you use the keyword "Function" along with the function name (```Function myFunction```)

```4D
    // Class: Person

Class constructor

C_TEXT($1;$2)
C_LONGINT($3)
This.firstName:= $1
This.lastName:= $2
This.age:= $3


Function whoAmI
C_TEXT($0)
$0:= "Hi, my name is " + This.firstName + " " + This.lastName.
```