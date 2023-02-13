# Use Data Recovery Advisor to Repair Failures  

## Introduction

The Data Recovery Advisor is an Oracle database feature that automatically diagnoses data failures, determines and presents appropriate repair options, and performs repairs if requested by the user. By providing a centralized tool for automated data repair, Data Recovery Advisor improves the manageability and reliability of an Oracle database.

**Note:** Data Recovery Advisor can only be used to diagnose and repair failures in multitenant container databases (CDBs). It is not supported for pluggable databases (PDBs).

RMAN provides a command-line interface to the Data Recovery Advisor. You can use the following RMAN commands to diagnose and repair data failures for the Oracle database, including for Oracle RAC databases:

- `LIST FAILURE`: Use this command to view problem statements for failures and the effect of these failures on database operations. A failure number identifies each failure.

- `ADVISE FAILURE`: Use this command to view repair options, including both automated and manual repair options.

- `REPAIR FAILURE`: Use this command to automatically repair failures listed by the most recent `ADVISE FAILURE` command.

Estimated Time: 20 minutes


### **Objectives**
In this lab, you will:
- Perform Oracle advised recovery

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


## Task 1: Perform Oracle Advised Recovery

The recovery process begins when you either suspect or discover a failure. You can discover failures in many ways, including error messages, alerts, trace files, and health checks. You can then use Data Recovery Advisor to gain information and advice about failures and repair them automatically.

1. Invoke `SQL*Plus` prompt and connect as the `sysdba` user.

    ```
    $ <copy>sqlplus / as sysdba</copy>
    ```

    ## Output

    ```
    SQL*Plus: Release 21.0.0.0.0 - Production on Mon Jul 26 07:50:23 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle.  All rights reserved.

    Connected to:
    Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
    Version 21.3.0.0.0

    SQL>
    ```

2. Create the following `regions` table in the database.

    ```
    <copy>CREATE TABLESPACE hr DATAFILE 'hrts.dbf';
    CREATE TABLE regions (id number(2), name varchar2(20)) TABLESPACE hr;
    INSERT INTO regions VALUES (1,'Europe');
    INSERT INTO regions VALUES (2,'America');
    INSERT INTO regions VALUES (3,'Asia');
    INSERT INTO regions VALUES (4,'Middle East');
    commit;</copy>
    ```

3. Query the `regions` table.

    ```
    SQL> <copy>SELECT * FROM regions;</copy>
    ```

    ## Output

    ```

ID NAME
---------- --------------------
         1 Europe
         2 America
         3 Asia
         4 Middle East

SQL>

    ```

4. Query the `v$datafile` view to determine the file name of the file that belongs to the `hr` tablespace.

    ```
    SQL> <copy>SELECT name FROM v$datafile;</copy>
    ```

    ## Output

    ```
    NAME
    --------------------------------------------------------------------------------
    /u01/app/orauser/oradata/ORCL/system01.dbf
    /u01/app/orauser/oradata/ORCL/sysaux01.dbf
    /u01/app/orauser/oradata/ORCL/undotbs01.dbf
    /u01/app/orauser/oradata/ORCL/pdbseed/system01.dbf
    /u01/app/orauser/oradata/ORCL/pdbseed/sysaux01.dbf
    /u01/app/orauser/oradata/ORCL/users01.dbf
    /u01/app/orauser/oradata/ORCL/pdbseed/undotbs01.dbf
    /u01/app/orauser/oradata/ORCL/orclpdb/system01.dbf
    /u01/app/orauser/oradata/ORCL/orclpdb/sysaux01.dbf
    /u01/app/orauser/oradata/ORCL/orclpdb/undotbs01.dbf
    /u01/app/orauser/oradata/ORCL/orclpdb/users01.dbf

    NAME
    --------------------------------------------------------------------------------
    /u01/app/orauser/oradata/ORCL/orclpdb/mgmt_ecm_depot1.dbf
    /u01/app/orauser/oradata/ORCL/orclpdb/mgmt.dbf
    /u01/app/orauser/homes/OraDB21Home1/dbs/hrts.dbf

    14 rows selected.

    SQL>
    ```

5. Use the `host` command to obtain an operating system prompt.

6. Use the Linux `mv` command to move the data file belonging to the `hr` tablespace to `$HOME/hrts.dbf`.

    ```
    $ <copy>mv /u01/app/orauser/homes/OraDB21Home1/dbs/hrts.dbf $HOME/hrts.dbf</copy>
    ```

7. Use the `exit` command to return to `SQL*Plus` prompt and then exit the `SQL*Plus` prompt`.`

8. Invoke `SQL*Plus` prompt and connect as the `sysdba` user.

    ```
    $ <copy>./sqlplus / as sysdba</copy>
    ```

    ## Output

    ```
    SQL*Plus: Release 21.0.0.0.0 - Production on Mon Jul 26 08:00:35 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle.  All rights reserved.

    Connected to:
    Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
    Version 21.3.0.0.0

    SQL>
    ```

