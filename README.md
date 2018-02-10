# TDT4145 - Data Modelling, Databases and Database Management Systems 

## Disclaimer
I am currently studying this course at NTNU and will not have full understanding of the complexity of SQL and might be . This is a **exercise** in writing README's and documenting code. 

## Installation
![alt text](https://github.com/oddaspa/TDT4145/blob/master/images/MySQL_logo.png "Official MySQL logo")

In this course we will be using the standard MySQL package.
To install this package go to the [offical mySQL website](https://dev.mysql.com/downloads/windows/) (windows link) and choose the MySQL Installer. This is the wizard to install all the packages needed for the course which is mainly the workbench and server. 

## Basics


1. [Create a database](#create_db)
2. [Create a table](#create_tb)
3. [Loading data into tables](#load_data)
4. [Retrieve data from the table in various ways](#retrieve_data)
5. [Using multiple tables ](#multiple_tables)


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

<a name="create_tb"></a>
### Creating a table 

<a name="load_data"></a>
### Loading data into tables 

<a name="retrieve_data"></a>
### Retrieve data from the table in various ways 

<a name="multiple_tables"></a>
### Using multiple tables 
