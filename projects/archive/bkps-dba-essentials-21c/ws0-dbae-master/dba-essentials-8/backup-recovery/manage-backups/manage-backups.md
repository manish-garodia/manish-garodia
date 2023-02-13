# Manage Backups

## Introduction

An essential part of a backup and recovery strategy is managing backups after you create them. Backup management includes deleting obsolete backups and performing periodic checks to ensure that backups are available and usable. In a multi-tenant environment, you can manage backups for the whole multi-tenant container database (CDB) or one or more pluggable databases (PDBs).

Backups should be managed by deleting obsolete backups and performing periodic checks to ensure that backups are available and usable.

Estimated time: 20 minutes

### **Objectives**
In this lab, you will:
- Display backup information
- Cross-check backups
- Delete expired backups
- Monitor fast recovery area space usage

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


## Task 1: Display Backup Information

Backup reports contain summary and detailed information about past backup jobs run by Recovery Manager (RMAN). The `v$rman_backup_job_details` view includes information on backup jobs run by RMAN. This view contains information such as the time taken for the backup, start and finish time, type of backup performed, and the backup job status.

1. Invoke RMAN and connect to the target database.
    ```
    $ <copy>rman</copy>
    ```

    ## Output

    ```
    Recovery Manager: Release 21.0.0.0.0 - Production on Tue Jul 13 16:10:53 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle and/or its affiliates.  All rights reserved.

    RMAN>
    ```

2. Query the `v$rman_backup_job_details` view to display backup job history. You can see the status, start time, and end time of all the backups performed in the output.

    ```
    RMAN> <copy>select session_key, input_type, status, start_time, end_time, elapsed_seconds/3600 hrs from v$rman_backup_job_details;</copy>
    ```

    ## Output

    ```
    SESSION_KEY INPUT_TYPE    STATUS                  START_TIM END_TIME         HRS
    ----------- ------------- ----------------------- --------- --------- ----------
              5 DB FULL       COMPLETED               13-JUL-21 13-JUL-21 2.63305555

    RMAN>
    ```
**Note:** `SESSION_KEY` is the unique key for the RMAN session in which the backup job occurred.  

## Task 2: Cross-check Backups

Cross-checking a backup synchronizes the physical reality of backups with their logical records in the RMAN repository. For example, if a backup on disk was deleted with an operating system command, then a cross-check detects this condition. After the cross-check, the RMAN repository correctly reflects the state of the backups.

Backups to disk are listed as available if they are still on disk in the location listed in the RMAN repository and if they have no corruption in the file header. Backups on tape are listed as available if they are still on tape. The file headers on tape are not checked for corruption. Backups that are missing or corrupt are listed as expired.

1. Use the following command to view a list of all backup sets to determine which backup you want to cross-check.

    ```
    RMAN> <copy>list backup summary;</copy>  
    ```

    ## Output

    ```
    using target database control file instead of recovery catalog

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

    RMAN>
    ```

2. Use the following command to cross-check all backup sets.

    ```
    RMAN> <copy>crosscheck backup;</copy>                                                                
    ```

    ## Output

    ```
    allocated channel: ORA_DISK_1                                                           
    channel ORA_DISK_1: SID=24 device type=DISK                                             
    crosschecked backup piece: found to be 'AVAILABLE'                                      
    backup piece handle=/u01/app/oracle/recovery_area/ORCL/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T055950_jgtbyp7o_.bkp RECID=1 STAMP=1077775190
    crosschecked backup piece: found to be 'AVAILABLE'
    backup piece handle=/u01/app/oracle/recovery_area/ORCL/C5E6F685C4BA76A0E053F5586864297F/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T055950_jgtc03js_.bkp RECID=2 STAMP=1077775235
    crosschecked backup piece: found to be 'AVAILABLE'
    backup piece handle=/u01/app/oracle/recovery_area/ORCL/C5E6DDFF71746F94E053F55868642138/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T055950_jgtc0lq5_.bkp RECID=3 STAMP=1077775250
    crosschecked backup piece: found to be 'AVAILABLE'
    backup piece handle=/u01/app/oracle/recovery_area/ORCL/autobackup/2021_07_13/o1_mf_s_1077775128_jgtc129y_.bkp RECID=4 STAMP=1077775266
    crosschecked backup piece: found to be 'AVAILABLE'
    backup piece handle=/u01/app/oracle/recovery_area/ORCL/backupset/2021_07_13/o1_mf_annnn_TAG20210713T083639_jgtn4qoj_.bkp RECID=5 STAMP=1077784599
    crosschecked backup piece: found to be 'AVAILABLE'
    backup piece handle=/u01/app/oracle/recovery_area/ORCL/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T083641_jgtn4sol_.bkp RECID=6 STAMP=1077784601
    crosschecked backup piece: found to be 'AVAILABLE'
    backup piece handle=/u01/app/oracle/recovery_area/ORCL/C5E6F685C4BA76A0E053F5586864297F/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T083641_jgtn5x0l_.bkp RECID=7 STAMP=1077784637
    crosschecked backup piece: found to be 'AVAILABLE'
    backup piece handle=/u01/app/oracle/recovery_area/ORCL/C5E6DDFF71746F94E053F55868642138/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T083641_jgtn6d7f_.bkp RECID=8 STAMP=1077784652
    crosschecked backup piece: found to be 'AVAILABLE'
    backup piece handle=/u01/app/oracle/recovery_area/ORCL/backupset/2021_07_13/o1_mf_annnn_TAG20210713T083747_jgtn6vjv_.bkp RECID=9 STAMP=1077784667
    crosschecked backup piece: found to be 'AVAILABLE'
    backup piece handle=/u01/app/oracle/recovery_area/ORCL/autobackup/2021_07_13/o1_mf_s_1077784668_jgtn6x4r_.bkp RECID=10 STAMP=1077784669
    crosschecked backup piece: found to be 'AVAILABLE'
    backup piece handle=/u01/app/oracle/recovery_area/ORCL/autobackup/2021_07_13/o1_mf_s_1077785394_jgtnxlcy_.bkp RECID=11 STAMP=1077785394
    Crosschecked 11 objects

    RMAN>
    ```

