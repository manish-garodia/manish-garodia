# Perform and Schedule Backups  

## Introduction
You can use RMAN to perform a whole backup of your database. A whole backup includes all data files, archived redo log files, control file, and server parameter file. You can perform a complete recovery with the files from a whole backup.

Estimated Time: 20 minutes

### **Objectives**
In this lab, you will:
- Perform a whole database backup
- Display backup information stored in the RMAN repository
- Validate backups

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


## Task 1: Perform a Whole Database Backup

You can back up the whole database by performing the following steps.

1. Invoke RMAN and connect to the target database as the `sysbackup` user.

    ```
    $ <copy>rman target sysbackup</copy>
    ```

    ## Output

    ```
    Recovery Manager: Release 21.0.0.0.0 - Production on Mon Jul 26 05:02:48 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle and/or its affiliates.  All rights reserved.

    target database Password:
    connected to target database: ORCL (DBID=1604279435)

    RMAN>
    ```

2. Use the following command to back up the database files, including the archive redo log files.

    ```
    RMAN> <copy>backup database plus archivelog ;</copy>
    ```

    ## Output

    ```
    Starting backup at 26-JUL-21
    current log archived
    using channel ORA_DISK_1
    channel ORA_DISK_1: starting archived log backup set
    channel ORA_DISK_1: specifying archived log(s) in backup set
    input archived log thread=1 sequence=27 RECID=3 STAMP=1077841789
    input archived log thread=1 sequence=28 RECID=4 STAMP=1077919328
    input archived log thread=1 sequence=29 RECID=5 STAMP=1077998298
    input archived log thread=1 sequence=30 RECID=6 STAMP=1078059489
    input archived log thread=1 sequence=31 RECID=7 STAMP=1078106286
    input archived log thread=1 sequence=32 RECID=8 STAMP=1078149777
    input archived log thread=1 sequence=33 RECID=9 STAMP=1078200177
    input archived log thread=1 sequence=34 RECID=10 STAMP=1078236503
    input archived log thread=1 sequence=35 RECID=11 STAMP=1078297094
    input archived log thread=1 sequence=36 RECID=12 STAMP=1078361897
    input archived log thread=1 sequence=37 RECID=13 STAMP=1078437752
    input archived log thread=1 sequence=38 RECID=14 STAMP=1078524065
    input archived log thread=1 sequence=39 RECID=15 STAMP=1078585091
    input archived log thread=1 sequence=40 RECID=16 STAMP=1078631885
    input archived log thread=1 sequence=41 RECID=17 STAMP=1078700303
    input archived log thread=1 sequence=42 RECID=18 STAMP=1078740572
    input archived log thread=1 sequence=43 RECID=19 STAMP=1078790795
    input archived log thread=1 sequence=44 RECID=20 STAMP=1078862371
    input archived log thread=1 sequence=45 RECID=21 STAMP=1078895538
    input archived log thread=1 sequence=46 RECID=22 STAMP=1078895575
    channel ORA_DISK_1: starting piece 1 at 26-JUL-21
    channel ORA_DISK_1: finished piece 1 at 26-JUL-21
    piece handle=/u01/app/orauser/recovery_area/ORCL/backupset/2021_07_26/o1_mf_annnn_TAG20210726T051255_jhwk2qy9_.bkp tag=TAG20210726T051255 comment=NONE
    channel ORA_DISK_1: backup set complete, elapsed time: 00:00:56
    Finished backup at 26-JUL-21

    Starting backup at 26-JUL-21
    using channel ORA_DISK_1
    channel ORA_DISK_1: starting full datafile backup set
    channel ORA_DISK_1: specifying datafile(s) in backup set
    input datafile file number=00003 name=/u01/app/orauser/oradata/ORCL/sysaux01.dbf
    input datafile file number=00001 name=/u01/app/orauser/oradata/ORCL/system01.dbf
    input datafile file number=00004 name=/u01/app/orauser/oradata/ORCL/undotbs01.dbf
    input datafile file number=00007 name=/u01/app/orauser/oradata/ORCL/users01.dbf
    channel ORA_DISK_1: starting piece 1 at 26-JUL-21
    channel ORA_DISK_1: finished piece 1 at 26-JUL-21
    piece handle=/u01/app/orauser/recovery_area/ORCL/backupset/2021_07_26/o1_mf_nnndf_TAG20210726T051351_jhwk4hrs_.bkp tag=TAG20210726T051351 comment=NONE
    channel ORA_DISK_1: backup set complete, elapsed time: 00:00:45
    channel ORA_DISK_1: starting full datafile backup set
    channel ORA_DISK_1: specifying datafile(s) in backup set
    input datafile file number=00010 name=/u01/app/orauser/oradata/ORCL/orclpdb/sysaux01.dbf
    input datafile file number=00009 name=/u01/app/orauser/oradata/ORCL/orclpdb/system01.dbf
    input datafile file number=00015 name=/u01/app/orauser/oradata/ORCL/orclpdb/mgmt.dbf
    input datafile file number=00011 name=/u01/app/orauser/oradata/ORCL/orclpdb/undotbs01.dbf
    input datafile file number=00014 name=/u01/app/orauser/oradata/ORCL/orclpdb/mgmt_ecm_depot1.dbf
    input datafile file number=00012 name=/u01/app/orauser/oradata/ORCL/orclpdb/users01.dbf
    channel ORA_DISK_1: starting piece 1 at 26-JUL-21
    channel ORA_DISK_1: finished piece 1 at 26-JUL-21
    piece handle=/u01/app/orauser/recovery_area/ORCL/C5E6F685C4BA76A0E053F5586864297F/backupset/2021_07_26/o1_mf_nnndf_TAG20210726T051351_jhwk5x3l_.bkp tag=TAG20210726T051351 comment=NONE
    channel ORA_DISK_1: backup set complete, elapsed time: 00:00:15
    channel ORA_DISK_1: starting full datafile backup set
    channel ORA_DISK_1: specifying datafile(s) in backup set
    input datafile file number=00006 name=/u01/app/orauser/oradata/ORCL/pdbseed/sysaux01.dbf
    input datafile file number=00005 name=/u01/app/orauser/oradata/ORCL/pdbseed/system01.dbf
    input datafile file number=00008 name=/u01/app/orauser/oradata/ORCL/pdbseed/undotbs01.dbf
    channel ORA_DISK_1: starting piece 1 at 26-JUL-21
    channel ORA_DISK_1: finished piece 1 at 26-JUL-21
    piece handle=/u01/app/orauser/recovery_area/ORCL/C5E6DDFF71746F94E053F55868642138/backupset/2021_07_26/o1_mf_nnndf_TAG20210726T051351_jhwk6ddz_.bkp tag=TAG20210726T051351 comment=NONE
    channel ORA_DISK_1: backup set complete, elapsed time: 00:00:15
    Finished backup at 26-JUL-21

    Starting backup at 26-JUL-21
    current log archived
    using channel ORA_DISK_1
    channel ORA_DISK_1: starting archived log backup set
    channel ORA_DISK_1: specifying archived log(s) in backup set
    input archived log thread=1 sequence=47 RECID=23 STAMP=1078895707
    channel ORA_DISK_1: starting piece 1 at 26-JUL-21
    channel ORA_DISK_1: finished piece 1 at 26-JUL-21
    piece handle=/u01/app/orauser/recovery_area/ORCL/backupset/2021_07_26/o1_mf_annnn_TAG20210726T051507_jhwk6vs8_.bkp tag=TAG20210726T051507 comment=NONE
    channel ORA_DISK_1: backup set complete, elapsed time: 00:00:01
    Finished backup at 26-JUL-21

    Starting Control File and SPFILE Autobackup at 26-JUL-21
    piece handle=/u01/app/orauser/recovery_area/ORCL/autobackup/2021_07_26/o1_mf_s_1078895708_jhwk6x5n_.bkp comment=NONE
    Finished Control File and SPFILE Autobackup at 26-JUL-21

    RMAN>
    ```

