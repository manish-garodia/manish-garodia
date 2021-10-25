# Perform Database Backup and Recovery Operations

## About this Workshop
This workshop introduces you to Oracle database backup and recovery with Recovery Manager (RMAN). After completing this workshop, you should be familiar with the basic concepts of Oracle database backup and recovery operations, know how to implement a disk-based backup strategy, and perform repairs to database files.

Estimated Workshop Time: 2:30 hours

### **Objectives**

In this workshop, you will learn the following database activities.
- Configure recovery settings
- Configure backup settings
- Manage backups
- Perform and schedule backups
- Use data recovery advisor to repair failures
- Rewind a table using Oracle flashback table
- Recover a dropped table using Oracle flashback drop

### **Prerequisites**

This lab assumes you have installed the Oracle database 21c and created a starter database. For detailed tasks, refer to the workshop on [DBA Essentials - Install Oracle Database 21c on OCI Compute](https://apexapps.oracle.com/pls/apex/dbpm/r/livelabs/view-workshop?wid=871).

**Note:** If you have a **Free Trial** account, when your Free Trial expires your account will be converted to an **Always Free** account. You will not be able to conduct Free Tier workshops unless the Always Free environment is available. **[Click here for the Free Tier FAQ page.](https://www.oracle.com/cloud/free/faq.html)**

## Overview of Database Backup and Recovery

Oracle database Backup and Recovery operations focus is on the physical backup of database files, which permits you to reconstruct your database in case of a failure/corruption.

Recovery Manager (RMAN), a command-line tool, is the method preferred by Oracle for efficiently backing up and recovering your Oracle database. The files protected by the backup and recovery facilities built into RMAN include data files, control files, server parameter files, and archived redo log files. With these files, you can reconstruct your database. RMAN is designed to work intimately with the server, providing block-level corruption detection during backup and restore. RMAN optimizes performance and space consumption during backup with file multiplexing and backup set compression and integrates with leading tape and storage media products. The backup mechanisms work at the physical level to protect against file damage, such as the accidental deletion of a data file or the failure of a disk drive. RMAN can also be used to perform point-in-time recovery to recover from logical failures when other techniques such as flashback cannot be used.

The Oracle database flashback features provide a range of physical and logical data recovery tools as efficient, easy-to-use alternatives to physical and logical backups. The flashback features enable you to reverse the effects of unwanted database changes without restoring data files from backup.

Click on the next lab to **Get Started**.

## Learn More

- [Blog on Introducing Oracle Database 21c](https://blogs.oracle.com/database/introducing-oracle-database-21c)
- [Oracle Database Documentation](https://docs.oracle.com/en/database/oracle/oracle-database/index.html)
- [Oracle Cloud Infrastructure Documentation](https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/overview.htm)


## Acknowledgements

- **Author**: Suresh Mohan, Database User Assistance Development Team

- **Contributors**: Suresh Rajan, Manish Garodia, Subhash Chandra, Ramya P

- **Last Updated By & Date**: Suresh Mohan, October 2021
