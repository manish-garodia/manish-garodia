#  Linux -:- feed the penguin ![Linux](./images/linux-small.png)

## Introduction
Get hands dirty with Linux commands, tips, and tricks.

## Linux Terminal
 - Common

	----
	## Shell commands
	 - check the current (active running) shell

		```
		$ <copy>echo $0</copy>

		/bin/csh
		```
		```
		$ <copy>ps -p $$</copy>

		  PID TTY          TIME CMD
		22850 pts/4    00:00:00 csh
		```

	 - find out all available shells

		```
		$ <copy>cat /etc/shells</copy>
		```
		```
		/bin/sh
		/bin/bash
		/usr/bin/sh
		/usr/bin/bash
		/bin/ksh
		/bin/rksh
		/bin/zsh
		/bin/tcsh
		/bin/csh
		```

	 - Default bash prompt

		```
		bash-4.4$
		```

	 - Add date to bash prompt

		```
		$ <copy>export PS1="$(date +\k:\M:\S) $ "</copy>
		```
		```
		11:17:24 $
		```

	 - Add user/host information to bash prompt

		```
		$ <copy>PS1="[\mgarodia@\phoenix123546 \D{\Y\m\d-\H:\M:\S}]\$ "</copy>
		```
		```
		[\mgarodia@\phoenix123546 20221123-11:15:17]$
		```

		Remove the slashes before every percentage symbol.

		> **Note:** This is a temporary variable.   
		New terminal opens with the default bash prompt, *`bash-4.4$`*.

	 To return to the previous mode or go back to the previous shell -
		 - type *`exit`*   
		   or
		 - Press **Ctrl** + **D**

	----
	## Switch shell

	```
	$ <copy>exec /bin/sh</copy>

	sh-4.2$
	```

	- **Temporary** - Applicable to the current terminal session only.

		From *bash* to *c*

		```
		$ <copy>exec csh</copy>
		or
		$ csh
		```

		From *c* to *bash*

		```
		$ <copy>exec bash</copy>
		or
		$ bash
		```

	- **Permanent**

		```
		$ <copy>chsh -s /bin/csh</copy>
		$ Password:
		```

	----
	## Run command as root

	Syntax

	```
	$ su -c <command> <username>
	```

	Example

	```
	$ <copy>su -c /scratch/u01/app/oracle/product/21.0.0/dbhome_01/root.sh mgarodia</copy>
	```

	----
	## Keyboard shortcuts

	Shortcuts for Linux terminal shell prompt.

	 | shortcut       | action                                                          |
	 |----------------|-----------------------------------------------------------------|
	 | **Ctrl** + *L* | clear screen                                                    |
	 | **Ctrl** + *D* | logout from sudo user back to the original user                 |
	 | **Ctrl** + *U* | erases from the current cursor position to the begining of line |
	 | **Ctrl** + *A* | moves cursor position to the beginning of line                  |
	 | **Ctrl** + *E* | moves cursor position to the end of line                        |

## Users & Groups