## Task 2: Display Backup Information Stored in the RMAN Repository

Use the `LIST` command to view information about backups stored in the RMAN repository. The information includes backups of data files, individual tablespaces, archived redo log files, and control files. You can also use this command to display information about expired and obsolete backups.

1. Use the `list backup` command to display a summary of all the backups, both backup sets, and image copies.

    ```
    RMAN> <copy>list backup summary;</copy>
    ```

    ## Output

    ```
    List of Backups
    ===============
    Key     TY LV S Device Type Completion Time #Pieces #Copies Compressed Tag
    ------- -- -- - ----------- --------------- ------- ------- ---------- ---
    1       B  F  A DISK        13-JUL-21       1       1       NO         TAG20210713T055950
    2       B  F  A DISK        13-JUL-21       1       1       NO         TAG20210713T055950
    3       B  F  A DISK        13-JUL-21       1       1       NO         TAG20210713T055950
    4       B  F  A DISK        13-JUL-21       1       1       NO         TAG20210713T060105
    5       B  A  A DISK        13-JUL-21       1       1       NO         TAG20210713T083639
    6       B  F  A DISK        13-JUL-21       1       1       NO         TAG20210713T083641
    7       B  F  A DISK        13-JUL-21       1       1       NO         TAG20210713T083641
    8       B  F  A DISK        13-JUL-21       1       1       NO         TAG20210713T083641
    9       B  A  A DISK        13-JUL-21       1       1       NO         TAG20210713T083747
    10      B  F  A DISK        13-JUL-21       1       1       NO         TAG20210713T083748
    11      B  F  A DISK        13-JUL-21       1       1       NO         TAG20210713T084954
    12      B  A  A DISK        26-JUL-21       1       1       NO         TAG20210726T051255
    13      B  F  A DISK        26-JUL-21       1       1       NO         TAG20210726T051351
    14      B  F  A DISK        26-JUL-21       1       1       NO         TAG20210726T051351
    15      B  F  A DISK        26-JUL-21       1       1       NO         TAG20210726T051351
    16      B  A  A DISK        26-JUL-21       1       1       NO         TAG20210726T051507
    17      B  F  A DISK        26-JUL-21       1       1       NO         TAG20210726T051508

    RMAN>
    ```

