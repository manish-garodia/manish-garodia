# Configure Backup Settings

## Introduction
This lab shows you how to configure the database for several backup-related settings and policies.

Estimated Time: 20 minutes

### **Objectives**
In this lab, you will:
- View backup settings
- Configure backup device settings
- Configure backup optimization settings
- Configure retention policy settings
- Configure control file and server parameter file automatic backups
- Enable block change tracking

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


## Task 1: View Backup Settings
You can view all the existing backup settings by using the following steps.

1. Invoke RMAN and connect to the target database as the `SYSBACKUP` user.

    ```
    $ <copy>rman target sysbackup</copy>
    ```

    ## Output

    ```
    Recovery Manager: Release 21.0.0.0.0 - Production on Tue Jul 13 08:54:08 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle and/or its affiliates.  All rights reserved.

    target database Password:
    connected to target database: ORCL (DBID=1604279435)

    RMAN>
    ```

2. Use the following command to view the RMAN configuration settings, including backup settings.

    ```
    RMAN> <copy>show all;</copy>
    ```

    ## Output

    ```
    using target database control file instead of recovery catalog
    RMAN configuration parameters for database with db_unique_name ORCL are:
    CONFIGURE RETENTION POLICY TO REDUNDANCY 1; # default
    CONFIGURE BACKUP OPTIMIZATION OFF; # default
    CONFIGURE DEFAULT DEVICE TYPE TO DISK; # default
    CONFIGURE CONTROLFILE AUTOBACKUP ON; # default
    CONFIGURE CONTROLFILE AUTOBACKUP FORMAT FOR DEVICE TYPE DISK TO '%F'; # default
    CONFIGURE DEVICE TYPE DISK PARALLELISM 1 BACKUP TYPE TO BACKUPSET; # default
    CONFIGURE DATAFILE BACKUP COPIES FOR DEVICE TYPE DISK TO 1; # default
    CONFIGURE ARCHIVELOG BACKUP COPIES FOR DEVICE TYPE DISK TO 1; # default
    CONFIGURE MAXSETSIZE TO UNLIMITED; # default
    CONFIGURE ENCRYPTION FOR DATABASE OFF; # default
    CONFIGURE ENCRYPTION ALGORITHM 'AES128'; # default
    CONFIGURE COMPRESSION ALGORITHM 'BASIC' AS OF RELEASE 'DEFAULT' OPTIMIZE FOR LOAD TRUE ; # default
    CONFIGURE RMAN OUTPUT TO KEEP FOR 7 DAYS; # default
    CONFIGURE ARCHIVELOG DELETION POLICY TO NONE; # default
    CONFIGURE SNAPSHOT CONTROLFILE NAME TO '/u01/app/oracle/dbs/snapcf_orcl.f'; # default

    RMAN>
    ```


## Task 2: Configure Backup Device Settings
The default device used to store backups is `disk` by default. If the default type is different, you can change it to disk by executing the following steps.

1. Use the following command to set the default device for backups to disk.

    ```
    RMAN> <copy>configure default device type to disk;</copy>
    ```

    ## Output

    ```
    new RMAN configuration parameters:
    CONFIGURE DEFAULT DEVICE TYPE TO DISK;
    new RMAN configuration parameters are successfully stored

    RMAN>
    ```

2. Use the following command to verify that the setting has been updated. In the following output, you can see that the default device type parameter is set to disk.

    ```
    RMAN> <copy>show default device type;</copy>
    ```

    ## Output

    ```
    RMAN configuration parameters for database with db_unique_name ORCL are:
    CONFIGURE DEFAULT DEVICE TYPE TO DISK;

    RMAN>
    ```

## Task 3: Configure Backup Optimization Settings
Configure backup optimization to save space in the fast recovery area. Optimization excludes unchanged files, such as read-only files and offline data files, that were previously backed up.

1. Use the following command to configure backup optimization.

    ```
    RMAN> <copy>configure backup optimization on;</copy>
    ```

2. Use the following command to verify the setting has been updated. In the following output, you could see that the backup optimization parameter is set to `ON`.

    ```
    RMAN> <copy>show backup optimization;</copy>
    ```

    ## Output

    ```
    RMAN configuration parameters for database with db_unique_name ORCL are:
    CONFIGURE BACKUP OPTIMIZATION ON; # default

    RMAN>
    ```

## Task 4: Configure Retention Policy Settings
Configure the retention policy to specify how long the backups and archived redo logs must be retained for media recovery.