- User and group administration

	----
	## User commands

	 1. Show current user
	 1. User login shells
	 1. Switch to a different user
	 1. Switch to root
	 1. Exit from root/shell
	 1. Check sudo password

	----
	1. **Show current user**

		```
		$ <copy>whoami</copy>
		[username]
		```
		or
		```
		$ <copy>echo $USER</copy>
		[username]
		```

	1. **User login shells**

		```
		$ <copy>who</copy>
		```
		```
		mgarodia pts/0        2022-11-09 18:13 (:1)
		mgarodia pts/1        2022-11-09 18:14 (:1)
		mgarodia pts/2        2022-11-10 04:45 (:1)
		mgarodia pts/3        2022-11-09 18:24 (:1)
		mgarodia pts/4        2022-11-09 18:36 (:1)
		mgarodia pts/5        2022-11-10 14:18 (:1)
		```
		or
		```
		$ <copy>w</copy>
		```
		```
		 14:40:07 up 1 day, 40 min,  6 users,  load average: 0.00, 0.00, 0.00
		USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
		mgarodia pts/0    :1               Wed18   20:26m  0.00s 13.60s kdeinit4: kded4 [kdeinit]
		mgarodia pts/1    :1               Wed18   30:53   0.11s  0.11s -bin/csh
		mgarodia pts/2    :1               04:45    9:53m  0.38s  0.06s -bin/csh
		mgarodia pts/3    :1               Wed18   19:41m  1.28s  1.22s ./sqlplus   as sysdba
		mgarodia pts/4    :1               Wed18   21:50   0.18s  0.05s -sh
		mgarodia pts/5    :1               14:18    4.00s  0.04s  0.04s -bin/csh
		```

	1. **Switch to a different user**

		Syntax

		```
		$ sudo su - <username> -s <shell>
		```

		Example, switch to *oracle* with `c` shell.

		```
		$ sudo su - oracle /usr/bin/csh
		```

		> **Did you know..?**   
		The user *oracle* requires no password. Use this user to install the database and perform project-related activities.

	1. **Switch to root**

		```
		$ <copy>sudo -i</copy>
		$ Password:
		```
		```
		$ <copy>sudo su -</copy>
		$ Password:
		```

		The following requires no password.

		```
		$ <copy>/usr/local/packages/aime/install/run_as_root "bash"</copy>
		```

		```
		$ <copy>sudo su - || (sudo sed -i -e 's|root:x:0:0:root:/root:.*$|root:x:0:0:root:/root:/bin/bash|g' /etc/passwd && sudo su -)</copy>
		```

	1. **Exit from root**

		To logout from root (or any current user) and to go back to the previous user:

		 - type *`exit`*

			```
			$ <copy>exit</copy>
			```
			or
		 - Press **Ctrl** + **D**

	1. **Check sudo password**

		```
		$ <copy>sudo ls</copy>
		$ Password:
		```

	----
	## Group commands

	 *`g`* - Primary group
	 *`G`* - Secondary group

	 1. Show all groups the user belongs to
	 1. Complete user/group details
	 1. Get entries from database

	----

	1. **Show all groups the user belongs to**

		Syntax
		```
		$ groups <username>
		```

		Examples

		```
		$ <copy>groups</copy>

		wheel dba oinstall
		```
		```
		$ <copy>groups mgarodia</copy>

		mgarodia : wheel dba oinstall
		```

	1. **Complete user/group details**

		Syntax

		```
		$ id <username>
		```

		for only the current user

		```
		$ id
		```

		Example

		```
		$ <copy>id mgarodia</copy>

		uid=1477205(mgarodia) gid=10(wheel) groups=10(wheel),8500(dba),59968(oinstall)
		```

	1. **Get entries from database**

		Syntax

		```
		$ getent group <group>
		```

		Example

		```
		$ <copy>getent group dba</copy>

		dba:x:8500:mgarodia,oracle
		```

	----
	## Manage users and groups

	 1. Create a new group
	 1. Delete a group
	 1. Create a new user
	 1. Add user to groups
	 1. Change user password
	 1. Modify the primary group of user
	 1. Modify secondary groups of user
	 1. Remove user from group
	 1. Modify user default shell

	----

	1. **Create a new group**

		```
		$ <copy>sudo groupadd </copy><group>
		```

	1. **Delete a group**

		```
		$ <copy>sudo groupdel </copy><group>
		```

	1. **Create a new user**

		```
		$ <copy>sudo useradd </copy><username>
		```

	1. **Add user to groups**

		Syntax

		```
		$ sudo useradd -g (primary group) users -G wheel,developers (secondary groups) <username>
		```

		Example

		```
		$ <copy>sudo useradd -g wheel -G dba,oinstall mgarodia</copy>
		```

	1. **Change user password**

		```
		$ sudo -u <username> passwd
		```

	1. **Modify the primary group of user**

		Syntax

		```
		$ sudo usermod -g <group> <username>
		```

		Example

		```
		$ <copy>sudo usermod -g developers mgarodia</copy>
		```

	1. **Modify secondary groups of user**

		Syntax

		```
		$ sudo usermod -a -G <group1,group2,group3 use comma with no spaces> <username>
		```

		Example

		```
		$ <copy>sudo usermod -a -G dba,oinstall mgarodia</copy>
		```

		> **Caution:** Ensure to use the option *-a* to append while modifying the user groups. If you do not use *-a*, the command removes the user from the groups not mentioned after *-G*.

	1. **Remove user from group**

		Syntax

		```
		$ sudo gpasswd -d <username> <group>
		```

		The option *-d* deletes the user.

		```
		$ sudo deluser <username< <group>
		```

		Example

		```
		$ sudo gpasswd -d mgarodia oinstall
		```

	1. **Modify user default shell**

		Syntax

		```
		$ sudo usermod -s <shell> <username>
		```

		Example

		```
		$ <copy>sudo usermod -s /usr/bin/csh mgarodia</copy>
		```

