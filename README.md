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
3. [Data Manipulation Language](#DML)
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
2. [Enhanced Entity-Relationship (EER) Diagrams](#eer) <br />
  2.1 [Subclasses, Superclasses, and Inheritance](#sub_super)<br />
  2.2 [Specialization and Generalization](#spec_gen)<br />
  2.3 [Modeling of UNION types](#union)<br />
3. [Relational Algebra](#relational_algebra) <br />
  3.1 [Relational Model Concepts](#relational_concepts)<br />
  3.2 [Relational Model Constraints and Relational Database Schemas](#relational_constraints)<br />
  3.3 [Update Operations, Transactions and constraint violations](#update_operations)<br />
4. [Mapping from ER/EER to Relational Mapping](#mapping) <br />
5. [Normalization](#norm) <br />



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
![alt text](https://github.com/oddaspa/TDT4145/blob/master/images/new_query_tab.png "New Query Tab!") <br/>
In this tab you are able to manipulate your new database. Here we will use commands to create the _entity classes_ and _relation classes_ to design the architecture of the database. Keep in mind that these are classes and **not** actual data.

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
 
    

<a name="DML"></a>
### Data Manipulation Language  
Fairly simple! Use the `INSERT INTO` command and specify which table you want to load data into. Following this you should have the values of the entity. Example:
```sql
INSERT INTO Person VALUES(1, "Olav);
```
To update information stored in the we use the `UPDATE` command. 
```sql
UPDATE Person
	SET Navn = "William" 
	Where Navn = "Olav"
```
To delete information we use the delete information use the `DELETE` command.
```sql
DELETE FROM Person
	Where Navn = "William"
```


<a name="retrieve_data"></a>
### Retrieve data from the table in various ways 
Now the `SELECT` statement comes in handy. It tells our database to select information stored by giving some constraints. 
It is normally given in this format: 
```sql
SELECT <attributes> FROM <tables>
	WHERE < logical constraint applies>
```
Keep in mind that relational database management systems (RDBMS) are based on bag semantics rather than set semantics and thus gives duplicates in the result table. <br />
To only have unique values in the query use `DISTINCT` command after the `SELECT` command:
```sql
SELECT DISTINCT Navn FROM Person;
```
<a name="multiple_tables"></a>
### Using multiple tables 
Now we are ready for JOIN operators. <br />
Lets work with some tables. 
```sql
CREATE TABLE bbteam (
	team_ID		INTEGER NOT NULL,
	team_name 	VARCHAR(20),
	CONSTRAINT bbteam_PK PRIMARY KEY (team_ID));


CREATE TABLE bbplayer (
	player_ID	INTEGER NOT NULL,
	player_name 	VARCHAR(20),
	player_team_ID	INTEGER,
	CONSTRAINT bbplayer_PK PRIMARY KEY (player_ID), 
	CONSTRAINT bbplayer_FK FOREIGN KEY (player_team_ID) REFERENCES bbteam(team_ID)
							ON UPDATE CASCADE
							ON DELETE NO ACTION);
```
We have created two enitiy classes called _bbplayer_ and _bbteam_. Notice that bbplayer have constraints on when the _foreign key_ updates. The `ON UPDATE CASCADE` command tells SQL that whenever the FK is updated in the bbteam table, update it in the bbplayer table as well. The `ON DELETE NO ACTION` command tells SQL to **not** delete the player from the table if the team is deleted from the team table. Now lets add some data.
```sql
INSERT INTO bbteam VALUES(100, "Bulls");
INSERT INTO bbteam VALUES(101, "Lakers");
INSERT INTO bbteam VALUES(102, "Warriors");
INSERT INTO bbteam VALUES(103, "Trondheim");

INSERT INTO bbplayer VALUES(1, "Jordan", 100);
INSERT INTO bbplayer VALUES(2, "O'Neal", 101);
INSERT INTO bbplayer VALUES(3, "Curry", 102);
INSERT INTO bbplayer VALUES(4, "Bryant", 101);
INSERT INTO bbplayer VALUES(5, "Hancock", NULL);
```
Notice how we needed to create the teams **before** the players because some of the players are dependent on the teams to be created. <br />

## Inner Join
Lets begin with the most 'natural' join. The inner join.
```sql
SELECT * FROM bbplayer AS P JOIN bbteam AS T ON P.player_team_ID = T.team_ID;
```
What we do now is give me all the columns og bbplayer and match them up on with the bbteam columns on  the condition where the team_id is matching up. 
<br />
![alt text](https://github.com/oddaspa/TDT4145/blob/master/images/join_bbplayer_team.png "New Query Tab!") 
As you can see we don't see all players nor all teams. This is because when we add the condidition matches. 

## Cross Join
When we skip the condition at the end we get a cross join. 

<a name="er_model"></a>
## Data Modelling Using the Entity-Relationship (ER) Model
![alt text](https://github.com/oddaspa/TDT4145/blob/master/images/ER_Diagram.png "Brief overview")

An entity relationship diagram shows the relationshiås of entity classes stored in a database. An entity in this context is a component of data. In other words, ER diagrams illustrate the logical structure of databases. In these diagrams we use entity classes, relationships, attributes and cardinality to provide suffient information to create relational database schemas for later use.

[comment]: <> (<a name="database_design"></a> (### 1.1. Using High-Level Conceptual Data Models for Database Design))

<a name="entity_types"></a>
### 1.1. Entity Types, Entity Sets, Attributes, and Keys
There is a key differnece to entity types and entity sets. Lets consider this example
```
Student
ID	Name	Age
1	Jane	24
2	John	27

```
An entity is something which has a real existance. Tuple one which contains information about Jane shows her ID, name and age, which has existance in the real world. Remember a database is not a proper database if it does not reflect real data in its mini world. 
The tuple one is an entity. So we may say that **each tuple is an entity**. 
#### Entity Type
It is the class that defines the structure of the entities within it. They are the fundamental building blocks of systems in databases and directly correspond to database tables. So Student is an entity type which contains the entities of Jane and John.

#### Entity Set
An entity set is the set of objects of the same entity type. So the set of *one or more* entites of the Student entity type is an entity set.

#### Attributes
Properties of an entity are reffered as attributes. They contain the values of the specific entities. For example, ID, name and age are properties of the entites in the Student table, hence these are attributes.
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


<a name="norm"></a>
## 5. Database Normalization
Database Normalization is a technique of organizing the data in the database. Normalization is a systematic approach of decomposing tables to eliminate data redundancy(repetition) and undesirable characteristics like Insertion, Update and Deletion Anomalies. It is a multi-step process that puts data into tabular form, removing duplicated data from the relation tables.

Normalization is used for mainly two purposes:

* Eliminating reduntant(useless) data.
* Ensuring data dependencies make sense i.e data is logically stored.
[ref (09.04.18)](https://www.studytonight.com/dbms/database-normalization.php)

## Insertion Anomalies
Insertion anomalies occurs when certain attributes cannot be inserted into the database without the presence of other attributes. 
Example: Your data base consists of a deparment of education. In this database you have one table with student name, student ID, class enrolled and class ID. Let's also fill it with some enteties. 
![alt text](https://github.com/oddaspa/TDT4145/blob/master/images/Insertion_anomaly.png "Your database!") <br/>
In this database we cannot add a new course without a student participating. 
Let's assume that the course 4145 is very popular and 100 more students want to participate in the course. We would need to write the code and name 100 times more in the same database! <br />
Both of these are insertion anomalies.

## Update Anomalies
An update anomaly exists when one or more instances of duplicated data is updated, but not all. 
Example: Considering the database in the previous example, if we where to change the name "Intro to Databases" to "Fundamentals of databases" we would need to alter the data for every student that is enrolled in that class.

## Delete Anomalies
A deletetion amomaly occurs when certain attributes are lost because of the deletion of other attributes.
Example: Edgar F. Codd leaves the department and is deleted from the database. Now the data for the class 1012 is also lost(unintentionally). 

### 5.1 First Normal Form - 1NF
First lets look at some of the attributes the first normal form has:
1. Values of each attribute are atomic.
2. No composite values.
3. All entries in any column must be of the same kind.
4. Each Column must have a unique name.
5. No two rows are identical.

Lets also keep in mind that all normal forms greater than the first presupposes the first normal form.

First step in database normalization. This section stresses the atomicity of databases which is also the first of the [ACID](https://en.wikipedia.org/wiki/ACID) attributes. Atomicity prevents updates to the database occurring only partially, which can cause greater problems than rejecting the whole series outright. Now the atomicity problem does not exist in the table we created. Just check the list above! If however we where to put all the classes enrolled in the same attribute of the student (Course: [4145, 4136] ) then we would not have an atomic attribute, and thus not 1NF.
### 5.2 Secound Normal Form - 2NF
*A relation is said to be in 2NF if it is in 1NF and all non-prime attributes are fully functional depentdent on each key of R.* 
Let's find all the possible candidate keys of this relationship.
``` 
F = { 	A 	-> 	BCDEF
	BC 	->	ADEF
	B 	-> 	F
	D 	-> 	E
	}

A+ =	ABCDEF
Candinate Key = A, BC 	
NPA = D, E, F
```
Prime attributes are the attributes that are present in any candidate key. Similarly non-prime attributes are the attributes that are not present in any candidate key. In this example A, B and C are the prime attributes.
Here we see that the NPA F is partially functional dependent on B and not fully functional dependent on BC. Therefore this is not in 2NF. 
Let's break it down.
![alt text](https://github.com/oddaspa/TDT4145/blob/master/images/2NF.png "Break them into two relationships") <br/>
Now R1 is in 2Nf.
### 5.3 Third Normal Form - 3NF
The criteria for 3NF are as following:
1. The relationship R is in second normal form (2NF).
2. Every non-prime attribute is non-transitively dependent on every key in R.

Consider the following:
``` 
R(A, B, C, D)
lets assume CK = BC (NPA = CD)

```
For this to be in 3NF there should not be a relation C -> D beacuse then a non-prime attribute determines another non-prime attribute.

Lets continue the example from 2NF.
