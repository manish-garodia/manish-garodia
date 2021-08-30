# Oracle Database Administration Essentials

## About this workshop

This workshop includes the labs from all workshops under Oracle Database Administration Essentials for Database 21c. 

Estimated Workshop Time: XX hours 

Watch this video to learn about the core *Oracle Database Breakthrough Innovations*.

[](youtube:sFQqiGCSh9c)

> Read the blog on the core Oracle Database 21c features - [Introducing Oracle Database 21c](https://blogs.oracle.com/database/introducing-oracle-database-21c).

> ![Introducing Oracle Database 21c](../install-db/intro-install/images/intro-db21-vp-blog.png)

### Prerequisites

- An Oracle Cloud Account - Please view this workshop's LiveLabs landing page to see which environments are supported

  **Note:** If you have a **Free Trial** account, when your Free Trial expires your account will be converted to an **Always Free** account. You will not be able to conduct Free Tier workshops unless the Always Free environment is available. **[Click here for the Free Tier FAQ page.](https://www.oracle.com/cloud/free/faq.html)**

## What this workshop is about?

**Oracle Database Administration Essentials** is a task-oriented, quick start approach to familiarize you with Oracle Database administration. It features the basic know-hows of Oracle Database and helps you perform essential tasks to administer Oracle Database.

These tasks include, but are not limited to, configuring and managing - 

- Network environment
- Memory and space
- Storage structures
- User accounts and roles
- Backup and recovery
- Database objects, such as tables, views, indexes, and so on.

You will learn the essentials of Oracle Database Administration, how to monitor the health, optimize the performance, and manage the lifetime of the database. 


### What is the Purpose and Scope?

The primary goal of Oracle Database Administration Essentials is to get you started with database administration in short time. It is not an exhaustive guide on all database elements, but is mainly focused on common administrative actions.

In this workshop, you will learn about installing and configuring Oracle Database. The workshop uses Oracle *Enterprise Manager Cloud Control (EMCC)* as an interface for procedures and tasks. 


## Product and Technology Overview

In Oracle Database 12c Release 2, the concept of multitenant environment was introduced. A multitenant architecture comprises a Container Database (CDB) that has one or more user-created Pluggable Databases (PDBs). The PDBs are fully backward compatible with previous releases before Oracle Database 12c.

The main components of a CDB are - 

- *Root*, *seed*, and *PDB*.  

    ## Root

	`CDB$ROOT` stores the Oracle-supplied metadata and common users. An example of metadata is the source code for Oracle-supplied PL/SQL packages. A common user is a database user known across all containers. A CDB has only one root.

    ## Seed

	`PDB$SEED` is the template to create new PDBs. You cannot add or modify objects in the seed. A CDB has only one seed.

    ## PDB

	It is a collection of portable schemas, schema objects, and non-schema objects that interfaces with the Oracle Net client. It contains data and code required to support an application.

	Each of these components is a container in itself. In other words, the CDB, the seed, and each PDB is a container. A container has a unique ID and an associated name within the database.  

Let us install Oracle Database 21c as explained in the subsequent labs and explore these options in detail.


## Learn More

- [Oracle Database Documentation](https://docs.oracle.com/en/database/oracle/oracle-database/index.html)
- [Oracle Cloud Infrastructure Documentation](https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/overview.htm)

Click on the next lab to [get started](#next).

## Acknowledgements

- **Author**: Manish Garodia, Principal User Assistance Developer, Database Technologies

- **Contributors**: Suresh Rajan (Senior Manager, User Assistance Development)

<!-- Prakash Jashnani (Manager, User Assistance Development), Subhash Chandra (Principal User Assistance Developer), Subrahmanyam Kodavaluru (Principal Member Technical Staff), Dharma Sirnapalli (Principal Member Technical Staff)-->

- **Last Updated By/Date**: Manish Garodia, September 2021
