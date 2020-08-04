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
$secondEmp:= $firstEmp.next()

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
$empLastName:=ds.Employees.query("firstName='John'").first().lastName

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
$emps:=ds.Employees.query("firstName='John' and salary>100000")

    // Similarly, this gives you employees whos first name 
    //is John OR last name is John
$emps:=ds.Employees.query("firstName='John' or lastName='John'")
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
$amazonEmps:= ds.Employees.query("employer.name='Amazon'")
```

### Query using One to many relationship name: employees

```4D
    // Gives you the name of the first employee that works in company with ID 5
$emp:=ds.Companies.get(5).employees.first().firstName
```


## ORDER BY / .orderBy()

You can order the selected query:

```4D
    // Gives you all employees
$allEmps:= ds.Employees.all()

    // Orders the employees in $allEmps by first name
orderedEmps:= $allEmps.orderBy("firstName")
```


## COUNT / .length

If you want to get the count of rows in your selection you can use _.length_

```4D
    // Gives you the number of employees that work at Amazon
$AmazonEmps:= ds.Employees.query("employer.name='Amazon'")
$numAmazonEmps:= $AmazonEmps.length
```


## Average / .average()

Takes a column as a parameter and returns the average

```4D
    // Gives you the average salary of an Amazon employee
$AmazonEmps:= ds.Employees.query("employer.name='Amazon'")
$averageSalary:= $AmazonEmps.average("salary")
```

## ADD RECORD (INSERT) / .new()

You can create a new object with the attributes from a table with the _.new()_ keyword, and then save it as a row in the table with the _.save()_ keyword.

We can add a new company to out _Companies_ table:

```4D
    // Create a new object
$newCompany:=ds.Companies.new()

    // Assign values to attribues
$newCompany.name:="Example Company"
$newCompany.address:="123 Example St"

    // Save the data to the database
$newCompany.save()
```

## UPDATE 

Similarly, you can query and existing row and change the values:

```4D
    // Change the email of an employee with ID 5
$emp:= ds.Employees.get(5)
$emp.email:="newEmail@example.com"
$emp.save()
```

You can also update multiple rows:

* We want to give everyone working at Amazon a 5% raise

```4D
 C_OBJECT($emp)
 For each($emp;ds.Employees.all())
    If($emp.employer.name ="Amazon")
       $emp.salary:=$emp.salary*1.05
       $emp.save()
    End if
 End for each
 ```

## DELETE / .drop()

You can delete a single record or do a bulk delete using _.drop()_:

```4D
    // Delete the employee with ID 5
ds.Employees.get(5).drop()

    // Delete all employees that work for company with ID 4
ds.Employees.query("companyID=4").drop()
```


## SLICE / .slice()
Returns a collection of rows at a specified index
* Slice takes either 1 or 2 parameters
* The first one is the start index (inclusive). (0 being the first index)
* The second is the end index (exclusive)

```4D
    // Gives you a collection of all rows starting from the 3rd row
$afterThird:= ds.Employees.all().slice(2)

    // Gives you a collection of the first 5 rows
$firstFive:=ds.Employees.all().slice(0;5)
```
## ALL ORDA EntitySelection Functions

You can see all The ORDA Entity Selection Functions [Click Here](https://doc.4d.com/4Dv18R4/4D/18-R4/ORDA-EntitySelection.201-4981856.en.html)

# Creating ORDA CLASSES in 4D v18 R4

In 4D v18 R4 Project, when you create a table it will automatically ORDA classes for you to use. You can predefine functions to use later in your code.

* It will create one **DataStore Class** 
* As well as an additional three classes for each table (**DataClass**, **Entity Class**, and **Entity Selection Class**)
* Each of these classes will ```extend``` another class, 4D will do that for you automatically

## The DataStore Class

This class is used to implement functions related to the [datastore](https://doc.4d.com/4Dv18R4/4D/18-R4/Datastores.300-5005671.en.html).

* We only have one of these classes called "DataStore" in our Classes folder

<!-- ```4D
Class extends DataStoreImplementation

Function getDescription
C_TEXT($0)
$0:= "There are " + String(This.Employees.all().length) " employees working in " + String(This.Companies.all().length) + " companies around the world!"
```

When we call the DataStore function:

```4D
C_TEXT($description)
$description:=ds.getDescription() // "There are 500 employees working in 80 companies around the world!"
``` -->

```4D
Class extends DataStoreImplementation

Function getCompanyStats

C_COLLECTION($0;$result)
C_OBJECT($obj;$company)

$result:=New collection()


