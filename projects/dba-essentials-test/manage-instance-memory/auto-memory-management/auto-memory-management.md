# Automatic Memory Management

## Introduction

This lab shows how to enable Automatic Memory Management for Oracle Database from Oracle Enterprise Manager Cloud Control (Oracle EMCC) and SQL command line.

Estimated time: 15 minutes

### Purpose

The simplest way to manage instance memory is to allow the Database Instance to automatically manage and tune it for you. You set a target memory size initialization parameter (`MEMORY_TARGET`) and optionally a maximum memory size initialization parameter (`MEMORY_MAX_TARGET`). The total memory that the instance uses remains relatively constant, based on the value of `MEMORY_TARGET`, and the instance automatically distributes memory between the system global area (SGA) and the instance program global area (instance PGA). As memory requirements change, the instance dynamically redistributes memory between the SGA and instance PGA.  

If you do not enable Automatic Memory Management for your Oracle Database, then you must manually set the memory for both SGA and PGA. While installing Oracle Database, the installer gives you an option to enable Automatic Memory Management. If you did not enable Automatic Memory Management during database installation, you can enable it as explained in this lab.

### Objectives  

Enable Automatic Memory Management for Oracle Database from either Oracle EMCC or the SQL command line. 

### Prerequisites  
This lab assumes you have -
-   A Free Tier, Paid or LiveLabs Oracle Cloud account
-   You have completed:
    -   Lab: Prepare Setup (*Free-tier* and *Paid Tenants* only)
    -   Lab: Setup Compute Instance
    -   Lab: Manage Initialization Parameters  

## Task 1: Set the Environment  

To enable Automatic Memory Management feature using SQL commands, you must set the environment first. 

1.  Log in to your host as *oracle*.  

2.  Open a terminal window and change the current working directory to `$ORACLE_HOME/bin`. 

    ```
    $ <copy>cd /u01/app/oracle/product/21.0.0/dbhome_1/bin</copy>
    ```

3.  Run the command `oraenv` to set the environment variables, if not already set.

    ```
    $ <copy>./oraenv</copy>
    ```

4.  Enter Oracle SID `orcl`.

    ```
    ORACLE_SID = [oracle] ? <copy>orcl</copy>
    The Oracle base has been set to /u01/app/oracle
    ```
    This command also sets the Oracle home path to 
    ```
    /u01/app/oracle/product/21.0.0/dbhome\_1.
    ```

You have set the environment variables for the active terminal session. You can now connect to Oracle Database and run the commands.

**Note:** Every time you open a new terminal window, you must set the environment variables to connect to Oracle Database from that terminal. Environment variables from one terminal do not apply automatically to other terminals. 

## Task 2: Options to Enable Automatic Memory Management

You can enable Automatic Memory Management for your Oracle Database from either Oracle EMCC or the SQL command line.  

-   To enable it from Oracle EMCC, follow *Task 2A*.  

-   To enable it from the SQL command line, follow *Task 2B*. 

## Task 2A: Enable Automatic Memory Management from SQL command line

To enable Automatic Memory Management, shut down and restart Oracle Database.  

1.  From `$ORACLE_HOME/bin`, log in to SQL*Plus as `SYSDBA`.

    ```
    $ <copy>./sqlplus / as sysdba</copy>
    ```

    ```
    SQL*Plus: Release 21.0.0.0.0 - Production on Tue Sep 28 08:23:15 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle.  All rights reserved.

    Connected to:
    Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
    Version 21.3.0.0.0

    SQL>
    ```

2.  View the values of all initialization parameters with the string TARGET in the parameter name.

    ```
    SQL> <copy>show parameter target</copy>

    ```
    It displays the following output.

    ```
    NAME                                 TYPE        VALUE
    ------------------------------------ ----------- ----------------------
    archive_lag_target                   integer     0
    db_big_table_cache_percent_target    string      0
    db_flashback_retention_target        integer     1440
    fast_start_io_target                 integer     0
    fast_start_mttr_target               integer     0
    memory_max_target                    big integer 0
    memory_target                        big integer 0
    parallel_servers_target              integer     40
    pga_aggregate_target                 big integer 1477M
    sga_target                           big integer 4432M
    target_pdbs                          integer     8

    ```

