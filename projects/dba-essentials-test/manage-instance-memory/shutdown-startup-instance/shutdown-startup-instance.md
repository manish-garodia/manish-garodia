# Shut down and Start up the Database Instance

## Introduction

This lab steps you through the procedure to shut down and start up an Oracle instance using SQL commands and Oracle Enterprise Manager Cloud Control (Oracle EMCC) .

Estimated Time: 15 minutes

### Objectives

- Set the environment variables and manage Database Instance using SQL commands.
- Shut down and start up Oracle Database from Oracle EMCC. 

### Prerequisites

This lab assumes you have -

-   A Free Tier, Paid or LiveLabs Oracle Cloud account
-   Completed -
    -   Lab: Prepare Setup (*Free-tier* and *Paid Tenants* only)
    -   Lab: Setup Compute Instance
    -   Lab: Initialize Environment
-   Oracle EMCC with Oracle Database 21c and listener added as managed targets.

## Task 1: Set the Environment

To shut down and start the Database Instance using SQL commands, you must set the environment first. 

1.  Log in to your host as *oracle*, the user who can perform database administration.  

2.  Open a terminal window and change the current working directory to `$ORACLE_HOME/bin`.

    ```
    $ <copy>cd /u01/app/oracle/product/21.0.0/dbhome_1/bin</copy>
    ```

3.  Run the command `oraenv` to set the environment variables.  

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
    /u01/app/oracle/product/21.0.0/dbhome_1
    ```

You have set the environment variables for the active terminal session. You can now connect to Oracle Database and run the commands.

**Note**: Every time you open a new terminal window, you must set the environment variables to connect to Oracle Database from that terminal. Environment variables from one terminal do not apply automatically to other terminals.   

Alternatively, you may run the script file `.set-env-db.sh` from the home location and enter the number for `ORACLE_SID`, for example, *3* for `orcl`. It sets the environment variables automatically.

## Task 2: Shut down the Database Instance from SQL Command Line

After setting the environment as instructed in Task 1 of this lab, you can shut down the Database Instance from SQL command line.

1.  From `$ORACLE_HOME/bin`, log in to SQL*Plus as SYSDBA.

    ```
    $ <copy>./sqlplus / as sysdba</copy>
    ```

    ```
    SQL*Plus: Release 21.0.0.0.0 - Production on Tue Nov 28 08:23:15 2021
    Version 21.3.0.0.0

    Copyright (c) 1982, 2021, Oracle.  All rights reserved.

    Connected to:
    Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
    Version 21.3.0.0.0

    SQL>
    ```

2.  View the current status of Database Instance and confirm that it is open by executing the following command:  

    ```
    SQL> <copy>select status from v$instance;</copy>    
    ```
    ```    
    `STATUS`  
    `------------`  
    `OPEN`
    ```
    The Database Instance is open.  

3.  Close Oracle Database and shut down the instance in *IMMEDIATE* mode from the SQL prompt.  

    ```
    SQL><copy>shutdown immediate</copy>
    ```
    ```
    Database closed.

    Database dismounted.

    ORACLE instance shut down.
    ```

    The Oracle Database shuts down in the immediate mode.

4.  View the current status of the Database Instance and verify that Oracle Database is not open.

    ```
    SQL><copy> select status from v$instance;</copy>
    ```
    ```
    ERROR:  
    ORA-03114: not connected to ORACLE
    ```

    The output confirms that Oracle Database is in closed state.   

    You have now shut down the Database Instance. 

## Task 3: Start the Database Instance from SQL Command Line

After setting the environment as instructed in Task 1 of this lab, you can start the Database Instance from SQL command line.

1.  Start the Database Instance again and open Oracle Database from SQL*Plus.

    ```
    SQL> <copy>startup</copy>
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
    The Database Instance starts in default *OPEN* mode.

2.  When you start the CDB, all PDBs remain in the mounted mode. There is no default mechanism to automatically start  them up when the CDB starts. You can start up all the PDBs by executing the following command.

    ```
    SQL> alter pluggable database all open;
    ```

    ```
    Pluggable database altered.
    ```

    The Database Instance opens all PDBs in the container. 

3.  View and confirm the status of the current Database Instance by executing the following command.

    ```
    SQL> <copy>select status from v$instance;</copy>
    ```
    ```
    STATUS
    ------------
    OPEN  
    ```

 The status of Oracle Database is in open state.  

You have restarted the Database Instance successfully.

##Task 4: Shut down the Database Instance from Oracle EMCC

