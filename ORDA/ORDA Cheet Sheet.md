# 4D ORDA Cheat Sheet 

Below is the table structure we will use as the example:

![alt text](https://github.com/vdojnov/4D-Documentation/blob/master/Images/Table%20Structure%20Images.JPG?raw=true)

* Many to one relationship name: employer
* One to many relationship name: employees 


## Querying From One table:

For retrieving data from your root 4D database use _ds._ at the beginning  of query ( i.e _ds.Employee.all()_ ). You can can add remote databases, which will use a different prefix ( i.e _remoteDataStore.Employee.all()_ ) 


### Query all employees:

```4D
$allEmps:= ds.Employees.all()
```
### Query the first Employee:

```4D
$emp:= ds.Employees.all().first()
```

### Query the last Employee:

```4D
$emp:= ds.Employees.all().last()
```

### Query the next or previous Employee:

```4D
    // Get all employees
$allEmps:= ds.Employees.all()

    //Get the first employee
$firstEmp:= $allEmps.first()

    // Get the second employee (Next in line)
$secondEmp:= firstEmp.next()

    // Get the first employee again (Previous in line)
$firstEmpAgain:= $secondEmp.previous()
```


### Query the Employees as an Array (Starting from 0,1,2...N):

```4D
    // Gives you the first employee
$emp0:= ds.Employees.all()[0]

    // Gives you the second employee
$emp1:= ds.Employees.all()[1]
    .
    .
    .
    // Gives you the Nth employee
$empN:= ds.Employees.all()[N]
```

### Query by ID:

```4D
    // Gives you the employee with ID 20
$emp:= ds.Employees.get(20)
```

### Query one column of a row in database:

```4D
    // Gives you the employee first name with ID 20
$empFirstName:= ds.Employees.get(20).firstName

    // Gives you the employee last name with ID 20
$empLastName:= ds.Employees.get(20).lastName
```

### Query with a WHERE clause:
* You can use operators like '=', '<', '>', etc.
* You can use place holders using "_:1_"
* You can partially search text using "@" either before, after, or both (i.e for "John": "name=@ohn", "name=Joh@", or "name=@oh@")


```4D
    // Gives you the first instance of the employee last name 
    // WHERE the first name is "John"
$empLastName:=ds.Employees.query("firstName=John").first().lastName

    // Using a placeholder (':1')
$empLastName:=ds.Employees.query("firstName= :1"; "John").first().lastName

    // Gives you the employee WHERE salary is over $100,000
$empsOver100K:= ds.Employees.query("salary>100000")
```

### Query with Multiple WHERE Clauses:

 You can use _**and**_ and _**or**_ operators

 ```4D
    // Gives you the employees whos name is John AND whos 
    // salary is larger than $100,000
$emps:=ds.Employees.query("firstName=John and salary>100000")

    // Similarly, this gives you employees whos first name 
    //is John OR last name is John
$emps:=ds.Employees.query("firstName=John or lastName=John")
```

## Relational Query (JOINS)

### Query using Many to one relationship name: employer

```4D
    // Gives you the Compnay Name where 
$emp:=ds.Employees.get(20)
$companyName:= $emp.employer.name

    // Similarly, this does the same
$companyName:= ds.Employees.get(20).employer.name
```

```4D
    // Gives you all employees that work for company name Amazon
$amazonEmps:= ds.Employees.query("employer.name=Amazon")
```

### Query using One to many relationship name: employees

```4D
    // Gives you the name of the first employee that work in company with ID 5
$emp:=ds.Companies.get(5)).employees.first().firstName
```


## ORDER BY / .orderBy()

You can order the selected query:

```4D
    // Gives you all employees
$allEmps:= ds.Employees.all()

    // Orders the employees in $allEmps by first name
orderedEmps:= $allEmps.orderBy("firstName")
```


## COUNT / .length()

If you want to get the count of rows in your selection you can use _.length_

```4D
    // Gives you the number of employees that work at Amazon
$AmazonEmps:= ds.Employees.query("employer.name=Amazon")
$numAmazonEmps:= $AmazonEmps.length
```

## DELETE / .drop()

You can delete a single record or do a bulk delete using _.drop()_:

```4D
    // Delete the employee with ID 5
ds.Employees.get(5).drop()

    Delete all employees that work for compnay with ID 4
ds.Employees.query("companyID=4").drop()
```

## SLICE / .slice()
Returns a collection of rows at a specified index
* Slice takes a parameter either 1 or 2 paramaters
* The first one is the start index (inclusive). (0 being the first index)
* The second its the end index (exclusive)

```4D
    // Gives you a collection of all rows starting from the 3rd row
$afterThird:= ds.Employees.all().slice(2)

    // Gives you a collection of the first 5 rows
$firstFive:=ds.Employees.all().slice(0;5)
```


