# TDT4145 - Data Modelling, Databases and Database Management Systems 

## Disclaimer
I am currently studying this course at NTNU and will not have full understanding of the complexity of SQL. This is a **exercise** in writing README's and documenting code. The README file is not complete in any way.

I will be using the book Fundamentals of Database Systems 6th. Edition by Ramez Elmasri, Shamkant B. Navathe. 
![alt text](https://github.com/oddaspa/TDT4145/blob/master/images/Fundamentals_of_Database_Systems,_6th_Edition.png "Fundamentals of Database Systems")

## Installation
![alt text](https://github.com/oddaspa/TDT4145/blob/master/images/MySQL_logo.png "Official MySQL logo")

In this course we will be using the standard MySQL package.
To install this package go to the [offical mySQL website](https://dev.mysql.com/downloads/windows/) (windows link) and choose the MySQL Installer. This is the wizard to install all the packages needed for the course which is mainly the workbench and server. 

## Basics of MySQL
1. [Create a database](#create_db)
2. [Create a table](#create_tb)
3. [Loading data into tables](#load_data)
4. [Retrieve data from the table in various ways](#retrieve_data)
5. [Using multiple tables ](#multiple_tables)


## Theory
1. [Data Modelling Using the Entity-Relationship (ER) Model](#er_model) <br />
1.1. [Using High-Level Conceptual Data Models for Database Design](#database_design) <br />
1.2 [Entity Types, Entity Sets, Attributes, and Keys](#entity_types) <br />
1.3 [Relationship Types, Sets, Roles and Structural Constraints](#rel_types)  
1.4 [Weak Entity Types](#weak_entity)<br />
1.5 [ER Diagrams, Naming Convetions and Design Issues](#er_diagrams) <br />
1.6 [Relationship Types of Degree Higher than Two](#rel_types_higher) <br />
2. [Enhanced Entity-Relationship (EER) Diagrams](#eer)
  2.1 [Subclasses, Superclasses, and Inheritance](#sub_super)<br />
  2.2 [Specialization and Generalization](#spec_gen)<br />
  2.3 [Modeling of UNION types](#union)<br />
3. [Relational Algebra](#relational_algebra)
  3.1 [Relational Model Concepts](#relational_concepts)<br />
  3.2 [Relational Model Constraints and Relational Database Schemas](#relational_constraints)<br />
  3.3 [Update Operations, Transactions and constraint violations](#update_operations)<br />
4. [Mapping from ER/EER to Relational Mapping](#mapping)


<a name="create_db"></a>
### Creating a database 
First of all, _what is a database?_ A database is a collection of related data. By **data** we mean known facts that can be recorded and that have implicit meaning. The database is organized so that it can be easily accessed, managed and updated. We will see data that is organized into rows, columns and tables. A data base has the following implicit properties:
* A database consists of a **miniworld** or the **universe of discourse**, which represents some aspect of the real world.

* A database needs to be a logically coherent collection of data with some inherent meaning. Therefore random items of data cannot correctly be reffered to as a database.

* A database is designed, built, and populated with data for a specific purpose. It has an intended group of users and some preconveived applications in which these users aare interested.

A **database management system (DBMS)** is a collection of **programs** that enable users to create and maintain a database. The DBMS enables us to _define_, _construct_, _manipulate_ and _share data_.

#### Defining the database
Specifying the data types, structures and constraints of the data to be stored in the database.We do this by creating a catalog or dictionary called **meta-data**. 

#### Constructing the database
The process of storing the data collected from the miniworld in a storage medium controlled by the DBMS.

#### Manipulating the database
When you want to know certain aspects of the data within the database, you simply ask it with the use of **queries** These queries can also update the database to reflect the changes from the miniworld. More on queries later.

#### Sharing the database
The soul purpose of most databases is to allow multiple users and programs to access the database simultaneously. 

#### Actually creating a database in MySQL
Lets start with the workbench approach. When you are connected to the server of your choosing simply click the database logo in the far right corner. 

![alt text](https://github.com/oddaspa/TDT4145/blob/master/images/database_logo.png "Click that thingy!")

Now name your new database whatever you want!

Note that database is a synonym with schema in MySQL. Usually a schema is a collection of tables and a Database is a collection of schemas.

If you are more of a fan of the MySQL Shell 
`mysql> CREATE DATABASE foobar`
NB! You should be connected to a server before making a database.

You can also use the `mysql> SHOW DATABASES` to see exsisting databases.

<a name="create_tb"></a>
### Creating a table 
Now its time to fill our database with tables. To create your first table we open a new query tab from the file menu.
![alt text](https://github.com/oddaspa/TDT4145/blob/master/images/new_query_tab.png "New Query Tab!")
In this tab you are able to manipulate your new database. Here we will use commands to create the _entities classes_ and _relation classes_ to design the architecture of the database. Keep in mind that these are classes and **not** actual data.

I am using a [sample set](https://github.com/oddaspa/TDT4145/blob/master/samples/hundeeieredb) for setting up the database created by [Roger Midtstraum](https://www.ntnu.no/ansatte/roger.midtstraum) my professor currently lecturing this course.

The format MySQL is written is as follows: <br />
```sql
CREATE TABLE Person (
	Pnr 	INTEGER NOT NULL,
	Navn 	VARCHAR(20),
	CONSTRAINT Person_PK PRIMARY KEY (Pnr));
```

The `CREATE TABLE foobar` commands tells the query to make a completly new table called foobar. After the name we see the attirbutes of this table. After Pnr we assign the type of values accepted by the attribute. 
<br/>
`INTEGER NOT NULL` is telling the database to only accept integers and that you can't insert a entity that doesnt have a value in this attribute.
<br/>
_Navn_ has the type VARCHAR(20) which is a variable-length, non-Unicode string data. The (20) in this case constrains that the string length. Setting a size helps indicate the type of data you are storing and also can also act as a last-gasp form of validation. 
<br/>
Finally we have the `CONSTRAINT Person_PK PRIMARY KEY (Pnr)`. This is the curical attribute of the Person table. It tells MySQL to use this attribute as the _identification attribute_ of the entities inserted into this table. This syntax is normally used to add PRIMARY KEY constraint on multiple columns. If there is only one value for the PRIMARY KEY one could also simply write `Pnr INTEGER NOT NULL PRIMARY KEY`
 
    

<a name="load_data"></a>
### Loading data into tables 

<a name="retrieve_data"></a>
### Retrieve data from the table in various ways 

<a name="multiple_tables"></a>
### Using multiple tables 

<a name="er_model"></a>
## Data Modelling Using the Entity-Relationship (ER) Model(#er_model)

<a name="database_design"></a>
### 1.1. Using High-Level Conceptual Data Models for Database Design]

<a name="entity_types"></a>
### 1.2. Entity Types, Entity Sets, Attributes, and Keys

<a name="rel_types"></a>
### 1.3. Relationship Types, Sets, Roles and Structural Constraints

<a name="weak_entity"></a>
### 1.4. Weak Entity Types

<a name="er_diagrams"></a>
### 1.5. ER Diagrams, Naming Convetions and Design Issues

<a name="rel_types_higher"></a>
### 1.6. Relationship Types of Degree Higher than Two

<a name="eer"></a>
## 2. Enhanced Entity-Relationship (EER) Diagrams

<a name="sub_super"></a>
### 2.1. Subclasses, Superclasses, and Inheritance

<a name="spec_gen"></a>
### 2.2. Specialization and Generalization

<a name="union"></a>
### 2.3 Modeling of UNION types

<a name="relational_algebra"></a>
## 3. Relational Algebra

<a name="relational_concepts"></a>
### 3.1 Relational Model Concepts
  
<a name="relational_constraints"></a>
### 3.2 Relational Model Constraints and Relational Database Schemas

<a name="update_operations"></a>
### 3.3 Update Operations, Transactions and constraint violations

<a name="mapping"></a>
## 4. Mapping from ER/EER to Relational Mapping
