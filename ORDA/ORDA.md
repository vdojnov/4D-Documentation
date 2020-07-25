# 4D ORDA Documentation 

Below is the table structure we will use as the example:

![alt text](https://github.com/vdojnov/4D-Documentation/blob/master/Table%20Structure%20Image.JPG?raw=true)

* Many to one relationship name: employer
* One to may relationship name: employees 


## Querying From One table:

For retrieving data from your local 4D databse use _ds._ at the begining of query ( i.e _ds.Employee.all()_ ). You can can add remote databases, which will use a different prefix ( i.e _remoteDataStore.Employee.all()_ ) 

Query all employees:

```
$allEmps:= ds.Employee.all()
```
Query the first Employee:

```
$emp:= ds.Employee.all().first()
```
Query the Employees as an Array (Starting from 0,1,2...N):

```
    // Gives you the first employee
$emp0:= ds.Employee.all()[0]

    // Gives you the second employee
$emp1:= ds.Employee.all()[1]

    // Gives you the Nth employee
$empN:= ds.Employee.all()[N]
```

Query by ID where id is 20:

```
$emp:= ds.Employee.get(20)
```


