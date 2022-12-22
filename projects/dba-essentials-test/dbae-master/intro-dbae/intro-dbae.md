# DBA Essentials workshop series for Oracle Database 21c

## About this workshop

**Oracle DBA Essentials** is a task-oriented, quick start approach to familiarize you with database administration and management. It features the basic know-hows of *Oracle Database 21c* and helps you perform tasks essential to administer Oracle Database.

Estimated workshop time: 30 minutes

Watch this video to learn about the core *Oracle Database Breakthrough Innovations*.

[](youtube:sFQqiGCSh9c)

### What is the Purpose and Scope?

The primary goal of DBA Essentials workshops is to get you started with database administration in short time. Though not an exhaustive guide on complete database features, it mainly focusses on common administrative actions.

### Objectives

In this workshop, you will find workshops from the DBA Essentials series. These workshops run on *Oracle Database 21c*. Some of the workshops uses *Oracle Enterprise Manager (Oracle EM)* as an interface for procedures and tasks. 

### Prerequisites

This lab assumes you have -
 -   An Oracle Cloud account

## Appendix 1: Product and technology overview

In Oracle Database 12c Release 2, the concept of multitenant environment was introduced. A multitenant architecture comprises a Container Database (CDB) that has one or more user-created Pluggable Databases (PDBs). PDBs are fully backward compatible with previous releases before Oracle Database 12c.

<!-- 
The main components of a CDB are *Root*, *seed*, and *PDB*. 

 - **Root**   
	 `CDB$ROOT` stores the Oracle-supplied metadata and common users. An example of metadata is the source code for Oracle-supplied PL/SQL packages. A common user is a database user known across all containers. A CDB has only one root.

 - **Seed**   
	 `PDB$SEED` is the template to create new PDBs. You cannot add or modify objects in the seed. A CDB has only one seed.

 - **PDB**   
	 It is a collection of portable schemas, schema objects, and non-schema objects that interfaces with the Oracle Net client. It contains data and code required to support an application.   
	 Each of these components is a container in itself. In other words, the CDB, the seed, and each PDB is a container. A container has a unique ID and an associated name within the database.
-->

The main components of a CDB are -

 - *Root*
 - *seed*
 - *PDB*

### **Root**

`CDB$ROOT` stores the Oracle-supplied metadata and common users. An example of metadata is the source code for Oracle-supplied PL/SQL packages. A common user is a database user known across all containers. A CDB has only one root.

### **Seed**

`PDB$SEED` is the template to create new PDBs. You cannot add or modify objects in the seed. A CDB has only one seed.

### **PDB**

It is a collection of portable schemas, schema objects, and non-schema objects that interfaces with the Oracle Net client. It contains data and code required to support an application.

Each of these components is a container in itself. In other words, the CDB, the seed, and each PDB is a container. A container has a unique ID and an associated name within the database.

## Appendix 2: Database administration

After installing Oracle Database, you can perform various administrative tasks and activities for monitoring, configuring, and managing your database. 

These tasks are associated with, but not limited to -

 - Oracle home
 - Network environment
 - Database instance and memory
 - Storage structures
 - User accounts and security privileges
 - Backup and recovery
 - Database objects, such as tables, views, indexes, and so on

You will learn the essentials of database administration, how to monitor the health, optimize database performance, and manage the lifetime of your Oracle Database.

Click on the next lab to get started.

## Learn More

 - [Blog on Introducing Oracle Database 21c](https://blogs.oracle.com/database/introducing-oracle-database-21c)

 - [Oracle Database Documentation](https://docs.oracle.com/en/database/oracle/oracle-database/index.html)

 - [Oracle Enterprise Manager Cloud Control (Oracle EMCC)](https://docs.oracle.com/en/enterprise-manager/index.html)

## Acknowledgements

 - **Author** - Manish Garodia, Team Database User Assistance Development
 - **Contributors** - Suresh Rajan
 - **Last Updated By/Date** - Manish Garodia, December 2022