2. Use the `list backup` command with the `datafile` parameter to display the specified backups, both backup sets, and image copies.

    ```
    RMAN> <copy>list backup of datafile 3;</copy>
    ```

    ## Output

    ```
    List of Backup Sets
    ===================

    BS Key  Type LV Size       Device Type Elapsed Time Completion Time
    ------- ---- -- ---------- ----------- ------------ ---------------
    1       Full    2.26G      DISK        00:00:31     13-JUL-21      
            BP Key: 1   Status: AVAILABLE  Compressed: NO  Tag: TAG20210713T055950
            Piece Name: /u01/app/orauser/recovery_area/ORCL/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T055950_jgtbyp7o_.bkp
      List of Datafiles in backup set 1
      File LV Type Ckp SCN    Ckp Time  Abs Fuz SCN Sparse Name
      ---- -- ---- ---------- --------- ----------- ------ ----
      3       Full 5791516    13-JUL-21              NO    /u01/app/orauser/oradata/ORCL/sysaux01.dbf

    BS Key  Type LV Size       Device Type Elapsed Time Completion Time
    ------- ---- -- ---------- ----------- ------------ ---------------
    6       Full    2.26G      DISK        00:00:31     13-JUL-21      
            BP Key: 6   Status: AVAILABLE  Compressed: NO  Tag: TAG20210713T083641
            Piece Name: /u01/app/orauser/recovery_area/ORCL/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T083641_jgtn4sol_.bkp
      List of Datafiles in backup set 6
      File LV Type Ckp SCN    Ckp Time  Abs Fuz SCN Sparse Name
      ---- -- ---- ---------- --------- ----------- ------ ----
      3       Full 5805931    13-JUL-21              NO    /u01/app/orauser/oradata/ORCL/sysaux01.dbf

    BS Key  Type LV Size       Device Type Elapsed Time Completion Time
    ------- ---- -- ---------- ----------- ------------ ---------------
    13      Full    2.39G      DISK        00:00:33     26-JUL-21      
            BP Key: 13   Status: AVAILABLE  Compressed: NO  Tag: TAG20210726T051351
            Piece Name: /u01/app/orauser/recovery_area/ORCL/backupset/2021_07_26/o1_mf_nnndf_TAG20210726T051351_jhwk4hrs_.bkp
      List of Datafiles in backup set 13
      File LV Type Ckp SCN    Ckp Time  Abs Fuz SCN Sparse Name
      ---- -- ---- ---------- --------- ----------- ------ ----
      3       Full 7481584    26-JUL-21              NO    /u01/app/orauser/oradata/ORCL/sysaux01.dbf

    RMAN>
    ```