1. Use the following command to configure the retention policy to specify that the backups and archived logs must be retained for your specified number of days. In the following command, we have set the recovery window to 31 days.

    ```
    RMAN> <copy>configure retention policy to recovery window of 31 days;</copy>
    ```

    ## Output

    ```
    new RMAN configuration parameters:
    CONFIGURE RETENTION POLICY TO RECOVERY WINDOW OF 31 DAYS;
    new RMAN configuration parameters are successfully stored

    RMAN>
    ```

2. Use the following command to verify that the setting has been updated. In the following output, you could see that the retention policy parameter is set to 31 days.

    ```
    RMAN> <copy>show retention policy;</copy>
    ```

    ## Output

    ```
    RMAN configuration parameters for database with db_unique_name ORCL are:
    CONFIGURE RETENTION POLICY TO RECOVERY WINDOW OF 31 DAYS;

    RMAN>
    ```

## Task 5: Configure Control File and Server Parameter File Automatic Backups
You can configure RMAN to automatically backup the control file and server parameter file with every backup. This is referred to as an **autobackup.** The control and server parameter files are critical to the database and RMAN. Creating automatic backups of the control file enables RMAN to recover the database even if the current control file and server parameter file are lost. The control and server parameter files are relatively small compared to typical data files and, therefore, backing them up frequently results in relatively little storage overhead.

If the database runs in `ARCHIVELOG` mode, an automatic backup is also taken whenever the database structure metadata in the control file changes.

You can configure the control file and server parameter file automatic backups by performing the following steps.

1. Use the following command to configure automatic backups of the control file and server parameter file.

    ```
    RMAN> <copy>configure controlfile autobackup on;</copy>
    ```

    ## Output

    ```
    new RMAN configuration parameters:
    CONFIGURE CONTROLFILE AUTOBACKUP ON;
    new RMAN configuration parameters are successfully stored

    RMAN>
    ```

2. Use the following command to verify that the setting has been updated. In the following output, you could see that the `controlfile autobackup` parameter is set to `ON`.

    ```
    RMAN> <copy>show controlfile autobackup;</copy>
    ```

    ## Output

    ```
    RMAN configuration parameters for database with db_unique_name ORCL are:
    CONFIGURE CONTROLFILE AUTOBACKUP ON;

    RMAN>
    ```

## Task 6: Enable Block Change Tracking
Block change tracking improves the performance of incremental backups by recording changed blocks in the block change tracking file. During an incremental backup, instead of scanning all data blocks to identify which blocks have changed, RMAN uses this file to identify the changed blocks that need to be backed up.

You can enable block change tracking when the database is either open or mounted. This section assumes that you intend to create the block change tracking file as an Oracle-managed file in the database area, where the database maintains active database files such as data files, control files, and online redo log files.

You can enable block change tracking by performing the following steps.

1. Invoke `SQL*Plus` and connect as the `SYSTEM` user.

    ```
    $ <copy>sqlplus system</copy>
    ```

    ## Output

    ```
    SQL*Plus: Release 21.0.0.0.0 - Production on Tue Jul 13 08:58:36 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle.  All rights reserved.

    Enter password:
    Last Successful login time: Tue Jul 13 2021 05:39:40 +00:00

    Connected to:
    Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
    Version 21.3.0.0.0

    SQL>
    ```

2. Use the following command to specify the location of the block change tracking file by setting `db_create_file_dest`, if not already set.

    ```
    SQL> <copy>alter system set db_create_file_dest = '/u01/app/oracle/oradata/ORCL' ;</copy>
    ```

    ## Output

    ```
    System altered.

    SQL>
    ```

    **Note:** The `db_create_file_dest` specifies the default location for Oracle-managed files. In this lab, the `db_create_file_dest` parameter is set to `/u01/app/oracle/oradata/ORCL,` the storage location for data files and control files.

3. Use the following command to enable block change tracking.

    ```
    SQL> <copy>alter database enable block change tracking;</copy>
    ```

    ## Output

    ```
    Database altered.

    SQL>
    ```

4. Query `v$block_change_tracking` to verify that the block change tracking is enabled and to view the name of the block change tracking file. In the following output, you can see that the block change tracking is `ENABLED.`

    ```
    SQL> <copy>select status, filename from v$block_change_tracking;</copy>
    ```

    ## Output

    ```
    STATUS   FILENAME
    -------- ----------------------------------------------------------------------------
    ENABLED  /u01/app/oracle/oradata/ORCL/ORCL/changetracking/o1_mf_jgtoph6p_.chg

    SQL>
    ```

You may now **proceed to the next lab**.


## Acknowledgements

- **Author**: Suresh Mohan, Database User Assistance Development Team

- **Contributors**: Suresh Rajan, Manish Garodia, Subhash Chandra, Ramya P

- **Last Updated By & Date**: Suresh Mohan, October 2021
