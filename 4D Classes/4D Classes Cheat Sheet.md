# Classes in 4D - Cheat Sheet

* You can instantiate Objects from anywhere in your code when a Class is defined
* A class object is a shared object and can, therefore, be accessed from different 4D processes simultaneously
* A class can ```extend``` another class inheriting from its functions
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

To write a class function you use the keyword "Function" along with the function name (```Function myNewFunction```)

### Function without parameter
```4D
    // Class: Person

Class constructor
    C_TEXT($1;$2)
    C_LONGINT($3)
    This.firstName:= $1
    This.lastName:= $2
    This.age:= $3

    // Class function that returns who the person is
Function whoAmI
    C_TEXT($0)
    $0:= "Hi, my name is " + This.firstName + " " + This.lastName + "."
```

### Function with parameter

Functions can also take parameters like the ```greetPerson``` function does

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
    $0:= "Hi, my name is " + This.firstName + " " + This.lastName + "."

    // Class function that takes a parameter
Function greetPerson
	C_TEXT($0;$1;$greeterName)
	$greeterName:= $1
	$0:= "Hello " + This.firstName + ", my name is " + $greeterName + "!"
```


## Creating an Object

### New Object / _.new()_
In a method you can create a new object from the class, we are going to create a Person "Mike Smith" who is 25 years old.
* Remember to use _cs._ before the Class Name

```4D
    // Method: randomMethod

    //Create new a Person Object
C_OBJECT($personObject)
$personObject:= cs.Person.new("Mike";"Smith";25)

    // OR

    // You can create it one by one
$personObject2:=cs.Person.new()
$personObject2.firstName:="Mike"
$personObject2.lastName:="Smith"
$personObject2.age:=25

```

### Calling a ```Class Function``` on the object

```4D
    // Method: randomMethod

    //Create new person Object
C_OBJECT($personObject)
$personObject:= cs.Person.new("Mike";"Smith";25)

    // Without parameter
$sayHello:= $personObject.whoAmI() // "Hi, my name is Mike Smith.

    // With parameter
$greetMike:= $personObject.greetPerson("John") // "Hello Mike, my name is John!
```

## Inheritance

### Creating a Child Class 

We want to make a class **Student** that ```extends``` the class **Person**
* We use the ```extends``` keyword to let 4D know Student is a child class of Person
* We use the ```Super()``` keyword call the parent class (```Super()``` must be used before the ```This.``` keyword)

```4D
    // Class: Student

Class extends Person

Class constructor
	C_TEXT($1;$2)
	C_LONGINT($3)
	C_REAL($4)
	
    // Calls superclass Person for firstName, lastName and age. Use Super() before This.GPA!
	Super($1;$2;$3)
	This.GPA:=$4
```

### Child Class Functions

Similarly, a child class can have its own functions:

```4D
    // Class: Student

Class extends Person

Class constructor
	C_TEXT($1;$2)
	C_LONGINT($3)
	C_REAL($4)
	
	Super($1;$2;$3)
	This.GPA:=$4

Function myGPA
    C_TEXT($0)
    $0:= This.firstName + " has a GPA: " + String(This.GPA)
```

### Calling a parent function / _Super._

Calling the parent ```whoAmI()``` function in a child function using ```Super``` ( ```Super.whoAmI()``` )

```4D
    // Class: Student

Class extends Person

Class constructor
	C_TEXT($1;$2)
	C_LONGINT($3)
	C_REAL($4)
	
	Super($1;$2;$3)
	This.GPA:=$4

Function myGPA
    C_TEXT($0)
    $0:= This.firstName + " has a GPA: " + String(This.GPA) 

Function introduceMe
    C_TEXT($0)
        // Use Super.myFunction() to call a fucntion from parent class
    $0:= Super.whoAmI() + " My GPA is " + This.GPA + "."
```

## Class Commands

* ```OB Instance of``` returns true if the object belongs to a class or to one of its inherited classes, and false otherwise.
* ```OB Class``` returns the class of the object passed in parameter.


```4D
    // Method: randomMethod

C_OBJECT($student; $class; $parentClass)
C_TEXT($className)
C_BOOLEAN($instance)

$student:= cs.Student.new("John";"Doe";19;3.8)

    //Returns True because Student is an Instance of Person
$instance:=OB Instance of($student;cs.Person) 

    //Returns Class: Student because $student is an Object of class Student
$class:=OB Class($student)

    //Returns "Student" string (Name of the class)
$className:=$class.name

    //Returns Class: Person because there superclass of Student is Person
$parentClass:= $class.superclass    
```

# Related 4D Documentation Links
* [4D Documentation](https://developer.4d.com/docs/en/Concepts/classes.html)
* [Object-oriented development with 4D Video](https://www.youtube.com/watch?v=mAtrBdjSs9c)