Log in to Oracle EMCC from a web browser and shut down the Database Instance as follows.

1.  From the **Targets** menu, select **Databases**.  

    ![Databases](../shutdown-startup-instance/images/emcc-target-db.png)  

    The **Databases** page displays a list of Oracle Databases added to Oracle EMCC as managed targets.  

    The values may differ depending on the system you are using.  
    ![Database List](../shutdown-startup-instance/images/emcc-dbvalues.png)  

2.  Click on the Database Instance name to open the instance home page.

    ![Instance Homepage](../shutdown-startup-instance/images/emcc-instance-hompage.png)  

3.  From **Oracle Database** menu, go to **Control** option and select **Startup/Shutdown**.  

    ![Startup or Shutdown](../shutdown-startup-instance/images/startup-shutdown.png)  

    The Startup/Shutdown Credentials page appears.  

    ![Startup or Shutdown Credentials](../shutdown-startup-instance/images/startup-shutdown-credential.png)  

4.  For the Host Credentials, specify the following. 

    **Credential**: *Named*  
    Oracle EMCC fills in the **UserName** and **Password** fields automatically.  

    You can click **More Details** and then click **Test** to verify if the specified host credentials are working.  

5.  For the Database credentials, specify the following.  

    **Credential:** *Preferred*. This is the default value selected.
    **Preferred Credential Name:**  *SYSDBA Database Credentials*. This was the credential you assigned during Oracle Database installation.  

    Click **OK** to proceed.  

6.  The window prompts you to confirm the operation. Click **Yes** to initiate the `SHUTDOWN IMMEDIATE` operation on Oracle Database.  

    ![Shutdown immediate](../shutdown-startup-instance/images/shutdown-immediate.png)  

    The Startup/Shutdown Activity Information page appears, informing you that the database is being shut down.  

    ![Startup or Shutdown Activity Information](../shutdown-startup-instance/images/startup-shutdown-activity.png)  

7.  After a few minutes, click **Refresh** to return to the Database Home page.  

    ![Database down state](../shutdown-startup-instance/images/database-down-state.png)  

The downward red arrow in the status indicates that Oracle Database is down.  

## Task 5: Start the Database Instance from Oracle EMCC

After shutting down Oracle Database in Oracle EMCC, you can start up the Database Instance by following the instructions as provided below.

1.  From the **Targets** menu, select **Databases**.  

    ![Databases](../shutdown-startup-instance/images/emcc-target-db.png)  

2.  On the Database Home page, from **Oracle Database** menu, select **Control** option and click **Startup/Shutdown**.  

    ![Startup or Shutdown](../shutdown-startup-instance/images/startup-shutdown.png)  

    The Host and Database Credentials page appears.

    ![Startup or Shutdown Credentials](../shutdown-startup-instance/images/startup-shutdown-credential.png)

3.  For the Host Credentials, specify the following.  

    **Credential:** *Named*  
    Oracle EMCC fills in the **UserName** and **Password** fields automatically.  
    You can click **More Details** and then click **Test** to verify if the specified host credentials are working.  

4.  For the Database credentials, specify the following.  

    **Credential:** *Preferred*. This is the default value selected.
    **Preferred Credential Name:** *SYSDBA Database Credentials*. This was the credential you assigned during Oracle Database installation.  

    Click **OK** to proceed.  

5.  Click **Yes** to start up the database in the `OPEN` mode.  

    To learn about the various start up modes, see the [Appendix](https://confluence.oraclecorp.com/confluence/display/DCUA/Manage+Database+Instance+and+Memory+for+Oracle+Database+21c) section in the *Manage Database Instance and Memory for Oracle Database 21c* lab.

    ![Startup or Shutdown confirmation](../shutdown-startup-instance/images/startup-shutdown-confirmation.png)  

    The Startup/Shutdown Activity Information page appears, informing you that the database is being started.  

    ![Startup or SHutdown Activity Information](../shutdown-startup-instance/images/startup-shutdown-activity-info.png)  

6.  After a few minutes, click **Refresh** to return to the Database Home page.  

    ![Database Homepage](../shutdown-startup-instance/images/dbhomepage.png)   

    The upward green arrow in the status indicates that Oracle Database is up and running.

## Acknowledgements

- **Author** - Manisha Mati, Senior User Assistance Developer
- **Contributors** - Manish Garodia, Suresh Rajan, Kurt Engeleiter, Suresh Mohan, Jayaprakash Subramanian, Ashwini R
- **Last Updated By/Date** - Manisha Mati, January 2021