For each ($company;This.Companies.all())
 $obj:= New Object()
 $obj.name:=$company.name
 $obj.address:=$company.address
 $obj.numEmployees:=$company.employees.length
 $result.push($obj)
End for each

$0:=$result
```

When we call the DataStore function:

```4D
C_COLLECTION($companyStats)
$companyStats:=ds.getCompanyStats() // Returns a collection of objects with information about each company
```

## The DataClass Class

This class is used to implement functions related to the [dataclass](https://doc.4d.com/4Dv18R4/4D/18-R4/Dataclasses.300-5005670.en.html).

* We have a DataClass for both Employees and Companies, The can be found in the classes folder named "Companies" and "Employees"

In this example, we will look at the _Employees_ DataClass. We want a function for when an employee is hired by one of our companies:

<!-- ```4D
Class extends DataClass

Function changeEmployeeWorkPlace
C_LONGINT($1; $2; $empID; $newCompID)
C_OBJECT($0; $emp)

$empID:=$1
$newCompID:=$2

$emp:=ds.Employees.get($empID)
$emp.companyID:= $newCompID
$emp.save()

$0:= $emp
```
We can call the function:

```4D
    // Changed Employee with ID 2 to work for Company with ID 6
$employeeNewData:=ds.Employees.changeEmployeeWorkPlace(2; 6)
``` -->

```4D
Class extends DataClass

Function hireNewEmployee
C_OBJECT($0; $1; $empData; $empHired; $newCompany)

$empData:= $1
 
$newCompany:=ds.Companies.query("name= :1"; $empData.companyName).first() // Get the company by querying the company name  
$empHired:=ds.Employees.new() // Create new employee  
$empHired.fromObject($empData) // Input employee data from parameter
$empHired.employer:=$newCompany // Set the relation 'employer' to the queried company
$empHired.save()

$0:= $empHired
```

We can call the function:

```4D
C_OBJECT($emp)

$emp:= New Object("firstName";"Mary"; "lastName"; "Smith"; "email"; "mary@example.com"; "salary" ; 70000 ;"companyName"; "Amazon")

$hiredEmployee:=ds.Employees.hireNewEmployee($emp) // Adds a new employee to the database and returns that employee record
```


## The Entity Class

This class is used to implement functions related to an [entity](https://doc.4d.com/4Dv18R4/4D/18-R4/Entities.300-5005669.en.html).

<!-- We want to get all employees who make more money than the current employee

```4D
Class extends Entity

Function getHigherPaidEmps

C_OBJECT($0;$higherPayEmps)

$higherPayEmps:= This.getDataClass().query("salary > :1"; This.salary).orderBy("salary desc")

$0:= $higherPayEmps
```
We can call the function:

```4D
C_OBJECT($emp;$higherPayEmps)

$emp:= ds.Employees.query("firstName = 'John' and lastName = 'Smith'").first()

$higherPayEmps:= $emp.getHigherPaidEmps() // Returns all employees who have a salary higher than John Smith
``` -->

We want to get all the employees that work in the same company as the current employee using the _EmployeeEntity_ Class:

```4D
Class extends Entity

Function worksInSameCompany

C_OBJECT($0;$workTogether;$company)

$company:=This.Companies.name

$$workTogether:= $company.employees.minus(This)

$0:= $workTogether
```
We can call the function:

```4D
C_OBJECT($emp;$workTogether)

$emp:= ds.Employees.query("firstName = 'John' and lastName = 'Smith'").first()

$$workTogether:= $emp.worksInSameCompany() // Returns all employees who work in the same company as John Smith
```

## The Entity Selection Class

This class is used to implement functions related to an [entity selection](https://doc.4d.com/4Dv18R4/4D/18-R4/Entity-selections.300-5005668.en.html).

We want to give everyone a raise using the _EmployeeSelection_ Class

```4D
Class extends EntitySelection

Function giveRaise

C_OBJECT($0;$status;$employee)
C_REAL($1; $raise)

$raise:= $1

 For each ($employee;This) Until (Not($status.success))
   $employee.salary:= $employee.salary * $raise
   $status:=$employee.save()
 End for each
 