9. Query the `regions` table. You will get an error message that the table is not available.

    ```
    SQL> <copy>SELECT * FROM regions;</copy>
    ```

    ## Output

    ```
    SELECT * FROM regions
                  *
    ERROR at line 1:
    ORA-01116: error in opening database file 18
    ORA-01110: data file 18:
    '/u01/app/orauser/homes/OraDB21Home1/dbs/hrts.dbf'
    ORA-27041: unable to open file
    Linux-x86_64 Error: 2: No such file or directory
    Additional information: 3

    SQL>
    ```

10. Exit the `SQL*Plus` prompt`.`

11. Invoke RMAN and connect to the target database as the `SYSBACKUP` user.

    ```
    $ <copy>./rman target sysbackup</copy>
    ```

    ## Output

    ```
    Recovery Manager: Release 21.0.0.0.0 - Production on Mon Jul 26 08:01:38 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle and/or its affiliates.  All rights reserved.

    target database Password:
    connected to target database: ORCL (DBID=1604279435)

    RMAN>
    ```

12. Use the following command to list all the failures known to the Data Recovery Advisor. In the following output, you can see that one failure with failure id 18302 is listed.

    ```
    RMAN> <copy>list failure;</copy>
    ```

    ## Output

    ```
    using target database control file instead of recovery catalog
    Database Role: PRIMARY

    List of Database Failures
    =========================

    Failure ID Priority Status    Time Detected Summary
    ---------- -------- --------- ------------- -------
    18302      HIGH     OPEN      26-JUL-21     One or more non-system datafiles are missing

    RMAN>
    ```

13. Use the following command to determine repair options, both automatic and manual. In the following output, you can see that one failure with failure id `18302` is listed with summary and restore options.

    ```
    RMAN> <copy>advise failure;</copy>
    ```

    ## Output

    ```
    Database Role: PRIMARY

    List of Database Failures
    =========================

    Failure ID Priority Status    Time Detected Summary
    ---------- -------- --------- ------------- -------
    18302      HIGH     OPEN      26-JUL-21     One or more non-system datafiles are missing

    analyzing automatic repair options; this may take some time
    allocated channel: ORA_DISK_1
    channel ORA_DISK_1: SID=305 device type=DISK
    analyzing automatic repair options complete

    Mandatory Manual Actions
    ========================
    no manual actions available

    Optional Manual Actions
    =======================
    1. If file /u01/app/orauser/homes/OraDB21Home1/dbs/hrts.dbf was unintentionally renamed or moved, restore it

    Automated Repair Options
    ========================
    Option Repair Description
    ------ ------------------
    1      Restore and recover datafile 18  
      Strategy: The repair includes complete media recovery with no data loss
      Repair script: /u01/app/orauser/diag/rdbms/orcl/orcl/hm/reco_1733332984.hm

    RMAN>
    ```



14. Use the following command to correct the problems. In the following output, you can see that the failure is repaired and the datafile is recovered.

    ```
    RMAN> <copy>repair failure;</copy>
    ```

    ## Output

    ```
    Strategy: The repair includes complete media recovery with no data loss
    Repair script: /u01/app/orauser/diag/rdbms/orcl/orcl/hm/reco_1733332984.hm

    contents of repair script:
       # restore and recover datafile
       sql 'alter database datafile 18 offline';
       restore ( datafile 18 );
       recover datafile 18;
       sql 'alter database datafile 18 online';

    Do you really want to execute the above repair (enter YES or NO)? YES
    executing repair script

    sql statement: alter database datafile 18 offline

    Starting restore at 26-JUL-21
    using channel ORA_DISK_1

    creating datafile file number=18 name=/u01/app/orauser/homes/OraDB21Home1/dbs/hrts.dbf
    restore not done; all files read only, offline, excluded, or already restored
    Finished restore at 26-JUL-21

    Starting recover at 26-JUL-21
    using channel ORA_DISK_1

    starting media recovery
    media recovery complete, elapsed time: 00:00:00

    Finished recover at 26-JUL-21

    sql statement: alter database datafile 18 online
    repair failure complete

    RMAN>
    ```

15. Exit from RMAN.

16. Invoke `SQL*Plus` prompt and connect as the `sysdba` user.

    ```
    $ <copy>./sqlplus / as sysdba</copy>
    ```

    ## Output

    ```
    SQL*Plus: Release 21.0.0.0.0 - Production on Mon Jul 26 08:02:41 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle.  All rights reserved.


    Connected to:
    Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
    Version 21.3.0.0.0

    SQL>
    ```

17. Query the `regions` table.

    ```
    SQL> <copy>SELECT * FROM regions;</copy>
    ```

    ## Output

    ```

ID NAME
---------- --------------------
         1 Europe
         2 America
         3 Asia
         4 Middle East

SQL>

    ```

18. Exit from `SQL*Plus` prompt.

You may now **proceed to the next lab**.


## Acknowledgements

- **Author**: Suresh Mohan, Database User Assistance Development Team

- **Contributors**: Suresh Rajan, Manish Garodia, Subhash Chandra, Ramya P

- **Last Updated By & Date**: Suresh Mohan, October 2021
