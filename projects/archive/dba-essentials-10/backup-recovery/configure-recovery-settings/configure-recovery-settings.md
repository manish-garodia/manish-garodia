# Configure Recovery Settings

## Introduction
This lab shows you how to configure the Oracle database for several recovery settings.  

Estimated Time: 20 minutes

### **Objectives**
In this lab, you will:
- Configure the fast recovery area
- Enable archiving of redo log files
- Enable flashback database

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




## Task 1: Configure the Fast Recovery Area

The fast recovery area is an Oracle-managed directory on a file system or Oracle Automatic Storage Management disk group that provides a centralized storage location for backup and recovery files. Oracle creates archived logs and flashback logs in the fast recovery area. Oracle automatically manages the fast recovery area, deleting files that are no longer needed.

Oracle Recovery Manager (RMAN) can store its backup sets and image copies in the fast recovery area and use them when restoring files during media recovery. If the fast recovery area is configured, RMAN automatically backs up to the fast recovery area when you issue the RMAN `backup` command without specifying a backup destination.

In this task, you configure the fast recovery area using the following steps.

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


2. Use the following command to view the settings for all initialization parameters containing "recovery" in the name.

    ```
    SQL> <copy>show parameter recovery</copy>
    ```

    ## Output

    ```
    NAME                          TYPE        VALUE
    ----------------------------- ----------- -------------------------------------
    db_recovery_file_dest         string      /u01/app/oracle/recovery_area
    db_recovery_file_dest_size    big integer 13776M
    recovery_parallelism          integer     0
    remote_recovery_file_dest     string

    SQL>
    ```
    **Note:** The `db_recovery_file_dest` parameter sets the location of the fast recovery area. Oracle recommends placing the fast recovery area on a separate storage device from the database files.

    **Note:** The `db_recovery_file_dest_size` parameter shows the size of your fast recovery area. The size of your fast recovery area may differ from what is shown in this example. Generally, the default size present for the fast recovery area might not be sufficient for your files.


3. Use the following command to set the fast recovery area size to a larger size to store the database files sufficiently. In this case, it is set to 10GB.

    ```
    SQL> <copy>alter system set db_recovery_file_dest_size=10G;</copy>
    ```

    ## Output

    ```
    System altered.

    SQL>
    ```


4. Use the following command again to view the altered settings. You can see that the `db_recovery_file_dest_size` parameter is set to 10GB.

    ```
    SQL> <copy>show parameter recovery</copy>
    ```

    ## Output

    ```
    NAME                          TYPE        VALUE
    ----------------------------- ----------- -------------------------------------
    db_recovery_file_dest         string      /u01/app/oracle/recovery_area
    db_recovery_file_dest_size    big integer 10G
    recovery_parallelism          integer     0
    remote_recovery_file_dest     string

    SQL>
    ```

    **Note:** You can also execute this command in RMAN.



## Task 2: Enable Archiving of Redo Log Files

To back up the database while it is open or to be able to perform complete or point-in-time media recovery, you must enable the archiving of redo log files. To do so, you start the database in `ARCHIVELOG` mode.

In this task, you enable archiving of the redo log files using the following steps.

1. Invoke `SQL*Plus` prompt and log in as the `SYSDBA` user.

    ```
    $ <copy>sqlplus / as sysdba</copy>
    ```

    ## Output

    ```
    SQL*Plus: Release 21.0.0.0.0 - Production on Tue Jul 13 05:54:47 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle.  All rights reserved.

    Connected to:
    Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
    Version 21.3.0.0.0

    SQL>
    ```

2. Use the following command to determine whether your database is in `ARCHIVELOG` mode. In this output, you can see that the database log mode is in `No Archive Mode`.

    ```
    SQL> <copy>archive log list</copy>
    ```

    ## Output

    ```
    Database log mode              No Archive Mode
    Automatic archival             Disabled
    Archive destination            USE_DB_RECOVERY_FILE_DEST
    Oldest online log sequence     23
    Current log sequence           25

    SQL>
    ```

3. Start the RMAN command prompt.

    ```
    $ <copy>rman</copy>
    ```

    ## Output

    ```
    Recovery Manager: Release 21.0.0.0.0 - Production on Tue Jul 13 05:56:20 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle and/or its affiliates.  All rights reserved.

    RMAN>
    ```