3.  Enter the following commands to change the initialization parameter value.  

    ```
    SQL><copy> alter system set memory_max_target=6G scope=spfile;</copy>      
    ```
    ```
    System altered.
    ```

4.  Set the `memory_target` parameter to 5G.  

    ```
    SQL> <copy>alter system set memory\_target=5G scope=spfile;</copy>  
    ```

    ```  
    System altered.
    ```

5.  Set the `pga_aggregate_target` parameter to 0.  

    ```
    SQL> <copy>alter system set pga_aggregate_target=0 scope=spfile;</copy>
    ```  
    ```
    System altered.
    ```

6.  Set the `sga_target` parameter to 0.  

    ```
    SQL> <copy>alter system set sga_target=0 scope=spfile;</copy>
    ```  
    ```
    System altered.
    ```

    **Note:** The preceding steps instruct you to set `SGA_TARGET` and `PGA_AGGREGATE_TARGET` to zero so that the sizes of the SGA and instance PGA are tuned up and down as required, without restrictions.  

7.  Shut down the Database Instance in the `IMMEDIATE` mode. 

    ```
    SQL> <copy>shutdown immediate;</copy>
    ```
    ```
    Database closed.

    Database dismounted.

    ORACLE instance shut down.
    ```

8.  Start the Database Instance again and open Oracle Database.  

    ```
    SQL><copy>startup</copy>
    ```

    ```
    ORACLE instance started
    Total System Global Area 4647288568 bytes
    Fixed Size                  9694968 bytes
    Variable Size            1073741824 bytes
    Database Buffers         3556769792 bytes
    Redo Buffers                7081984 bytes
    Database mounted.
    Database opened.
    ```

    The Database Instance starts in default *OPEN mode*.  

9.  Execute `show parameter target`  command to view the new values of the initialization parameters

    ```
    SQL><copy>startup</copy>
    ```
    ```
    NAME                                 TYPE        VALUE
    ------------------------------------ ----------- -------
    archive_lag_target                   integer     0
    db_big_table_cache_percent_target    string      0
    db_flashback_retention_target        integer     1440
    fast_start_io_target                 integer     0
    fast_start_mttr_target               integer     0
    memory_max_target                    big integer 6G
    memory_target                        big integer 5G
    parallel_servers_target              integer     40
    pga_aggregate_target                 big integer 0
    sga_target                           big integer 0
    target_pdbs                          integer     9

    ```

    You can confirm that the Automatic Memory Management is enabled by viewing the Enable Option in the Memory Advisors screen. It appears to be greyed out. The greyed out option indicates that the Automatic Memory Management is enabled.  

## Task 2B: Enable Automatic Memory Management from Oracle EMCC

After logging in to Oracle EMCC, you can view the status of Automatic Memory Management and enable it from Oracle EMCC.

1.  From the **Targets** menu, select **Databases.  

    ![Databases](../auto-memory-management/images/emcc-target-db.png)  

    The **Databases** page displays a list of Oracle Databases added to Oracle EMCC as managed targets. The values may differ depending on the system you are using.  

2.  Click on the container name to access the container homepage.  

    ![Instance Homepage](../auto-memory-management/images/emcc-instance-hompage.png)  

3.  From **Performance** menu, select **Advisors Home**.  

    ![Advisors Home](../auto-memory-management/images/performance-advisorshome.png)  

4.  On the Advisors tab, select **Memory Advisors**.  

    ![Memory Advisors](../auto-memory-management/images/advisors-memoryadvisors.png)  

    **Note:** The Memory Advisors option is available only from the Database Instance home page, and not from the PDB home page. You can use Memory Advisors when the Automatic Memory Management feature is disabled. It adjusts memory sizes. It has three advisors that give recommendations on the shared pool in the SGA, the buffer cache in the SGA and the PGA. The Memory Advisors page displays the details on memory usage for the SGA. The Shared pool and buffer cache are part of the SGA.   

    If the **Maximum SGA Size (MB)** field consists of a positive number that is greater than or equal to the desired total amount of memory to allocate to the database, then you can directly **Enable** Automatic Memory Management option without performing rest of the steps.  