## files-folders

 - directories basic
 - make directories
 - copy
 - move or rename
 - remove
 - find
 - other general

	----
	## directories basic

	 - Present working directory

		```
		$ <copy>pwd</copy>
		```

	 - List directories and classify, append indicators `/`, `=`, `*`, `@`, `|`, or `>` to items

		```
		$ <copy>ls -F</copy>
		```
		```
		[mgarodia@phoenix123546 ~/Downloads]$ ls -F
		db_templates/  firefox-bms-linux.html  ManishDoc_copy/  ords-21.2.0.174.1826.zip
		```

	 - List directories recursive *-R*

		```
		$ <copy>ls -R</copy>
		```
		```
		.:
		db_templates  firefox-bms-linux.html  ManishDoc_copy  ords-21.2.0.174.1826.zip

		./db_templates:
		19.5.0.0_Database_Template_for_EM13_4_0_0_0_Linux_x64.zip  19_5_0_0_Database_Template_with_cdbpdb_for_EM13_4_0_0_0_Linux_x64.zip

		./ManishDoc_copy:
		bkup  emcc_params_fix.txt  emcli_manage_listener.txt  hostname.txt  misc  spool.txt  sql_commands.txt  testing commands  working commands

		./ManishDoc_copy/bkup:
		deinstall_emcc.sh  goldimage_unzip01.sh

		./ManishDoc_copy/misc:
		DBAdminWorkshop.tigervnc  phoenix123546.dev3sub1phx.databasede3phx.oraclevcn.com.tigervnc  slc10wsw.us.oracle.com-2.tigervnc  VM proxy.png
		MGcommands.txt            Proxy.txt                                                       temp.txt

		./ManishDoc_copy/testing commands:
		deinstall_emcc.sh  sql19c.sh

		./ManishDoc_copy/working commands:
		goldimage21c_unzip01.sh  prod19c_unzip.sh
		```

	 - go to a directory and view its tree structure

		Syntax

		```
		$ <copy>tree -La 5 -F</copy>
		```

		Sample

		```
		.
		|-- folder-a/
			|-- folder-a1/
			|   |-- folder-aa1/
			|   |   |-- file-aa1
			|   |   |-- file-aa2
			|   |-- file-a1
			|   |-- file-a2
			|-- folder-b1/
			|   |-- folder-bb1/
			|   |-- folder-bb2
			|   |   |-- file-bb1
					|-- file-bb2
					|-- file-bb3
		```

		Example

		```
		$ cd ~/Downloads/
		$ <copy>tree -La 5 -F</copy>
		```
		```
		.
		|-- db_templates/
		|   |-- 19.5.0.0_Database_Template_for_EM13_4_0_0_0_Linux_x64.zip
		|   `-- 19_5_0_0_Database_Template_with_cdbpdb_for_EM13_4_0_0_0_Linux_x64.zip
		|-- firefox-bms-linux.html
		|-- ManishDoc_copy/
		|   |-- bkup/
		|   |   |-- deinstall_emcc.sh
		|   |   `-- goldimage_unzip01.sh
		|   |-- emcc_params_fix.txt
		|   |-- emcli_manage_listener.txt
		|   |-- hostname.txt
		|   |-- misc/
		|   |   |-- DBAdminWorkshop.tigervnc
		|   |   |-- MGcommands.txt
		|   |   |-- phoenix123546.dev3sub1phx.databasede3phx.oraclevcn.com.tigervnc
		|   |   |-- Proxy.txt
		|   |   |-- slc10wsw.us.oracle.com-2.tigervnc
		|   |   |-- temp.txt
		|   |   `-- VM\ proxy.png
		|   |-- spool.txt
		|   |-- sql_commands.txt
		|   |-- testing\ commands/
		|   |   |-- deinstall_emcc.sh
		|   |   `-- sql19c.sh
		|   |-- working\ commands/
		|   |   |-- goldimage21c_unzip01.sh
		|   |   `-- prod19c_unzip.sh
		|-- ords-21.2.0.174.1826.zip

		6 directories, 22 files
		```

		----
		## Screenshot

		![tree command](./images/tree-command.png " ")

	 - go back to the previous directory

		```
		$ <copy>cd -</copy>
		```

	- Check variables

		*`$home`*

		```
		 $ <copy>echo $home</copy>
		```

		*`$DISPLAY`*

		```
		 $ <copy>echo $DISPLAY</copy>
		```

		*`$ORACLE_SID`*

		```
		 $ <copy>echo $ORACLE_SID</copy>
		```

		*`$ORACLE_HOME`*

		```
		 $ <copy>echo $ORACLE_HOME</copy>
		```

	----
	## make directories

	 - Create a directory in home `/home/mgarodia`

		```
		$ <copy>mkdir ~/directory/</copy>
		```

	 - Create multiple directories and sub directories together

		```
		$ <copy>mkdir -p /home/linuxize/music/rock/gothic</copy>
		```

		> **Did you know..?**   
		The *-p* flag creates a parent-child directories structure, if the directories does not exist. If you do not specify *-p*, then `mkdir` returns an error:
		`No such file or directory`.

	 - Create directories as a <i>tree structure</i>

		```
		$ <copy>mkdir -p food/{icecream/strawberry,fruits,salad,juice/{apple,orange,mixed},soup/chicken/spicy}</copy>
		```
		```
		food/
		|-- fruits
		|-- icecream
		|   `-- strawberry
		`-- juice
		|   |-- apple
		|   |-- mixed
		|   `-- orange
		|-- salad
		`-- soup
			`-- chicken
				`-- spicy
		```

		Example

		```
		$ <copy>mkdir -p htg/{articles/{new,rewrites},images,notes,done}</copy>
		```
		```
		htg/
		|-- articles
		|   |-- new
		|   `-- rewrites
		`-- done
		|-- images
		`-- notes
		```

		<if type="hidden">

		Example, Cite: [mkdir command](https://linuxize.com/post/how-to-create-directories-in-linux-with-the-mkdir-command/)

		```
		$ <copy>mkdir -p /music/{jazz/blues,folk,disco,rock/{gothic,punk,progressive},classical/baroque/early}</copy>
		```
		```
		music/
		|-- classical
		|   `-- baroque
		|       `-- early
		|-- disco
		|-- folk
		|-- jazz
		|   `-- blues
		`-- rock
			|-- gothic
			|-- progressive
			`-- punk
		```
		</if>

	----
	## home folder

	 - go to home directory

		```
		$ <copy>cd /home/<username></copy>
		```
		```
		$ <copy>cd ~</copy>
		```

	 - change the default home folder

		**Option 1** - using *CLI*

		```
		$ <copy>usermod -d /new-home/directory-location username</copy>
		```

		**Option 2** - edit *bash profile*

		1. Open the config file for bash profile.

			```
			$ <copy>vi ~/.bashrc</copy>
			```

		1. Enter the path to the new home location.

			```
			<copy>cd /home/mgarodia/Downloads</copy>
			```

		1. Save the file.

			 > **Esc** + **:wq** or **Esc** + **Shift** + **zz**

	----
	## symbolic links

	Syntax

	```
	$ ln -s target linkname
	$ ln -s </path/to/file-folder to be linked> </path/of/link/to-be/created>
	```

	----
	## command alias

	Create and run short *aliases* for commands

	Syntax

	```
	$ alias short-name="your-custom-command"
	```

	Example

	```
	$ alias wr=”cd /var/www/html”
	```

	Henceforth, run *`wr`* instead of the complete command.

	> It is worth mentioning that these alias are temporary. THey are applicable to the current terminal session only. If you close the terminal or open a new terminal, it is not valid anymore.

	----
	## copy

	 - Copy files locally

		```
		$ <copy>cp -a /<source>/. /<destination>/</copy>
		```

	 - Secure copy across remote systems

		```
		$ scp <option> <user@source-host:>filepath1 [user@destination-host:]filename2
		```

		Enter the password when prompted.
		You can copy files and folders with *SCP* in two scenarios, **push** or **pull**.

		----
		## Push file or folder

		1. Go to the filer or folder source location (local directory).

			```
			$ cd /path/to/where/the-file-resides
			```

		1. Push the file or folder to the destination.

			```
			$ scp source-file-name username@destination-host:destination-folder
			```
			```
			$ scp -r \home\mgarodia\Downloads\myfile.txt user@host:/path/to/whereyouwant/thefile
			```

		----
		## Pull file or folder

		1. Go to the file or folder destination location.

			```
			$ cd /path/to/the-destination-folder
			```

		1. Pull files or folders from the source location.

			```
			$ scp remote-username@host:/remote/file.txt /local/directory
			```

		----
		## Examples

		 - Push file

			```
			$ <copy>scp password.txt mgarodia@phoenix123546.dev3sub1phx.databasede3phx.oraclevcn.com:/scratch/mgarodia</copy>
			Password:
			```

		 - Pull file

			```
			$ <copy>scp -rp mgarodia@phoenix123546.dev3sub1phx.databasede3phx.oraclevcn.com:/scratch/u01/mgarodia/installers/emcc135/ /scratch/u01/software/emcc_new/</copy>
			Password:
			```
			```
			$ <copy>scp -rp mgarodia@phoenix62465.dev1sub1phx.databasede1phx.oraclevcn.com:/scratch/u01/app/oracle/product/21.0.0/dbhome_unzip02 /scratch/mgarodia</copy>
			Password:
			```
			<if type="hidden">
			```
			$ <copy>scp -rp mgarodia@phoenix123546.dev3sub1phx.databasede3phx.oraclevcn.com:/scratch/u01/mgarodia/installers/LINUX.X64_193000_db_home.zip mgarodia@den02asa.us.oracle.com:/scratch/preeshuk/</copy>
			Password:
			```
			</if>

	----
	## move or rename

	### <ins>**move**</ins>

	Use the `mv` command for both *moving* and for *renaming* files and folders.

	 - Move files and folders (recursive)

		```
		$ <copy>mv -r /files/source/location /files/destination/location</copy>
		```

	 - Run the move command as another user

		```
		$ <copy>sudo mv /directory/source/location /directory/destination/location</copy>
		```

	 - Move multiple files to a destination

		```
		$ <copy>mv file1 file2 file3 -t /destination/location</copy>
		```

		or

		```
		$ <copy>mv -t /destination/location <source-file1> <source-file2> .... <source-fileN></copy>
		```

	 - move files and directories as another user, requires password

		Syntax

		```
		$ sudo mv source-folder/* target-folder/
		```

		Example

		```
		$ <copy>sudo mv launcher2022-11-09_06-21-46PM.log tmp1/OraInstall2022-11-09_06-21-46PM/</copy>
		Password:
		```

	### <ins>**rename**</ins>

	 - Rename a file

		```
		$ mv <file-old-name> <file-new-name>
		```

		Similarly, rename a folder

		```
		$ mv <folder-old-name> <folder-new-name>
		```

	----
	## remove

	 - Delete a file

		```
		$ <copy>rm <filename></copy>
		```

	 - Delete all files

		```
		$ <copy>rm *.*</copy>
		```

		or

		```
		$ rm .
		```

	 - Remove an <i>empty</i> directory

		```
		$ <copy>rm -d <directory></copy>
		```

	 - Remove non-empty directories, <i>recursive</i>

		```
		$ <copy>rm -rd <directory></copy>
		```

		- *r* - recursive
		- *d* - directories

		> **Note:** If the directory you want to delete contains no sub directories, use *`rm -d`*.

	 - <i>Force delete</i> one or more files (directly without prompt, overrides write-protection)

		```
		$ <copy>rm -f <files or files></copy>
		```

		> **Caution:** Force delete removes the file or files instantly without asking for any confirmation. ***Be absolutely sure while running this command***.

	 - <i>Force delete</i> non-empty directories (directly without prompt, overrides write-protection)

		```
		$ <copy>rm -rf <directory></copy>
		```

		> **Caution:** Force delete removes the directory and its underlying files and sub directories instantly without asking for any confirmation. ***Be absolutely sure while running this command***.

	----
	## Searching for something?? go *find*

	<i>Who's stopping you</i> :)

	 - Syntax

		```
		$ <copy>find . -print | grep <file_name></copy>
		```

	 - find text within files

		```
		$ <copy>grep -rinw <path to file> -e 'pattern'</copy>
		```

		where,
		- ***r*** &nbsp;&nbsp;&nbsp; - recursive
		- ***i*** &nbsp;&nbsp;&nbsp; - ignore case
		- ***n*** &nbsp;&nbsp;&nbsp; - line number
		- ***w*** &nbsp;&nbsp; - match whole word
		- ***l*** &nbsp;&nbsp;&nbsp; - show filename
		- ***e*** &nbsp;&nbsp;&nbsp; - pattern to find

		Alternatively, search in a file

		Syntax
		```
		$ grep 'text' file
		```
		Example
		```
		$ <copy>grep 'temporary password' /var/log/mysqld.log</copy>
		```

	 - include specific file types

		```
		$ <copy>grep --include=\*.{c,h} -rnw '/path/to/somewhere/' -e "pattern"</copy>
		```

	 - exclude specific file types

		```
		$ <copy>grep --exclude=\*.o -rnw '/path/to/somewhere/' -e "pattern"</copy>
		```

		```
		$ <copy>grep --exclude-dir={dir1,dir2,*.dst} -rnw '/path/to/somewhere/' -e "pattern"</copy>
		```

	 - Other find options

		```
		$ <copy>grep -Ril "text-to-find-here" /</copy>
		```

		where, ***/*** is for root

		```
		$ <copy>grep -r "string to be searched"  /path/to/dir</copy>
		```
		```
		$ <copy>ack 'text-to-find-here'</copy>
		```

	----
	## The Triplets of Linuxville

	Every file has an **owner user** and an **owner group**. A file is associated with three classes of users -
	 - user or file owner
	 - group members
	 - others (everyone else)

	Each of these users have specific file permissions. You can control which user can -
	 - <i>**r**ead</i> access to your file
	 - <i>**w**rite</i> to your file
	 - <i>e**x**ecute</i> your file as a program

		----
		## file permissions

		To view the file permissions, use the *`ls`* command.

		```
		$ <copy>ls -l file-name</copy>
		```
		```
		-rw-r--r-- 12 mgarodia wheel 12.0K Nov  27 10:10 file-name
		|[-][-][-]-   [------] [---]
		| |  |  | |      |       |
		| |  |  | |      |       +-----------> Group
		| |  |  | |      +-------------------> Owner
		| |  |  | +--------------------------> Alternate Access Method
		| |  |  +----------------------------> Others Permissions
		| |  +-------------------------------> Group Permissions
		| +----------------------------------> Owner Permissions
		+------------------------------------> File Type
		```

		Each of these permissions are associated with a number.

		----
		## the number game

		Let us consider a use case where you want to modify a file's permissions (*r=4*, *w=2*, *x=1*).

		You want to grant -
		 - full permission (read, write, execute) to the file owner
		 - read and execute permissions to the file’s group
		 - only read permissions to all other users

		<ins>Triplets</ins>

		 - for u   
		 *rwx* &gt; **4** + **2** + **1** = **7**

		 - for g    
		 *r-x* &gt; **4** + **0** + **1** = **5**

		 - for o   
		 *r--* &gt; **4** + **0** + **0** = **4**

		 Which comes up to *754*.

			 > A *777* means <i>everyone has full access to the file</i>.

		You administer the ownership of your files and folders with
		 - *`chown`*
		 - *`chgrp`*

			----
			## cite source

			 - [Linuxize - File Permissions](https://linuxize.com/post/understanding-linux-file-permissions/)
			 - [UNIX Permissions](https://www.ccn.ucla.edu/wiki/index.php/UNIX_Permissions)

	----
	## Others

	 - Create an empty file

		```
		$ <copy>touch text.txt</copy>
		```

	 - Open a new file in the editor.

		```
		$ <copy>vi file1.txt</copy>
		```
		```
		$ <copy>view file2.txt</copy>
		```

	 - Extract file and folders from a `*.zip` file.

		```
		$ unzip filename -d /folder/location
		```

		> **Tip:** If the destination folder does not exit, you may create the folder first.

	 - While extracting files and folders, use `-d` to specify the target directory

		Syntax

		```
		$ unzip -d
		```

		Sample

		```
		$ unzip -o archive.zip -d /Users/current/Dev/tools/
		```

## Scripting

A script begins with -

```
#!/bin/sh
```

### 1. Run a script from **csh**

 - If the script contains *export* commands -

	```
	$ sh <script-file>.sh
	```

 - If the script contains *setenv* commands -

	```
	$ source <script-file>.sh
	```

### 2. Run a script from **bash**

 - All of these work in bash

	```
	$ sh <script-file>.sh
	$ source <script-file>.sh
	$ . <script-file>.sh
	```

## File system, disk space, OS

 - File system and OS related

	----
	## Disk space

	Check the file system types with the complete hard disk information, *used* and *available*.

	```
	$ <copy>df -Th</copy>
	```
	```
	Filesystem           Type      Size  Used Avail Use Mounted on
	devtmpfs             devtmpfs  7.2G     0  7.2G   0 /dev
	tmpfs                tmpfs      15G     0   15G   0 /dev/shm
	tmpfs                tmpfs     7.3G   26M  7.2G   1 /run
	tmpfs                tmpfs     7.3G     0  7.3G   0 /sys/fs/cgroup
	/dev/sda2            ext4       42G   29G   11G  74 /
	/dev/sdb             ext4      296G   28G  253G  10 /scratch
	/dev/loop0           btrfs     2.0G   17M  1.8G   1 /var/lib/docker
	tmpfs                tmpfs     1.5G   44K  1.5G   1 /run/user/1477205
	tmpfs                tmpfs     1.5G     0  1.5G   0 /run/user/0
	```

	 > **Tip:** To exclude *Type*, use *`df -h`*.

	 - Check directory size

		Syntax

		```
		$ du -sh /directory/full/path
		```

		Example

		```
		$ <copy>du -sh /home/mgarodia</copy>
		```
		```
		1.7G    /home/mgarodia
		```

	 - Check the complete disk usage of a directory

		```
		$ <copy>df -h /scratch</copy>
		```
		```
		Filesystem      Size  Used Avail Use Mounted on
		/dev/sdb        296G   28G  253G  10 /scratch
		```

	 - Check size folder-wise

		Syntax

		```
		$ du -shx <directory> | sort -h
		```

		Example

		```
		$ <copy>du -shx ~/* | sort -h</copy>
		```

		----
		## Output

		```
		0       /home/mgarodia/Music
		0       /home/mgarodia/ORDS
		0       /home/mgarodia/Pictures
		0       /home/mgarodia/Public
		0       /home/mgarodia/show
		0       /home/mgarodia/symlinks
		0       /home/mgarodia/Templates
		0       /home/mgarodia/Videos
		512     /home/mgarodia/dbhome19c
		512     /home/mgarodia/dbhome21c
		512     /home/mgarodia/listener21c
		512     /home/mgarodia/mm_21c
		512     /home/mgarodia/pfile21c
		8.0K    /home/mgarodia/19cstart.sh
		8.0K    /home/mgarodia/21cstart.sh
		8.0K    /home/mgarodia/install_EM.sh
		8.0K    /home/mgarodia/manisha.sh
		8.0K    /home/mgarodia/ords_cdb_install_apex_ORCLPDB_2022-06-03_093912_00533.log
		8.0K    /home/mgarodia/ords_cdb_install_apex_PDB_SEED_2022-06-03_093849_00859.log
		8.0K    /home/mgarodia/ords_cdb_install_core_CDB_ROOT_2022-06-03_093816_00241.log
		8.0K    /home/mgarodia/ords_cdb_install_datamodel_ORCLPDB_2022-06-03_093910_00825.log
		8.0K    /home/mgarodia/ords_cdb_install_datamodel_PDB_SEED_2022-06-03_093847_00653.log
		8.0K    /home/mgarodia/ords_cdb_uninstall_core_CDB_ROOT_2022-06-03_084433_00185.log
		8.0K    /home/mgarodia/ords_cdb_uninstall_core_ORCLPDB_2022-06-03_084455_00019.log
		8.0K    /home/mgarodia/ords_cdb_uninstall_core_PDB3_2022-06-03_084504_00536.log
		8.0K    /home/mgarodia/ords_cdb_uninstall_core_PDB_SEED_2022-06-03_084444_00266.log
		8.0K    /home/mgarodia/snsuffix.properties
		8.0K    /home/mgarodia/tnsnames.ora
		16K     /home/mgarodia/ords_cdb_install_core_ORCLPDB_2022-06-03_093853_00120.log
		16K     /home/mgarodia/ords_cdb_install_core_PDB_SEED_2022-06-03_093822_00953.log
		17K     /home/mgarodia/Documents
		42K     /home/mgarodia/ordsdata-old
		89K     /home/mgarodia/ords_log
		195K    /home/mgarodia/emdiag
		6.2M    /home/mgarodia/oraInventory
		127M    /home/mgarodia/oradiag_mgarodia
		174M    /home/mgarodia/Desktop
		985M    /home/mgarodia/Downloads
		```

	 - Check RAM on the system

		```
		$ <copy>cat /proc/meminfo</copy>
		```
		```
		MemTotal:       15119300 kB
		MemFree:         1438948 kB
		MemAvailable:    7780692 kB
		Buffers:          854092 kB
		Cached:          9906216 kB
		SwapCached:        10796 kB
		Active:          9207284 kB
		Inactive:        3735700 kB
		Active(anon):    6002344 kB
		Inactive(anon):   665700 kB
		Active(file):    3204940 kB
		Inactive(file):  3070000 kB
		Unevictable:           0 kB
		Mlocked:               0 kB
		SwapTotal:      18628584 kB
		SwapFree:       18160104 kB
		Dirty:                32 kB
		Writeback:             0 kB
		AnonPages:       2176512 kB
		Mapped:          3504612 kB
		Shmem:           4486184 kB
		Slab:             432092 kB
		SReclaimable:     371856 kB
		SUnreclaim:        60236 kB
		KernelStack:        7312 kB
		PageTables:       214244 kB
		NFS_Unstable:          0 kB
		Bounce:                0 kB
		WritebackTmp:          0 kB
		CommitLimit:    26188232 kB
		Committed_AS:    9682356 kB
		VmallocTotal:   34359738367 kB
		VmallocUsed:           0 kB
		VmallocChunk:          0 kB
		HardwareCorrupted:     0 kB
		AnonHugePages:         0 kB
		ShmemHugePages:        0 kB
		ShmemPmdMapped:        0 kB
		CmaTotal:              0 kB
		CmaFree:               0 kB
		HugePages_Total:       0
		HugePages_Free:        0
		HugePages_Rsvd:        0
		HugePages_Surp:        0
		Hugepagesize:       2048 kB
		DirectMap4k:      153456 kB
		DirectMap2M:     7186432 kB
		DirectMap1G:    10485760 kB
		```

	----
	## Operating system

	 Check OS version

	 -	*`lsb_release`*  - view compact information

		```
		$ <copy>lsb_release -d</copy>
		```

		Output

		```
		Description:    Oracle Linux Server release 7.6
		```

	 -	*`lsb_release`* - view detailed information. Use any one of the following -

		```
		$ <copy>lsb_release -a</copy>
		```
		```
		$ <copy>lsb_release --all</copy>
		```

		Output

		```
		[mgarodia@phoenix123546 ~/Downloads]$ lsb_release -a
		LSB Version:    :core-4.1-amd64:core-4.1-ia32:core-4.1-noarch:cxx-4.1-amd64:cxx-4.1-ia32:cxx-4.1-noarch:desktop-4.1-amd64:desktop-4.1-ia32:desktop-4.1-noarch:languages-4.1-amd64:languages-4.1-noarch:printing-4.1-amd64:printing-4.1-noarch
		Distributor ID: OracleServer
		Description:    Oracle Linux Server release 7.6
		Release:        7.6
		Codename:       n/a
		Description:    Oracle Linux Server release 7.6
		```

	 -	*`uname --all`*

		```
		$ <copy>uname --all</copy>
		```

		Output

		```
		Linux phoenix123546 4.14.35-2047.514.5.1.1.el7uek.x86_64 #2 SMP Wed Jul 13 11:52:18 PDT 2022 x86_64 x86_64 x86_64 GNU/Linux
		```

	 -	*`os-release`*

		```
		$ <copy>cat /etc/os-release</copy>
		```

		Output

		```
		NAME="Oracle Linux Server"
		VERSION="7.6"
		ID="ol"
		VARIANT="Server"
		VARIANT_ID="server"
		VERSION_ID="7.6"
		PRETTY_NAME="Oracle Linux Server 7.6"
		ANSI_COLOR="0;31"
		CPE_NAME="cpe:/o:oracle:linux:7:6:server"
		HOME_URL="https://linux.oracle.com/"
		BUG_REPORT_URL="https://bugzilla.oracle.com/"

		ORACLE_BUGZILLA_PRODUCT="Oracle Linux 7"
		ORACLE_BUGZILLA_PRODUCT_VERSION=7.6
		ORACLE_SUPPORT_PRODUCT="Oracle Linux"
		ORACLE_SUPPORT_PRODUCT_VERSION=7.6
		```

	 -	*`hostname`*

		```
		$ <copy>hostname</copy>
		```

		Output

		```
		phoenix123546
		```

	 -	*`lsb-release`* - Linux Standard Base

		```
		$ <copy>cat /etc/lsb-release</copy>
		```

		> **Note:** Some Linux distributions, but not all, use this file for older programs.

		----
		## Cite source

		[stack overflow](https://stackoverflow.com/questions/47838800/etc-lsb-release-vs-etc-os-release#:~:text=The202Fetc2Flsb2Drelease,including20things20like20filesystem20layout.)

	 - The following commands may also give OS-related information.

		Both *`issue`* and *`issue.net`* are used to display a banner (e.g. welcome line/ warning..) to SSH users before the login prompt.

		<ins>For local users</ins> -

		```
		$ <copy>cat /etc/issue</copy>
		```

		<ins>For network users</ins> -

		```
		$ <copy>cat /etc/issue.net</copy>
		```

		Though primarily for local users, the *`/etc/issue`* information is shown to both local and network users unless *`/etc/issue.net`* is present and configured. The *`/etc/issue.net`* information is shown only to users who connect from a network.

		To configure them to be displayed when you login via SSH, uncomment *`#Banner`* and specify the desired filename at `/etc/ssh/sshd_config`, like:

		```
		...
		Banner /etc/issue.net
		...
		```

		----
		## Cite source

		[difference between issue and issue.net](https://serverfault.com/questions/922235/what-is-the-difference-between-etc-issue-net-and-etc-issue)

	 - view processor type, cpu architecture information with *`lscpu`*

		**Option 1**

		```
		$ <copy>lscpu | grep Architecture</copy>
		```

		Output

		```
		Architecture:          x86_64
		```

		**Option 2**

		```
		$ <copy>lscpu | awk '/Architecture:/{print $2}'</copy>
		```

		Output

		```
		x86_64
		```

	----
	## java

	 - print java version to <i>error stream</i>

		```
		$ <copy>java -version</copy>
		```
		```
		java version "16.0.1" 2021-04-20
		Java(TM) SE Runtime Environment (build 16.0.1+9-24)
		Java HotSpot(TM) 64-Bit Server VM (build 16.0.1+9-24, mixed mode, sharing)
		```

	 - print java version to <i>output stream</i>

		```
		$ <copy>java --version</copy>
		```
		```
		java 16.0.1 2021-04-20
		Java(TM) SE Runtime Environment (build 16.0.1+9-24)
		Java HotSpot(TM) 64-Bit Server VM (build 16.0.1+9-24, mixed mode, sharing)
		```

	 - Check whether java is installed on the system

		```
		$ <copy>where is java</copy>
		```
		```
		/usr/bin/java
		/usr/lib/jvm/java-1.8.0/bin/java
		/usr/bin/java
		/usr/dev_infra/platform/bin/java
		/usr/bin/java
		/bin/java
		/usr/bin/java
		```

	 - Java installer puts several files into different directories. Check the java SDK location.

		```
		$ <copy>which java</copy>
		```
		```
		/usr/bin/java
		```

	 - Check version

		```
		$ <copy>rpm -q --whatprovides java</copy>
		```
		```
		java-1.8.0-openjdk-1.8.0.332.b09-1.el7_9.x86_64
		```

	 - Install a new version

		```
		$ <copy>rpm -ivh jdk-16.interim.update.patch_linux-x64_bin.rpm</copy>
		```

	 - Upgrade the existing version

		```
		$ <copy>rpm -Uvh jdk-16.interim.update.patch_linux-x64_bin.rpm</copy>
		```

	 - Set the environment variable *$JAVA_HOME* for all users

		1. Open `.base_profile` in vi editor.

			```
			$ <copy>vi ~/.bash_profile</copy>
			```

		1. Insert these into `.bash_profile`.

			```
			<copy>
			export JAVA_HOME=/opt/java/jdk-9
			export PATH=$JAVA_HOME/bin:$PATH
			</copy>
			```

		1. Reload `.bash_profile` to bring the above commands into effect.

			```
			$ <copy>source ~/.bash_profile</copy>
			```

	----
	## Public IP address

	```
	$ <copy>host myip.opendns.com resolver1.opendns.com</copy>
	```
	```
	$ <copy>host myip.opendns.com resolver1.opendns.com | grep "myip.opendns.com has" | awk '{print $4}'</copy>
	```
	```
	$ <copy>curl ifconfig.me</copy>
	```
	```
	$ <copy>curl ident.me</copy>
	```
	```
	$ <copy>curl ipinfo.io/ip</copy>
	```
	```
	$ <copy>curl api.ipify.org</copy>
	```

## Troubleshooting

 - Fix errors on Linux

	----
	## Pop-up loop: Authentication required for network proxy

	**Problem statement**   
	You are connected through the VNC viewer and this pop-up keeps appearing every few minutes.

	![Error: Authentication for network proxy config](./images/auth-required.png " ")

	The pop-up contains the following message -
	```
	Authentication is required to set the network proxy used for downloading packages
	An application is attempting to perform an action that requires privleges. Authentication as the super user is required to perform this action
	Password for root:
	Details
	Role: unknown
	Action: org.freedesktop.packagekit.system-network-proxy-configure
	Vendor: The PackageKit Project
	[Cancel] [Authenticate]
	```

	**How to fix**

	Three possible solutions to this problem.
	 - Option 1 as normal user
	 - Option 2 and 3 requires root

	<u>Option 1 - as normal user</u>

	 1. Open a terminal console and type the following to open **Startup Programs**.

		```
		$ <copy>gnome-session-properties</copy>
		```

	 1. Uncheck the option *PackageKit Update Applet*.


	 <u>Option 2 - requires *root*</u>

	 1. In the terminal, change to root.

		```
		$ sudo -i
		Password:
		```

	 1. Disable `/etc/yum/pluginconf.d`.

		```
		$ <copy>vi /etc/yum/pluginconf.d/refresh-packagekit.conf</copy>
		```

	 1. Modify the value.

		```
		[main]
		enabled=0
		```

	 1. Save the file, **Esc** + **:wq**.

	 <u>Option 3 - requires *root*</u>

	 1. Edit the file `/etc/xdg/autostart/gpk-update-icon.desktop`.

		```
		$ <copy>vi /etc/xdg/autostart/gpk-update-icon.desktop</copy>
		```

	 1. Add the following line at the end.

		```
		<copy>X-GNOME-Autostart-enabled=false</copy>
		```

	 1. Restart the VNC server.

	----
	## Error while extracting files

	**Problem statement**   
	You try extracting all contents of a zip file into a folder using the asterisk (`*`) character.

	```
	unzip: caution: filename not matched:
	```

	**How to fix**

	To prevent this behavior -

	- **Option 1**

		Escape the asterisk (`*`) character

		```
		$ unzip -o somearchive.zip somedir/\*
		```

	- **Option 2**

		Put the files to extract in double quotes.

		```
		$ unzip -o somearchive.zip "somedir/*"
		```

<!--

## basic

## advanced

## bash profile

add details about chown, chmod, chgrp

-->

## Acknowledgements

 - **Author** - Manish Garodia, Team Database UAD
 - **Last Updated on** - December 3, (Sat) 2022
 - **Questions/Feedback?** - Blame [manish.garodia@oracle.com](./../../../intro/files/email.md)