4. To enable archiving, you must mount the database but not open it. Use the `shutdown immediate` command to shut down the database instance.

    ```
    RMAN> <copy>shutdown immediate</copy>
    ```

    ## Output

    ```
    database closed
    database dismounted
    Oracle instance shut down
    ```
5. Use the `startup mount` command to start the database instance and mount the database.

    ```
    RMAN> startup mount
    ```  

    ## Output

    ```
    connected to target database (not started)
    Oracle instance started
    database mounted

    Total System Global Area    1040185728 bytes

    Fixed Size                     9693568 bytes
    Variable Size                838860800 bytes
    Database Buffers             184549376 bytes
    Redo Buffers                   7081984 bytes

    RMAN>
    ```

6. Oracle recommends that you always back up a database before making any significant change to the database. Use the `backup database` command to create a backup before you enable the `ARCHIVELOG` mode.

    ```
    RMAN> <copy>backup database;</copy>
    ```

    ## Output

    ```
    Starting backup at 13-JUL-21
    allocated channel: ORA_DISK_1
    channel ORA_DISK_1: SID=266 device type=DISK
    channel ORA_DISK_1: starting full datafile backup set
    channel ORA_DISK_1: specifying datafile(s) in backup set
    input datafile file number=00001 name=/u01/app/oracle/oradata/ORCL/system01.dbf
    input datafile file number=00003 name=/u01/app/oracle/oradata/ORCL/sysaux01.dbf
    input datafile file number=00004 name=/u01/app/oracle/oradata/ORCL/undotbs01.dbf
    input datafile file number=00007 name=/u01/app/oracle/oradata/ORCL/users01.dbf
    channel ORA_DISK_1: starting piece 1 at 13-JUL-21
    channel ORA_DISK_1: finished piece 1 at 13-JUL-21
    piece handle=/u01/app/oracle/recovery_area/ORCL/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T055950_jgtbyp7o_.bkp tag=TAG20210713T055950 comment=NONE
    channel ORA_DISK_1: backup set complete, elapsed time: 00:00:45
    channel ORA_DISK_1: starting full datafile backup set
    channel ORA_DISK_1: specifying datafile(s) in backup set
    input datafile file number=00010 name=/u01/app/oracle/oradata/ORCL/orclpdb/sysaux01.dbf
    input datafile file number=00009 name=/u01/app/oracle/oradata/ORCL/orclpdb/system01.dbf
    input datafile file number=00015 name=/u01/app/oracle/oradata/ORCL/orclpdb/mgmt.dbf
    input datafile file number=00011 name=/u01/app/oracle/oradata/ORCL/orclpdb/undotbs01.dbf
    input datafile file number=00014 name=/u01/app/oracle/oradata/ORCL/orclpdb/mgmt_ecm_depot1.dbf
    input datafile file number=00012 name=/u01/app/oracle/oradata/ORCL/orclpdb/users01.dbf
    channel ORA_DISK_1: starting piece 1 at 13-JUL-21
    channel ORA_DISK_1: finished piece 1 at 13-JUL-21
    piece handle=/u01/app/oracle/recovery_area/ORCL/C5E6F685C4BA76A0E053F5586864297F/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T055950_jgtc03js_.bkp tag=TAG20210713T055950 comment=NONE
    channel ORA_DISK_1: backup set complete, elapsed time: 00:00:15
    channel ORA_DISK_1: starting full datafile backup set
    channel ORA_DISK_1: specifying datafile(s) in backup set
    input datafile file number=00006 name=/u01/app/oracle/oradata/ORCL/pdbseed/sysaux01.dbf
    input datafile file number=00005 name=/u01/app/oracle/oradata/ORCL/pdbseed/system01.dbf
    input datafile file number=00008 name=/u01/app/oracle/oradata/ORCL/pdbseed/undotbs01.dbf
    channel ORA_DISK_1: starting piece 1 at 13-JUL-21
    channel ORA_DISK_1: finished piece 1 at 13-JUL-21
    piece handle=/u01/app/oracle/recovery_area/ORCL/C5E6DDFF71746F94E053F55868642138/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T055950_jgtc0lq5_.bkp tag=TAG20210713T055950 comment=NONE
    channel ORA_DISK_1: backup set complete, elapsed time: 00:00:15
    Finished backup at 13-JUL-21

    Starting Control File and SPFILE Autobackup at 13-JUL-21
    piece handle=/u01/app/oracle/recovery_area/ORCL/autobackup/2021_07_13/o1_mf_s_1077775128_jgtc129y_.bkp comment=NONE
    Finished Control File and SPFILE Autobackup at 13-JUL-21

    RMAN>
    ```