3. Use the following command to cross-check the specified backupset. You can Identify the backup that you want to cross-check from the output of the previous `LIST` command.

    ```
    RMAN> <copy>crosscheck backupset 1;</copy>
    ```

    ## Output

    ```
    using channel ORA_DISK_1
    crosschecked backup piece: found to be 'AVAILABLE'
    backup piece handle=/u01/app/oracle/recovery_area/ORCL/backupset/2021_07_13/o1_mf_nnndf_TAG20210713T055950_jgtbyp7o_.bkp RECID=1 STAMP=1077775190
    Crosschecked 1 objects

    RMAN>
    ```

## Task 3: Delete Expired Backups

Deleting expired backups removes from the RMAN repository those backups that are listed as `EXPIRED`. Expired backups are those found to be inaccessible during a cross-check. No attempt is made to delete the backup files from disk or tape; this action updates only the RMAN repository.

1. Use the following command to delete expired backups from the RMAN repository.
    ```
    RMAN> <copy>delete expired backup;</copy>
    ```

    ## Output

    ```
    using channel ORA_DISK_1
    specification does not match any backup in the repository

    RMAN>
    ```

## Task 4: Monitor Fast Recovery Area Space Usage

You should monitor the fast recovery area to ensure that it is large enough to contain backups and other recovery-related files. The space usage in your database may vary from what is shown in this lab.

Oracle database provides two views to monitor fast recovery area space usage, `v$recovery_file_dest`, and `v$recovery_area_usage`.

1. Use the `v$recovery_file_dest` view to obtain the following information about the fast recovery area: total number of files, current location, disk quota, space in use, and space reclaimable by deleting files. The space details are in bytes. Querying `v$recovery_file_dest` produces the following output.

    Query the `v$recovery_file_dest` view to obtain information about the fast recovery area.

    ```
    RMAN> <copy>select * from v$recovery_file_dest;</copy>
    ```

    ## Output

    ```
    NAME                                                                            
    --------------------------------------------------------------------------------
    SPACE_LIMIT SPACE_USED SPACE_RECLAIMABLE NUMBER_OF_FILES     CON_ID
    ----------- ---------- ----------------- --------------- ----------
    /u01/app/oracle/recovery_area
    10737418240 7647872000          51639808              15          0

    RMAN>
    ```

2. The `v$recovery_area_usage` view contains the percentage of disk quota used by different types of files and the percentage of space that can be reclaimed by deleting files that are obsolete, redundant, or backed up to tape. Querying the `v$recovery_area_usage` view produces the following output.

    Query the `v$recovery_area_usage` view to obtain additional information about the fast recovery area.

    ```
    RMAN> <copy>select file_type, percent_space_used PCT_USED, percent_space_reclaimable PCT_RECLAIM, number_of_files NO_FILES from v$recovery_area_usage;</copy>
    ```

    ## Output

    ```
    FILE_TYPE                 PCT_USED PCT_RECLAIM   NO_FILES
    ----------------------- ---------- ----------- ----------
    CONTROL FILE                     0           0          0
    REDO LOG                         0           0          0
    ARCHIVED LOG                   .48         .48          2
    BACKUP PIECE                 66.84           0         11
    IMAGE COPY                       0           0          0
    FLASHBACK LOG                 3.91           0          2
    FOREIGN ARCHIVED LOG             0           0          0
    AUXILIARY DATAFILE COPY          0           0          0

    8 rows selected

    RMAN>
    ```

You may now **proceed to the next lab**.


## Acknowledgements

- **Author**: Suresh Mohan, Database User Assistance Development Team

- **Contributors**: Suresh Rajan, Manish Garodia, Subhash Chandra, Ramya P

- **Last Updated By & Date**: Suresh Mohan, October 2021