5.  In the **Maximum SGA Size (MB)** field, enter the maximum permissible size for database memory. Use the sum of the current sizes of the SGA and instance PGA as a guideline, and optionally add some extra values for extension and click **Apply**.  

    ![Maximum SGA Size](../auto-memory-management/images/totalsgasize-greater-maxmemory.png)  

    A confirmation page appears, indicating that you must restart the database.  

6.  Click **Yes** to restart the database. The Restart Database credentials page appears.  

7.  For the Host Credentials, specify the following.  

    **Credential:** *Named*  
    Oracle EMCC fills in the **UserName** and **Password** fields automatically.  
    You can click **More Details** and then click **Test** to verify if the specified host credentials are working.  

8.  For the Database credentials, specify the following.  

    **Credentials:** *Preferred*  

    The default Credential value is selected as **Preferred**.  
    **Preferred Credential Name:**  *SYSDBA Database Credentials*  

    Click **OK** to proceed.  

    ![Restart Database Credentials](../auto-memory-management/images/restartdb_namedcred.png)  

    A restart database confirmation screen appears.  

9.  Click **OK** to confirm the restart of the database. The database takes a while to restart. After which you receive an update message screen of successful database restart.  

10.  Click **Refresh.** The Database home page appears.  

11.  Click on the Database Instance. From **Performance** menu, select **Advisors Home**.  

    ![Advisors Home](../auto-memory-management/images/performance-advisorshome.png)  

12.  In the Advisors section, select **Memory Advisors**.  

13.  Next to Automatic Memory Management Disabled, click **Enable**.  

    ![Enable button](../auto-memory-management/images/enable-with-skip.png)

14.  The Enable Automatic Memory Management page appears. In the Total Memory Size for Automatic Memory Management field, enter the desired amount of memory to allocate to the database, and then click **OK**.  

    ![Enable Automatic Memory Management](../auto-memory-management/images/enable-amm-screen.png)  

    The window displays a message to confirm that you have enabled Automatic Memory Management. Oracle Database will automatically adjust the memory sizes to achieve optimal distribution.   

    **Note:** To view if the Automatic Memory Management property is enabled, you can confirm by viewing the Enable Option as greyed out in the Memory Advisors screen.  

## Task 3: Disable Automatic Memory Management from Oracle EMCC

From Oracle EMCC, you can disable Automatic Memory Management for Oracle Database and manage the memory sizes manually.

1.  From the **Targets** menu, select **Databases**.  

    ![Databases](../auto-memory-management/images/emcc-target-db.png)  

    The Databases page displays a list of Oracle Databases added to Oracle EMCC as managed targets. The values may differ depending on the system you are using.  

2.  Click on the Database Instance name, *orcl.us.oracle.com*, to open the Database Instance homepage.  

    ![Instance Homepage](../auto-memory-management/images/emcc-instance-hompage.png)  

3.  From **Performance** menu, select **Advisors Home**.  

    ![Advisors Home](../auto-memory-management/images/performance-advisorshome.png)  

4.  In the Advisors section, select **Memory Advisors**.  

    ![Memory Advisors](../auto-memory-management/images/advisors-memoryadvisors.png)  

5.  Click **Disable** next to Automatic Memory Management option.  

    ![Disable Automatic Memory Management](../auto-memory-management/images/memoryadvisors-disable.png)  

    You have disabled Automatic Memory Management for your Oracle Database. The Memory Advisors page displays **Disabled** next to the Automatic Memory Management option.  

    ![Disabled Automatic Memory Management](../auto-memory-management/images/disabled-amm.png)  

Congratulations! You have successfully completed the workshop on *Database Instance and Memory Management*.

## Acknowledgements

- **Author** - Manisha Mati, Senior User Assistance Developer
- **Contributors** - Manish Garodia, Suresh Rajan, Kurt Engeleiter, Suresh Mohan, Jayaprakash Subramanian, Ashwini R
- **Last Updated By/Date** - Manisha Mati, January 2021