7. Use the following command to enable the `ARCHIVELOG` mode.

    ```
    RMAN> <copy>alter database archivelog;</copy>
    ```

    ## Output

    ```
    Statement processed
    ```

8. Open the database.
    ```
    RMAN> <copy>alter database open;</copy>
    ```

    ## Output

    ```
    Statement processed

    RMAN>
    ```

9. Return to your `SQL*Plus` session (You might need to re-connect to `sqlplus / as sysdba`).

    ```
    SQL> <copy>connect / as sysdba</copy>
    ```

    ## Output

    ```
    Connected.

    SQL>
    ```

10. Use the following command to verify if the database is in `ARCHIVELOG` mode.

    ```
    SQL> <copy>archive log list;</copy>
    ```

    ## Output

    ```
    Database log mode              Archive Mode
    Automatic archival             Enabled
    Archive destination            USE_DB_RECOVERY_FILE_DEST
    Oldest online log sequence     23
    Next log sequence to archive   25
    Current log sequence           25
    SQL>
    ```


11. Exit `SQL*Plus` prompt. As the database is now in `ARCHIVELOG` mode, you can back up the database while the database is open. Return to your RMAN session and use the following command to back up the database.

    ```
    RMAN> <copy>backup database plus archivelog;</copy>
    ```

    ## Output

    ```
    Starting backup at 13-JUL-21
    current log archived
    using channel ORA_DISK_1
    channel ORA_DISK_1: starting archived log backup set
    channel ORA_DISK_1: specifying archived log(s) in backup set
    input archived log thread=1 sequence=25 RECID=1 STAMP=1077784598
    channel ORA_DISK_1: starting piece 1 at 13-JUL-21
    channel ORA_DISK_1: finished piece 1 at 13-JUL-21
    piece handle=/u01/app/oracle/recovery_area/ORCL/backupset/2021_07_13/o1_mf_annnn_TAG20210713T083639_jgtn4qoj_.bkp tag=TAG20210713T083639 comment=NONE
    channel ORA_DISK_1: backup set complete, elapsed time: 00:00:01
    Finished backup at 13-JUL-21

    Starting backup at 13-JUL-21
    using channel ORA_DISK_1
    channel ORA_DISK_1: starting full datafile backup set
    channel ORA_DISK_1: specifying datafile(s) in backup set
    input datafile file number=00001 name=/u01/app/oracle/oradata/ORCL/system01.dbf
    input datafile file number=00003 name=/u01/app/oracle/oradata/ORCL/sysaux01.dbf
    input datafile file number=00004 name=/u01/app/oracle/oradata/ORCL/undotbs01.dbf
    input datafile file number=00007 name=/u01/app/oracle/oradata/ORCL/users01.dbf
    channel ORA_DISK_1: starting piece 1 at 13-JUL-21
    channel ORA_DISK_1: finished piece 1 at 13-JUL-21
    piece handle=/u01/app/oracle/recovery_area/ORCL/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T083641_jgtn4sol_.bkp tag=TAG20210713T083641 comment=NONE
    channel ORA_DISK_1: backup set complete, elapsed time: 00:00:35
    channel ORA_DISK_1: starting full datafile backup set
    channel ORA_DISK_1: specifying datafile(s) in backup set
    input datafile file number=00010 name=/u01/app/oracle/oradata/ORCL/orclpdb/sysaux01.dbf
    input datafile file number=00009 name=/u01/app/oracle/oradata/ORCL/orclpdb/system01.dbf
    input datafile file number=00015 name=/u01/app/oracle/oradata/ORCL/orclpdb/mgmt.dbf
    input datafile file number=00011 name=/u01/app/oracle/oradata/ORCL/orclpdb/undotbs01.dbf
    input datafile file number=00014 name=/u01/app/oracle/oradata/ORCL/orclpdb/mgmt_ecm_depot1.dbf
    input datafile file number=00012 name=/u01/app/oracle/oradata/ORCL/orclpdb/users01.dbf
    channel ORA_DISK_1: starting piece 1 at 13-JUL-21
    channel ORA_DISK_1: finished piece 1 at 13-JUL-21
    piece handle=/u01/app/oracle/recovery_area/ORCL/C5E6F685C4BA76A0E053F5586864297F/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T083641_jgtn5x0l_.bkp tag=TAG20210713T083641 comment=NONE
    channel ORA_DISK_1: backup set complete, elapsed time: 00:00:16
    channel ORA_DISK_1: starting full datafile backup set
    channel ORA_DISK_1: specifying datafile(s) in backup set
    input datafile file number=00006 name=/u01/app/oracle/oradata/ORCL/pdbseed/sysaux01.dbf
    input datafile file number=00005 name=/u01/app/oracle/oradata/ORCL/pdbseed/system01.dbf
    input datafile file number=00008 name=/u01/app/oracle/oradata/ORCL/pdbseed/undotbs01.dbf
    channel ORA_DISK_1: starting piece 1 at 13-JUL-21
    channel ORA_DISK_1: finished piece 1 at 13-JUL-21
    piece handle=/u01/app/oracle/recovery_area/ORCL/C5E6DDFF71746F94E053F55868642138/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T083641_jgtn6d7f_.bkp tag=TAG20210713T083641 comment=NONE
    channel ORA_DISK_1: backup set complete, elapsed time: 00:00:15
    Finished backup at 13-JUL-21

    Starting backup at 13-JUL-21
    current log archived
    using channel ORA_DISK_1
    channel ORA_DISK_1: starting archived log backup set
    channel ORA_DISK_1: specifying archived log(s) in backup set
    input archived log thread=1 sequence=26 RECID=2 STAMP=1077784667
    channel ORA_DISK_1: starting piece 1 at 13-JUL-21
    channel ORA_DISK_1: finished piece 1 at 13-JUL-21
    piece handle=/u01/app/oracle/recovery_area/ORCL/backupset/2021_07_13/o1_mf_annnn_TAG20210713T083747_jgtn6vjv_.bkp tag=TAG20210713T083747 comment=NONE
    channel ORA_DISK_1: backup set complete, elapsed time: 00:00:01
    Finished backup at 13-JUL-21

    Starting Control File and SPFILE Autobackup at 13-JUL-21
    piece handle=/u01/app/oracle/recovery_area/ORCL/autobackup/2021_07_13/o1_mf_s_1077784668_jgtn6x4r_.bkp comment=NONE
    Finished Control File and SPFILE Autobackup at 13-JUL-21

    RMAN>
    ```

