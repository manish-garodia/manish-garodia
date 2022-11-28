# Virtual Machines - Real Actions

## Introduction
This lab shows how to access the VM and configure the VNC. 

## Task 1: Request account access

<table>
    <thead>
        <tr>
            <th>for Uno VM</th>
            <th>for OCI VM</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=4>LDAP DSEE and PDIT NIS unix/linux</td>
            <td row=2>LDAP DSEE and PDIT NIS unix/linux <br>- <b>Login shell:</b> <i>bash</i> or <i>csh</i> <br>- <b>Env or LOB:</b> <i>system LOB (gid=10)</i></td>
        </tr>
        <tr>
            <td>Kerberos [ADE_Admin] <br>- <b>LOB:</b> DEV</td>
        </tr>
    </tbody>
</table>

<!--
| for Uno VM | for OCI VM |
|------------|------------|
| LDAP DSEE and PDIT NIS unix/linux | LDAP DSEE and PDIT NIS unix/linux <br>Login shell: bash or csh <br> Env or LOB: system LOB (gid=10) |
|                                     | Kerberos [ADE_Admin] |
-->

<ins>Request type</ins>: Select *Application* instance. Entitlements not required.

![Request access](/images/ldap-kerberos-access.png " ")

## Task 2: Configure VNC in the VM

