# Recover a Dropped Table Using Oracle Flashback Drop

## Introduction

Oracle Flashback Drop enables you to reverse the effects of dropping (deleting) a table, returning the dropped table to the database along with dependent objects such as indexes and triggers. This feature stores dropped objects in a recycle bin, from which they can be retrieved until the recycle bin is purged, either explicitly or because space is needed.

As with Flashback Table, you can use Flashback Drop while the database is open. Also, you can perform the flashback without undoing changes in objects not affected by the Flashback Drop operation. Flashback Table is more convenient than forms of media recovery that require taking the database offline and restoring files from backup.

**Note:** A table must reside in a locally managed tablespace so that you can recover the table using Flashback Drop. Also, you cannot recover tables in the `SYSTEM` tablespaces with Flashback Drop, regardless of the tablespace type.

Estimated Time: 20 minutes

### **Objectives**
In this lab, you will:
- Create a new table
- Drop a table
- Recover the dropped table

### **Prerequisites**
This lab assumes:
- The Oracle database 21c software is installed, and a starter database is already created.
- In the terminal window, you set the environment variables for the `orcl` database.
    ```
    $ . oraenv
    ORACLE_SID = [oracle] ? orcl
    The Oracle base has been set to /u01/app/oracle
    ```
- In the terminal window, you changed the current working directory to `$ORACLE_HOME/bin` where Oracle DBCA is located.


## Task 1: Create a New Table

To learn about Flashback Drop, you will create a new table named `regions_hist` and then drop it. The database moves the table to the recycle bin so that it can be retrieved with the Flashback Drop feature.

1. Invoke `SQL*Plus` prompt and connect as the `SYSTEM` user.

    ```
    $ <copy>sqlplus system</copy>
    ```

    ## Output

    ```
    SQL*Plus: Release 21.0.0.0.0 - Production on Tue Jul 13 05:39:36 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle.  All rights reserved.

    Enter password:
    Last Successful login time: Tue Jul 13 2021 05:38:55 +00:00

    Connected to:
    Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
    Version 21.3.0.0.0

    SQL>
    ```

2. Use the following command to open the pluggable database. In this lab, `orclpdb` is the pluggable database.

    ```
    SQL> <copy>alter session set container=orclpdb;</copy>
    ```

3. Use the following command to create a table named `hr.regions_hist` with the same structure and content as the `hr.regions` table.

    ```
    SQL> <copy>create table hr.regions_hist as select * from hr.regions; </copy>
    ```

4. Query the `hr.regions_hist` table.

    ```
    SQL> <copy>select * from hr.regions_hist;</copy>
    ```


## Task 2: Drop a Table

In this section, you delete the `hr.regions_hist` table that you created in the previous section.

1. Use the following command to delete the table.

    ```
    SQL> <copy>drop table hr.regions_hist;</copy>
    ```

2. Query the `hr.regions_hist` table. Notice that you get an error because the table is deleted.

    ```
    SQL> <copy>select * from hr.regions_hist;</copy>
    ```


## Task 3: Recover the Dropped Table

In this section, you recover the `hr.regions_hist` table from the recycle bin.

1. Use the following command to recover the deleted table.

    ```
    SQL> <copy>flashback table hr.regions_hist to before drop;</copy>
    ```

2. Query the `hr.regions_hist` table to verify that the data has been restored.

    ```
    SQL> <copy>select * from hr.regions_hist;</copy>
    ```

3. Exit from `SQL*Plus` prompt`.`

Congratulations! You have successfully completed this workshop on *Performing Database Backup and Recovery Operations*.


## Acknowledgements

- **Author**: Suresh Mohan, Database User Assistance Development Team

- **Contributors**: Suresh Rajan, Manish Garodia, Subhash Chandra, Ramya P

- **Last Updated By & Date**: Suresh Mohan, October 2021
