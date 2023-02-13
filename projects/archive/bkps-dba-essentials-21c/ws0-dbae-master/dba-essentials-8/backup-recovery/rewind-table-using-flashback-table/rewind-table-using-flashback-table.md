# Rewind a Table Using Oracle Flashback Table

## Introduction

Oracle Flashback Table enables you to rewind one or more tables to their contents at a previous time without affecting other database objects. Thus, you can recover from logical data corruptions such as table rows added or deleted accidentally. Unlike point-in-time recovery, the database remains available during the flashback operation.

Estimated Time: 20 minutes

### **Objectives**
In this lab, you will:
- Enable row movement on a table
- Simulate user error
- Perform flashback table operation

### **Prerequisites**
This lab assumes:
- The Oracle database 21c software is installed and a starter database is already created.
- In the terminal window, you set the environment variables for the _orcl_ database.
    ```
    $ . oraenv
    ORACLE_SID = [oracle] ? orcl
    The Oracle base has been set to /u01/app/oracle
    ```
- In the terminal window, you changed the current working directory to $ORACLE\_HOME/bin where Oracle DBCA is located.


## Task 1: Enable Row Movement on a Table

Before using Flashback Table, you must ensure that row movement is enabled on the table to be flashed back or returned to a previous state. Row movement indicates that row IDs will change after the flashback occurs. This restriction exists because if an application stored row IDs before the flashback, there is no guarantee that the row IDs will correspond to the same rows after the flashback.

In this task, you enable row movement on the `hr.regions` table.

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

2. Use the following command to open the pluggable database. In this lab, `orclpdb` is the pluggable database.

    ```
    SQL> <copy>alter session set container=orclpdb;</copy>
    ```

3. Use the following command to enable row movement on the `hr.regions` table.

    ```
    SQL> <copy>alter table hr.regions enable row movement;<.copy>
    ```

## Task 2: Simulate User Error

In this task, you simulate user error by changing data in the `hr.regions` table.

1. Query the `hr.regions` table.

    ```
    SQL> <copy>select * from hr.regions;</copy>
    ```

2. Simulate user error by executing the following commands to change the value in the `region_name` column in all the rows and `commit`.

    ```
    SQL> <copy>update hr.regions set region_name = 'ORACLE';</copy>
    SQL> commit;
    ```

3. Query the `hr.regions` table again to verify that the `region_name` column for all the rows is updated to `"ORACLE"`.

    ```
    SQL> <copy>select * from hr.regions;</copy>
    ```

## Task 3: Perform Flashback Table Operation

In this task, you rewind the `hr.regions` table to a point before you performed the update to simulate user error.

1. Use the following command to flashback table to a time before you performed the update to the `hr.regions` table.

    ```
    SQL> <copy>flashback table hr.regions to timestamp to_timestamp('2016-08-11 07:30:00', 'YYYY-MM-DD HH:MI:SS');</copy>
    ```

2. Query the `hr.regions` table to verify that the values in the `region_name` column have been restored.

    ```
    SQL> <copy>select * from hr.regions;</copy>
    ```

3. Exit from `SQL*Plus` prompt.

You may now **proceed to the next lab**.



## Acknowledgements

- **Author**: Suresh Mohan, Database User Assistance Development Team

- **Contributors**: Suresh Rajan, Manish Garodia, Subhash Chandra, Ramya P

- **Last Updated By & Date**: Suresh Mohan, October 2021