## Task 3: Enable Flashback Database

You can revert the whole database to a prior point in time using the following ways: either revert the whole database to a prior point in time by restoring a backup and performing a point-in-time recovery or enable flashback database. When you enable flashback database, the database generates flashback logs in the fast recovery area. These logs are used to flashback the database to a specified time. The database automatically creates, deletes, and resizes flashback logs.

1. Invoke RMAN and connect to the target database as the `SYSBACKUP` user.

    ```
    $<copy>rman target sysbackup</copy>
    ```

    ## Output

    ```
    Recovery Manager: Release 21.0.0.0.0 - Production on Tue Jul 13 08:41:20 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle and/or its affiliates.  All rights reserved.

    target database Password:
    connected to target database: ORCL (DBID=1604279435)

    RMAN>
    ```

2. Use the following command to enable flashback database for the whole database.

    ```
    RMAN> <copy>alter database flashback on;</copy>
    ```

    ## Output

    ```
    Statement processed

    RMAN>
    ```

You may now **proceed to the next lab**.


## Acknowledgements

- **Author**: Suresh Mohan, Database User Assistance Development Team

- **Contributors**: Suresh Rajan, Manish Garodia, Subhash Chandra, Ramya P

- **Last Updated By & Date**: Suresh Mohan, October 2021
