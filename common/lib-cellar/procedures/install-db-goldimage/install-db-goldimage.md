# Oracle Database Gold Image

## Introduction

This lab covers the pre-installation setup and post installation tasks for Oracle Database gold image. It also discusses the steps to deinstall Oracle Database and some troubleshooting scenarios and tips.

## Task 1: Pre-installation setup

Oracle Database installers are available internally as gold images.

1. Visit [DB shiphome gold image annoucements](https://confluence.oraclecorp.com/confluence/pages/viewpage.action?spaceKey=DBTEST&title=Database+Shiphome+Announcement+Home) and look for [21c Linux64](https://confluence.oraclecorp.com/confluence/pages/viewpage.action?pageId=2248170665).

1. Under **Shiphome Location**, check <ins>Database Goldimage</ins>. 

	## Database 21c gold image

	| Select <i>any</i> server      | Link      |
	|:------------------------------|-----------|
	| SLC - prod                    | [/net/slcnas563.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/210727.PRODUCTION](/net/slcnas563.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/210727.PRODUCTION) <br>File - `LINUX.X64_213000_db_home.zip`       |
	| ADC - prod                    | [/net/adcnas481.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/210727.PRODUCTION](/net/adcnas481.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/210727.PRODUCTION) <br>File - `LINUX.X64_213000_db_home.zip`       |
	| <mark>ADC</mark> - **latest** |[/net/adcnas481.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/LATEST/goldimage](/net/adcnas481.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/LATEST/goldimage) <br>File - `db_home.zip`                        |
	| ADC - 210608                  |[/net/adcnas481.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/RC1-210608/goldimage](/net/adcnas481.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/RC1-210608/goldimage) <br>File - `db_home.zip`                     |
	| SaltLake - **latest**         | [/net/slcnas563.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/LATEST/goldimage](/net/slcnas563.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/LATEST/goldimage) <br>File - `db_home.zip`                        |
	| SaltLake - 210608             | [/net/slcnas563.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/RC1-210608/goldimage](/net/slcnas563.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/RC1-210608/goldimage) <br>File - `db_home.zip`                     |
	| HQ - **latest**               | [/net/rwsnas436.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0//LATEST/goldimage](/net/rwsnas436.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0//LATEST/goldimage) <br>File - `db_home.zip`                        |
	| HQ - 210608                   | [/net/rwsnas436.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/RC1-210608/goldimage](/net/rwsnas436.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/RC1-210608/goldimage) <br>File - `db_home.zip`                     |
	| <mark>ade_autofs</mark> - **new**<br><i>from Prakash J </i> | [/ade\_autofs/dd223\_db/RDBMS/21.3.0.0.0/LINUX.X64/210727.XE/install/shiphome/goldimage](/ade_autofs/dd223_db/RDBMS/21.3.0.0.0/LINUX.X64/210727.XE/install/shiphome/goldimage) <br>File - `db_home.zip`                                            |
	| ade_autofs - old              | [/ade\_autofs/dd77\_db/RDBMS/21.3.0.0.0/LINUX.X64/210727/install/shiphome/goldimage](/ade_autofs/dd77_db/RDBMS/21.3.0.0.0/LINUX.X64/210727/install/shiphome/goldimage) |

1. Open a terminal window and create the folder structure for `$ORACLE_HOME`.

	```
	$ <copy>mkdir -p /scratch/u01/app/oracle/product/21.0.0/dbhome_1</copy>
	```

	> **Caution:** Do all installations only under */scratch*, never in `ade` or any other directory. 

1. Go to the location where the *gold image* exists.   
	This example uses <ins>the ADC server</ins>.

	```
	$ <copy>cd /net/adcnas481.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/LATEST/goldimage</copy>
	```

1. Unzip the installer into the Oracle home folder.   

	**Syntax**

	```
	$ unzip -q <file_name> -d <full_path>
	```
	> where,   
	`-q` for quiet operation (run in background)   
	`-d` to create the directory stucture


	**Example 1** - for ADC server
	
	```
	$ <copy>unzip -q db_home.zip -d /scratch/u01/app/oracle/product/21.0.0/dbhome_1</copy>
	```

	**Example 2** - for prod

	```
	$ <copy>unzip -q LINUX.X64_213000_db_home.zip -d /scratch/u01/app/oracle/product/21.0.0/dbhome_1</copy>
	```

	Get an *extra copy of the installer quickly* on your local system.

	```
	$ <copy>unzip -q /ade_autofs/dd223_db/RDBMS/21.3.0.0.0/LINUX.X64/210727.XE/install/shiphome/goldimage/db_home.zip -d /scratch/u01/app/oracle/product/21.0.0/dbhome_unzip02</copy>
	```

1. Go to Oracle home.
	```
	$ <copy>cd /scratch/u01/app/oracle/product/21.0.0/dbhome_1</copy>
	```

1. Run the Oracle Database Setup Wizard (Installer).

	```
	$ <copy>./runInstaller</copy>
	```

### Log in to EM Express

EM Exp for DB 19c
 - [CDB$ROOT port 5501](https://phoenix62464.dev1sub1phx.databasede1phx.oraclevcn.com:5501/em)   
 - [ORCL19CCDB port 5502](https://phoenix62464.dev1sub1phx.databasede1phx.oraclevcn.com:5502/em)   

EM Exp for DB 21c
 - [CDB$ROOT port 5500](https://phoenix62464.dev1sub1phx.databasede1phx.oraclevcn.com:5500/em)
 - [ORCLPDB port 5504](https://phoenix62464.dev1sub1phx.databasede1phx.oraclevcn.com:5504/em)

**Credentials**
 - User name - *system*
 - Password - Enter the password <if type="hidden">*Welcome_1*</if>
 - Container name - (leave empty)

> **Note:** If you forget the database password, dig into the [Admin Guide](https://docs.oracle.com/en/database/oracle/oracle-database/21/admin/index.html) and fish out how to change the password externally.

## Task 2: Post Installation steps

#### Listeners
- DB 21c - port *1522*
- DB 19c - port *1523*

1. Set the environment variables
1. Connect to SQL command line
1. View the inventory location
1. View Oracle SIDs and Oracle homes in the system
1. View Oracle base locations

	----
	## 1. Set the environment variables

	Use any one of the following.

	**Shell - csh**
	```
	<copy>
	setenv ORACLE_SID orcl
	setenv ORACLE_HOME /scratch/u01/app/oracle/product/21.0.0/dbhome_1
	</copy>
	```

	----------- ------- --------------- -------------------------
		setenv ORACLE_SID orcl
		setenv ORACLE_HOME /scratch/u01/app/oracle/product/21.0.0/dbhome_1
	----------- ------- --------------- -------------------------

	**Shell - bash**
	```
	<copy>
	export ORACLE_SID=orcl
	export ORACLE_HOME=/scratch/u01/app/oracle/product/21.0.0/dbhome_1
	</copy>
	```
	**Option 1**   
	Works from any directory
	```
	$ <copy>. oraenv</copy>
	```
	**Option 2**   
	Works only from `$ORACLE_HOME/bin`
	```
	$ <copy>./oraenv</copy>
	```

	----
	## 2. Connect to SQL command line
	Using -
	- SQL Plus
	- SQL cl

	**For SQL Plus**   
	<ins>Option 1</ins> - Connect as `system` and enter the user name and password.
	```
	$ <copy>./sqlplus</copy>
	```
	- Enter user-name: *system*
	- Enter password: *Welcome_1*

	<ins>Option 2</ins> - Connect as `sysdba` (no password required).
	```
	$ <copy>./sqlplus / as sysdba</copy>
	```
	```
	SQL*Plus: Release 21.0.0.0.0 - Production on Mon Jan 3 10:21:08 2022
	Version 21.3.0.0.0

	Copyright (c) 1982, 2021, Oracle.  All rights reserved.


	Connected to:
	Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
	Version 21.3.0.0.0
	```
	**For SQL cl**   
	Connect as `sysdba` (no password required).
	```
	$ <copy>./sql / as sysdba</copy>
	```
	```
	SQLcl: Release 21.2 Production on Mon Jan 03 10:19:21 2022

	Copyright (c) 1982, 2022, Oracle.  All rights reserved.

	Connected to:
	Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
	Version 21.3.0.0.0
	```

	----
	## 3. View the inventory location

	Using `oraInst.loc`

	```
	$ <copy>cat /etc/oraInst.loc</copy>

	inventory_loc=/scratch/u01/app/oraInventory
	```

	----
	## 4. View Oracle SIDs and Oracle homes in the system

	Using `/etc/oratab`

	```
	$ <copy>cat /etc/oratab</copy>
	```
	```
	# This file is used by ORACLE utilities.  It is created by root.sh
	# and updated by either Database Configuration Assistant while creating
	# a database or ASM Configuration Assistant while creating ASM instance.

	# A colon, ':', is used as the field terminator.  A new line terminates
	# the entry.  Lines beginning with a pound sign, '#', are comments.
	#
	# Entries are of the form:
	#   $ORACLE_SID:$ORACLE_HOME:<N|Y>:
	#
	# The first and second fields are the system identifier and home
	# directory of the database respectively.  The third field indicates
	# to the dbstart utility that the database should , "Y", or should not,
	# "N", be brought up at system boot time.
	#
	# Multiple entries with the same $ORACLE_SID are not allowed.
	#
	#
	orcl:/scratch/u01/app/oracle/product/21.0.0/dbhome_1:N
	orcl19c:/scratch/u01/app/oracle/product/19.0.0/dbhome_02:N
	orclmm:/scratch/u01/app/oracle/product/21.0.0/dbhome_manisha01:N

	```

	Using `oraInventory`

	1. Go to this location.

		```
		$ <copy>cd /scratch/u01/app/oraInventory/ContentsXML</copy>
		```

	1. View the contents of `inventory.xml`.

		```
		$ <copy>cat inventory.xml</copy>
		```

	Using `/opt`

	1. Go to this location.

		```
		$ <copy>cd /opt/ORCLfmap/prot1_64/etc</copy>
		```

	1. View the contents of `filemap.ora`.

		```
		$ <copy>cat filemap.ora</copy>
		```

		```
		###############################################################################
		#                                                                             #
		# This is the configuration file that describes all the mapping libraries     #
		# available.                                                                  #
		#                                                                             #
		# The following row needs to be created for each library:                     #
		# lib={vendor name}: {mapping library path}                                   #
		#                                                                             #
		# Note that the ordering of the libraries in this file is extremely           #
		# important. The libraries are queried based on their order in the            #
		# configuration file.                                                         #
		#                                                                             #
		# Oracle provides a mapping library for EMC Symmetrix arrays. This library    #
		# (LIBMAPSYM.SO) uses the SYMAPI and SYMLVM EMC libraries.                    #
		#                                                                             #
		# UNCOMMENT THE ROW CORRESPONDING TO THAT LIBRARY ONLY IF THE SYM LIBRARIES   #
		# ARE AVAILABLE ON SOLARIS.                                                   #
		###############################################################################

		## The next row needs to be commented out only for Solaris on EMC storage
		#lib=Oracle: /scratch/u01/app/oracle/product/21.0.0/dbhome_1/lib/%s_mapsym%

		## The next row can be comented out on ALL UNIX PLATFORMS if no other
		## libraries exist
		#lib=Oracle: /scratch/u01/app/oracle/product/21.0.0/dbhome_1/lib/%s_mapdummy%
		```

	----
	## 5. View Oracle base locations

	1. Go to the `install` directory. 
		```
		$ <copy>cd /scratch/u01/app/oracle/product/21.0.0/dbhome_1/install</copy>
		```
	1. View the contents of the `orabasetab` file.

		```
		$ <copy>cat orabasetab</copy>
		```
		```
		#orabasetab file is used to track Oracle Home associated with Oracle Base
		/scratch/u01/app/oracle/product/21.0.0/dbhome_1:/scratch/u01/app/mgarodia:OraDB21Home1:Y:
		```

		Base location for Oracle Database 
		```
		$ /scratch/u01/app/mgarodia
		```
		Contents of Oracle base 

		```
		$ ls 

		$ admin  audit  cfgtoollogs  dbs  diag  fast_recovery_area  homes  oradata  recovery_area
		```
		De-install removes all these folders under the base location.

## Task 3: Deinstall Oracle Database

1. Go to the `deinstall` folder.

	```
	$ <copy>cd /u01/app/oracle/product/21.0.0/dbhome_1/deinstall</copy>
	```

1. Run the `deinstall` command.

	```
	$ <copy>./deinstall</copy>
	```


## Task 4: Troubleshooting

- Troubleshooting tips and scenarios

	## Create directory under root

	**Problem:** In the VM, you can create the folder `/u01` under `/scratch` but not root `/`.   
	**Workaround:** Create /u01 as root, change the ownership to oracle, and mode to executable.

	1. Change the user to `root`.

		Option 1
		```
		$ <copy>/usr/local/packages/aime/install/run_as_root "bash"</copy>
		```
		Or, use these: 
		- `sudo su -`
		- `sudo -i`   
			<if type="hidden">Password: Enter the LDAP/Kerberos password - *Livelabs\*1*</if>

	1. Create the folder under root.

		```
		$ <copy>mkdir -p /u01/app/oracle/product/21.0.0/dbhome_1</copy>
		```
	1. Change the ownership to *oracle* (user) for the folder `/u01`.

		```
		$ <copy>chown -R oracle:dba /u01</copy>
		```

	1. Change the mod to `777` for `/u01`.

		```
		$ <copy>chmod 777 /u01</copy>
		```

	----

	## Graphical display error

	**ERROR:** Unable to verify the graphical display setup. This application requires X display. Make sure that xdpyinfo exist under PATH variable.
	No protocol specified

	Can't connect to X11 window server using ':1' as the value of the DISPLAY variable.

	**Solution:** Copy ~/.Xauthority to the `oracle` folder under `/home`.

	```
	<copy>cp ~/.Xauthority /home/oracle</copy>
	```

	Error is reproducible thus:

	```
	$ export DISPLAY=:0.0
	$ ./runInstaller
	ERROR: Unable to verify the graphical display setup. This application requires X display. Make sure that xdpyinfo exist under PATH variable.

	Can't connect to X11 window server using ':0.0' as the value of the DISPLAY variable.
	OP's X server was Hummingbird Exceed. Xming will work as well.
	```

	The actual solution depends on:
	- whether you are su'd to oracle from a different login account.
	- whether you are using X11 forwarding.
	- the actual port used by X11 forwarding, which could be 6010 or a different port.
	- If you logged in and then su'd to oracle, then copy ~/.Xauthority to the oracle account.
	- If you are using X11 forwarding and the forwarding port is 6010, then DISPLAY=localhost:10.0 is correct.
	- If you are not using X11 forwarding, and if port 6000 on your PC is reachable from the oracle server, then export DISPLAY=your.pc.ip.address:0.0 is correct.

	1. Install xterm and use xterm to test X windows.
	1. Install xdpyinfo.

	----

	## xdpyinfo Errors

	The xdpyinfo program must be installed.

	1. Install `xdpyinfo`.

		```
		$ <copy>yum install xorg-x11-utils-<version-number></copy>
		```

	1. If already installed, check whether the `oracle` user has execute privileges.

		```
		<copy>
		cd /usr/bin
		ls -al | grep xdpyinfo
		</copy>
		```
		Result: The oracle user has execute privileges.
		```
		-rwxr-xr-x   1 root root      38112 Feb 23  2015 xdpyinfo
		```

	1. If the `oracle` user does not have executable privileges, log in as root and execute this command.

		```
		$ <copy>xhost +SI:localuser:oracle</copy>
		```
		Result: 
		```
		localuser:oracle being added to access control list
		```

	Refer [Installation Guide - xdpyinfo Errors](https://docs.oracle.com/cd/E89497_01/html/rpm_80_installation/GUID-842C3883-9BC1-4D37-82C1-9E7F24628AA7.htm).

## Acknowledgements

 - **Author** - Manish Garodia, Team Database UAD
 - **Last Updated on** - February 1, (Tue) 2022