$0:=$status
```
We can call the function:

```4D
C_OBJECT($result)
$result:=ds.Employees.all().giveRaise(1.05)
```

# REST Server with ORDA Classes

This database is exposed as a [REST server](https://blog.4d.com/multiple-4d-data-sources-interested/) on localhost (port 8044). All of the defined functions in its classes can be called using REST requests in a [POST](https://blog.4d.com/test-the-powerful-4d-rest-server-with-postman/) operation.


## The DataStore Class

The datastore object is retrieved using the **/rest/$catalog** prefix.

We can call our [getCompnayStats()](##The-DataStore-Class) function with the URL: **http://127.0.0.1:8044/rest/$catalog/getCompnayStats**

The response from the server would look like:

```json
{
 "result": [
    {
    "name": "Amazon",
    "address": "123 Example St",
    "numEmployees": 967
    },
    {
    "name": "Microsoft",
    "address": "567 Seattle St",
    "numEmployees": 786
    },
    {
    "name": "4D SAS",
    "address": "555 Another Ave",
    "numEmployees": 98
    }
  ]
}
```

## The DataClass Class
A dataclass object is accessed via the **/rest/dataClassName** prefix

We can call our [hireNewEmployee()](##The-DataClass-Class) function with the URL: **http://127.0.0.1:8044/rest/Employees/hireNewEmployee**

Parameters must be passed as a collection, in the body of the request:

```json
[
 {
 "firstName": "Mary",
 "lastName": "Smith",
 "email": "marysmith@amazon.com",
 "salary": 70000,
 "companyName": "Amazon"
 }
]
```
The response from the server looks like this:

```json
{
  "__entityModel": "Employees",
  "__DATACLASS": "Employees",
  "__KEY": "9",
  "__TIMESTAMP": "2020-08-01T13:08:13.542Z",
  "__STAMP": 1,
  "ID": 9,
  "firstname": "Mary",
  "lastname": "Smith",
  "email": "marysmith@amazon.com",
  "salary": 70000,
  "employer": {
    "__deferred": {
      "uri": "/rest/Companies(4)",
      "__KEY": "4"
     }
   }
}
```

## The Entity Class
An entity object is accessed via the **/rest/dataClassName(key)** prefix, where 'key' is the primary key of the entity.

We can call our [worksInSameCompany()](##The-Entity-Class). This example is for an entity with primary key = 7. It’s accessed via the http://127.0.0.1:8044/rest/Employees(7)/worksInSameCompany/?$attributes=firstName,lastName URL.

We apply the worksInSameCompany() function on this entity and filter the returned attributes to get only firstname and lastname (/?$attributes=firstName,lastName).

Here’s the response from the server:

```json
{
 "__DATACLASS": "Employees",
 "__entityModel": "Employees",
 "__GlobalStamp": 0,
 "__COUNT": 3,
 "__FIRST": 0,
 "__ENTITIES": [
    {
     "__KEY": "5",
     "__TIMESTAMP": "2020-06-16T13:59:51.095Z",
     "__STAMP": 1,
     "firstName": "Ricky",
     "lastName": "Coyle"
    },
    {
     "__KEY": "6",
     "__TIMESTAMP": "2020-06-16T13:59:51.095Z",
     "__STAMP": 1,
     "firstName": "Alonzo",
     "lastName": "Zapata"
    }
  ],
 "__SENT": 3
}
```

## The Entity Selection Class
An entity selection object can be accessed via the filter syntax. For example, /?$filter="firstName='John'" to get all of the employees whos value is 'John'for the firstName attribute.

An entity selection can be accessed through other ways, too so be sure to check the [documentation](https://developer.4d.com/docs/en/REST/gettingStarted.html).

We can call our [giveRaise()](##The-Entity-Selection-Class) function with the URL: **http://127.0.0.1:8044/rest/Employees/giveRaise/?$filter="salary<:1"&$params='[70000]'**

We call the _giveRasie()_ function to all employees who have a salary of less than $70,000.

Parameters must be passed as a collection, in the body of the request:

```json
[
1.05
]
```

Here’s the response from the server (all of the concerned employees have been properly updated):

```json
{
 "result": {
   "success": true
   }
}
```

# Related 4D Documentation Links
* [4D ORDA Docs](https://developer.4d.com/docs/en/ORDA/ordaClasses.htm)
* [ORDA Intro Video](https://youtu.be/L_9YJopIg3A)
* [4D ORDA MasterClass Video](https://youtu.be/Nk8TUzeTF-k)
* [ORDA Entity Selection](https://doc.4d.com/4Dv18R4/4D/18-R4/ORDA-EntitySelection.201-4981856.en.html)
* [4D REST Server Docs](https://developer.4d.com/docs/en/REST/gettingStarted.html)
* [ORDA Classes blog](https://blog.4d.com/orda-classes-to-handle-your-data-model/)
* [ORDA Classes REST blog](https://blog.4d.com/orda-data-model-classes-and-rest/)