## Task 3: Validate Backups

Validating specific backups checks whether these backups exist and can be restored. It does not test whether the set of available backups meet your recoverability goals. For example, image copies of data files for several tablespaces from your database may exist, each of which can be validated. If there are some tablespaces for which no valid backups exist, however, then you cannot restore and recover the database.

1. Use the following command to validate the backup for a specific data file. The `validate` command determines whether the backup exists.

    ```
    RMAN> <copy>validate datafile 1;</copy>
    ```

    ## Output

    ```
    Starting validate at 26-JUL-21
    using channel ORA_DISK_1
    channel ORA_DISK_1: starting validation of datafile
    channel ORA_DISK_1: specifying datafile(s) for validation
    input datafile file number=00001 name=/u01/app/orauser/oradata/ORCL/system01.dbf
    channel ORA_DISK_1: validation complete, elapsed time: 00:00:15
    List of Datafiles
    =================
    File Status Marked Corrupt Empty Blocks Blocks Examined High SCN
    ---- ------ -------------- ------------ --------------- ----------
    1    OK     0              20393        179201          7481641   
      File Name: /u01/app/orauser/oradata/ORCL/system01.dbf
      Block Type Blocks Failing Blocks Processed
      ---------- -------------- ----------------
      Data       0              93304           
      Index      0              17158           
      Other      0              48345           

    channel ORA_DISK_1: starting validation of datafile
    channel ORA_DISK_1: specifying datafile(s) for validation
    including current control file for validation
    including current SPFILE in backup set
    channel ORA_DISK_1: validation complete, elapsed time: 00:00:01
    List of Control File and SPFILE
    ===============================
    File Type    Status Blocks Failing Blocks Examined
    ------------ ------ -------------- ---------------
    SPFILE       OK     0              2               
    Control File OK     0              1142            
    Finished validate at 26-JUL-21

    RMAN>
    ```

2. Use the following command to validate that the data files for the specified tablespace can be restored.

    ```
    RMAN> <copy>restore tablespace users validate;</copy>
    ```

    ## Output

    ```
    Starting restore at 26-JUL-21
    using channel ORA_DISK_1

    channel ORA_DISK_1: starting validation of datafile backup set
    channel ORA_DISK_1: reading from backup piece /u01/app/orauser/recovery_area/ORCL/backupset/2021_07_26/o1_mf_nnndf_TAG20210726T051351_jhwk4hrs_.bkp
    channel ORA_DISK_1: piece handle=/u01/app/orauser/recovery_area/ORCL/backupset/2021_07_26/o1_mf_nnndf_TAG20210726T051351_jhwk4hrs_.bkp tag=TAG20210726T051351
    channel ORA_DISK_1: restored backup piece 1
    channel ORA_DISK_1: validation complete, elapsed time: 00:00:25
    Finished restore at 26-JUL-21

    RMAN>
    ```

You may now **proceed to the next lab**.


## Acknowledgements

- **Author**: Suresh Mohan, Database User Assistance Development Team

- **Contributors**: Suresh Rajan, Manish Garodia, Subhash Chandra, Ramya P

- **Last Updated By & Date**: Suresh Mohan, October 2021
