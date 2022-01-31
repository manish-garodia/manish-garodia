# Access VM and Configure VNC

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

![Request access](/images/ldap-kerberos-access.png)

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
	
	To stop vncserver - 
	```
	vncserver -kill :x
	```
	where, `x` is the server session (port) number. Refer the [vncserver options](https://linux.die.net/man/1/vncserver) page.
	
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

	New 'phoenix62464:1 (mgarodia)' desktop is phoenix62464:1 <-- your port number
	Creating default startup script /home/mgarodia/.vnc/xstartup
	Creating default config /home/mgarodia/.vnc/config
	Starting applications specified in /home/mgarodia/.vnc/xstartup
	Log file is /home/mgarodia/.vnc/phoenix62464:1.log
	```

	Note the (instance) port number assigned; the default is *1*. 
	
1. Open TigerVNC and enter the host name and port number `<hostname>:<port_number>` to connect to the VM.

	**Example 1**
	```
	<copy>phoenix62464.dev1sub1phx.databasede1phx.oraclevcn.com:1</copy>
	```
	<if type="hidden">
	**Example 2**
	```
	<copy>slc10wsw.us.oracle.com:2</copy>
	```
	</if>

## Internal Test Environments

- Host user name: *sso* or global UID *mgarodia*
<if type="hidden">
- TigerVNC pwd: *welcome1*
- LDAP/Kerberos pwd: *Livelabs\*1*
</if>

| VM hostname                                             | Description                           |
|---------------------------------------------------------|-------------------------------------  |
| phoenix62464.dev1sub1phx.databasede1phx.oraclevcn.com   | OCI machine <br>IP: `100.104.88.84`   |
| slc10wsw.us.oracle.com:2                                | Uno machine <br>User ID: `1477205`    |
|<if type="hidden">phoenix62465.dev1sub1phx.databasede1phx.oraclevcn.com:1 | Suresh Mohan's VM <br>pwd: *welcome1* </if>|
| den03ckl.us.oracle.com:1                                | Temp machine from Subbu <br> cuser:welcome <br>root:Welcome123 |

## Acknowledgements

 - **Author** - Manish Garodia, Team Database UAD
 - **Last Updated on** - February 1, (Tue) 2022

