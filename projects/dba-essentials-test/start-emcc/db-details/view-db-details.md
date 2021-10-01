## View Database Details with Basic SQL commands

This lab walks you through some basic SQL commands on how to log in to the SQL prompt and view the database details. 

Estimated Lab Time: 5 minutes

### What You Need?

- Oracle Database 21c installed

### Set the environment

Open a terminal window and run the `. oraenv` command to set the environment variables, if not already set. Enter the SID `orcl`.

```
$ <copy>. oraenv</copy>
ORACLE_SID = [oracle] ? orcl
The Oracle base has been set to /scratch/u01/app/oracle
```

## **STEP 1**: View Container Details

1. Log in to SQL\*Plus as `SYSDBA`.

    ```
    $ <copy>sqlplus / as sysdba</copy>
    ```

	## Result

    ```
    SQL*Plus: Release 21.0.0.0.0 - Production on Mon Jun 15 16:23:10 2021 
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle.  All rights reserved.

    Connected to:
    Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
    Version 21.3.0.0.0

    SQL>
    ```

2. Check if the database is a multitenant container database.

    ```
    SQL> <copy>select name, cdb, con_id from v$database;</copy>
    ```

	## Output
    ```
    NAME      CDB     CON_ID
    --------- --- ----------
    ORCL      YES          0
    ```
	
3. View the instance name of the container database and verify if the CDB is `OPEN`.

    ```
    SQL> <copy>select instance_name, status, con_id from v$instance;</copy>
    ```

	## Output
    ```
    INSTANCE_NAME    STATUS           CON_ID
    ---------------- ------------ ----------
    orcl             OPEN                  0
    ```

<!--At the conclusion of the lab add this statement:-->
You may proceed to the next lab.

## Acknowledgements

- **Created by/Date**: Dimpi Sarmah, Senior UA Developer, December 2020

- **Contributors**: Suresh Rajan, Manish Garodia

- **Last Updated By/Date**: Manish Garodia, Principal User Assistance Developer, July 2021

## See an issue?

Submit feedback using this [form](https://apexapps.oracle.com/pls/apex/f?p=133:1:::::P1_FEEDBACK:1). Select the *workshop name*, *lab details*, and *step* in your request.  If you don't see the workshop name in the list, enter it manually. If you would like us to follow-up with you, enter your email in the *Feedback Comments* section.