Go to [MyDesktop applications](https://mydesktop.oraclecorp.com/myd_sso/apps.main) and install *PuTTY*, if not already installed. 

**Open PuTTY**

1. In the **PuTTY Configuration** window, enter the following details.

	Host Name (or IP address): Enter the domain (host) name *oracle_uid@slc10wsw.us.oracle.com*   
	login as: <i>GUID</i> [*mgarodia*]   
	Password: <i>pwd</i> <if type="hidden">[*Livelabs\*1*]</if>

	Save the session for future logins.   

1. Set the VNC password. 

	```
	$ <copy>vncpasswd</copy>
	```

1. Start the VNC server.   
	**Note:** Run this command only if the vnc server has stopped or after a system reboot. If the VNC server is already running, then this command <ins>assigns a new incremental port number</ins> to the instance. 

	```
	$ <copy>vncserver</copy>
	```

	```
	perl: warning: Setting locale failed.
	perl: warning: Please check that your locale settings:
		LANGUAGE = (unset),
		LC_ALL = (unset),
		LC_CTYPE = "UTF-8",
		LANG = "en_US.UTF-8"
		are supported and installed on your system.
	perl: warning: Falling back to the standard locale ("C").
	You will require a password to access your desktops.
	```
	
1. Enter password to VNC. 

	```
	Password: <Enter password<if type="hidden">- welcome1</if>>
	Verify: <Enter password again<if type="hidden">- welcome1</if>>
	```

1. Enter **n** here.   
	Do not use a view-only password.

	```
	Would you like to enter a view-only password (y/n)? n
	A view-only password is not used

	New 'phoenix123546:1 (mgarodia)' desktop is phoenix123546:1 <-- your port number
	Creating default startup script /home/mgarodia/.vnc/xstartup
	Creating default config /home/mgarodia/.vnc/config
	Starting applications specified in /home/mgarodia/.vnc/xstartup
	Log file is /home/mgarodia/.vnc/phoenix123546:1.log
	```

	Note the (instance) port number assigned; the default is *1*. 
	
1. Open TigerVNC and enter the host name and port number `<hostname>:<port_number>` to connect to the VM.

	**Example 1**
	```
	<copy>phoenix123546.dev3sub1phx.databasede3phx.oraclevcn.com:1</copy>
	```
	<if type="hidden">
	**Example 2**
	```
	<copy>slc10wsw.us.oracle.com:2</copy>
	```
	</if>

	Cite: Alternate ways to enable VNC viewer on latest operating system (OL8+) - 
	 - [Install VNC on RHEL 8](https://www.tecmint.com/install-vnc-server-on-rhel-8/)
	 - [Create VNC on OCI VMs](https://confluence.oraclecorp.com/confluence/display/EMQ/Create+VNC+on+OCI+VM+Instances)
	 - []()

## Troubleshooting VNC

If you face trouble connecting to the VNC server, then *stop* and *restart* the vnc server instead of running it again. Running the VNC server again creates a new (instance) port number and another log file *`hostname:x.log`*. 

- Scenarios, solutions, troubleshooting options

	## Stop VNC Server

	Kill the process id of the vnc server.

		```
		$ <copy>vncserver -kill :x</copy>
		```
		where, `x` is the server session (port) number. Cite: [vncserver options](https://linux.die.net/man/1/vncserver) page.

	## Xvnc seems to be deadlocked

	**Problem statement**

	 - Killing the process for VNC server returns an error. 

		![Xvnc deadlock](./images/xvnc-deadlock.png)

	 - Connecting to TigerVnc returns a timeout error. 

		![Unable to connect VNC](./images/vnc-unable-connect-socket-10060.png)

		```
		Unable to connect to socket. Connection timed out (10060)
		```

	**How to resolve**

	1. Find the process id of the vnc server. 

		- Option 1

			```
			$ <copy>pidof</copy> <program_name>
			```

		- Option 2

			```
			$ <copy>ps aux | grep -i</copy> <program_name>
			```

		- **Option 3** (recommended)

			```
			$ <copy>ps -ef | grep vnc</copy>
			```

			Output:

			```
			mgarodia   465 31047  0 03:57 pts/5    00:00:00 grep --color=auto vnc
			mgarodia  2415     1  0  2021 ?        00:15:13 /usr/bin/Xvnc :1 -auth /home/mgarodia/.Xauthority -desktop phoenix123546:1 (mgarodia) -fp catalogue:/etc/X11/fontpath.d -geometry 1024x768 -pn -rfbauth /home/mgarodia/.vnc/passwd -rfbport 5901 -rfbwait 30000
			mgarodia  2431     1  0  2021 ?        00:00:00 /bin/sh /home/mgarodia/.vnc/xstartup
			```

	1. Ignore the line with `-color=auto`. Kill the process (in this example, *2415*) with the name *Xvnc*. 

		```
		$ <copy>kill 2415</copy>
		```

		> **Note:** `Kill` terminates the process gracefully. This is the default and safest way to terminate a process. 
	 
	     - The command `kill -9` sends a signal to terminate the process attached with the PID or the process name. It is a hard way to terminate a single or a set of processes *forcefully* and *immediately* and can create zombies process.

		## Other kill options

		- You can also kill multiple processes together.

			**Syntax**

			```
			$ <copy>sudo kill -9</copy> process_id_1  process_id_2 process_id_3
			```

		- To kill all process of a program, combine the commands. 

			```
			$ <copy>sudo kill -9</copy> `pidof programe_name`
			``` 

		- Or use this quick command.

			```
			$ <copy>killall program_name</copy>
			``` 
	1. Verify the vnc server process.

		```
		$ <copy>ps -ef | grep vnc</copy>
		```

		Output:

		```
		mgarodia   603 31047  0 03:58 pts/5    00:00:00 grep --color=auto vnc
		mgarodia  2431     1  0  2021 ?        00:00:00 /bin/sh /home/mgarodia/.vnc/xstartup
		```

	1. Kill the process of the vnc server once again.

		```
		$ <copy>vncserver -kill :x</copy>
		```

		Output:

		```
		Killing Xvnc process ID 2415
		Xvnc process ID 2415 already killed
		Xvnc did not appear to shut down cleanly. Removing /tmp/.X11-unix/X1

		```

	1. Start up the vncserver. It will use the existing port number `:1`. 

		```
		$ <copy>vncserver</copy>
		```

		Output:

		```
		New 'phoenix123546:1 (mgarodia)' desktop is phoenix123546:1

		Starting applications specified in /home/mgarodia/.vnc/xstartup
		Log file is /home/mgarodia/.vnc/phoenix123546:1.log
		```

		The VNC server is back. You can connect with TigerVNC again.

## Internal Test Environments

- Host user name: *sso* or global UID *mgarodia*
<if type="hidden">
- TigerVNC pwd: *welcome1*
- LDAP/Kerberos pwd: *Livelabs\*1*
</if>

| VM hostname                                             | Description                           |
|---------------------------------------------------------|-------------------------------------  |
| phoenix123546.dev3sub1phx.databasede3phx.oraclevcn.com  | OCI machine <br>IP:    |
| phoenix62464.dev1sub1phx.databasede1phx.oraclevcn.com   | OCI machine <br>IP: `100.104.88.84`   |
| slc10wsw.us.oracle.com:2                                | Uno machine <br>User ID: `1477205`    |
|<if type="hidden">phoenix62465.dev1sub1phx.databasede1phx.oraclevcn.com:1 | Suresh Mohan's VM <br>pwd: *welcome1* </if>|
| den03ckl.us.oracle.com:1                                | Temp machine from Subbu <br> cuser:welcome <br>root:Welcome123 |

## Acknowledgements

 - **Author** - Manish Garodia, Team Database UAD
 - **Last Updated on** - Nov 6, (Sun) 2022

