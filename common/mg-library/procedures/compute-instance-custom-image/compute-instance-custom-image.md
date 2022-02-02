# Compute Instance and Custom Image

## Introduction

This lab discusses about creating and managing compute instances and custom images in the OCI tenancy. 

## About the noVNC environment

The basic steps for setting up a noVNC environment include -

1. Create an instance.

1. Prepare the environment with the prerequisites, such as:
    - Create user accounts
	- Copy files and folders
    - Install the applications
	- Any other requirements

1. Create a custom image and export to the Object Storage.

	The custom image creates a package of the instance that you have configured. It acts as a backup, and you can recreate another instance from it. When you create a new instance from this custom image, it generates a copy of the original instance server with preconfigured settings, for example, libraries, user accounts, applications, and so on. After creating the custom image, you can terminate the instance. 

	> **Note:** Do not delete the custom image from the tenancy before publishing it to the OCI marketplace.  
	After the Livelabs goes to production, it has no dependency on the custom image. Now, if you delete the custom image, connect with the OCI team (Rene or Ashish) to get the image back. 

### Points to consider

If the host name of the instance changes, Enterprise Manager fails to run. Therefore, keep the *host name static*. To run noVNC, it requires a user account on the host. Create the user and then install Vnc.

You cannot transfer files and folders from the local host or a laptop to the noVNC server. 
 - Upload objects or packages, for example Oracle Database 21c installer, to the Object store. 
 - Give public access and directly download it in the instance using the command `wget URL`.   
   If the bucket visibility is public, anyone can access it from anywhere. 

The users need not go through these detailed steps to set up their VM. Nor do they have access to the internal systems. The *terraform scripts* automate these steps and create an instance for the users from the custom image. The OCI team (Rene or Ashish) deploys the custom image to the marketplace as *private* because it is not available for public view. 

The OCI has **26 regions** which are associated with specific teams. 
 - An image existing in a tenancy is available only to that team. The teams from other regions in the OCI do not have access to that image. 
 - But if an image is published to the OCI marketplace, then it is available to all (26) regions in the OCI. 

## Credentials and specifications

 - Instance cretentials
 - Tenancy credentials
 - Tenancy specifications

	## Instance credentials

	 - **Static host name** - *dbaessentials.livelabs.oraclevcn.com*
	 - **noVNC Port** - *6080*
	 - **User name** - *oracle*
	 - **Password** - *W@lcome12*

	## Tenancy credentials

	 - **Tenancy name** - *ngreenbeorg*

	 - **Login URL**

		```
		<copy>
		https://cloud.oracle.com/?tenant=ngreenbeorg&provider=OracleIdentityCloudService&region=us-ashburn-1
		</copy>
		```

		| User name or email | Password        |
		| -------------------|-----------------| 
		| <if type="hidden">SureshRRajan       | *Merleauponty@67* </if>|
		| ManishGarodia      | Enter the password <if type="hidden">- *Sujangarh,21*</if> |

	<if type="hidden">
	- **User name** or **email** - *SureshRRajan*
	- **Password** - *Merleauponty@67*
	</if>

	## Tenancy specifications

	noVNC Environments

	| Instance name                 | Public IP         | Image name                       | noVNC URL   |
	|-------------------------------|-------------------|----------------------------------| ------------|
	| `DBAEssentials_21c_os-only`   | `150.136.138.183` | `dbaessentials_21c_os-only_v1`   | [Image 1](http://150.136.138.183:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true) |
	| `DBAEssentials_21c_installer` | `129.213.163.15`  | `dbaessentials_21c_installer_v1` | [Image 2](http://129.213.163.15:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true) |
	| `dbaessentials-21c-emcc_v1`   | `150.230.160.80`  | `emcc-image-imported-from Rene-20211021` | [Image 3](http://150.230.160.80:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true) |
	| | | `dbaessentials_emcc_v0`   | Image 4 |
	| `dbaessentials-21c-emcc_v2-test-labs` | `150.230.185.102` | `dbaessentials-21c-emcc_v1` | [Image 5](https://150.230.185.102:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true) <br>for emcc labs testing | 

	 - **Root Compartment** - *dba-essentials*
	 - **Child Compartment** - *mg-testing-comp*
	 - **Bucket name** - *db-installer*, *images-for-livelabs-workshops*
	 - **Object name** - `dbaessentials_21c_installer`

		## PAR URLS
		
		 - PAR URL for Image 2 - expired on Aug 20, 2021

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/iz-YYHBb7OyEJmUQ0fDK2IUdqwhqyfRlTcWfEoCwGbWMm9B4M3S8WK3hFmxXqO2M/n/idrudhdwamji/b/db-installer/o/dbaessentials_21c_installer
			```
		 - PAR URL for Image 2 - created on Aug 26, 2021

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/Q-gwaJOKQVOkjOJ9mK4mF4tjCPi0irqiHXI0C2aBiYDy6QDcujdXH5oN2uqGXUB4/n/idrudhdwamji/b/db-installer/o/dbaessentials_21c_installer
			```

		 - PAR URL for WS1 - created on 7 Jan 2022, valid till 14 Jan.

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/B873TzZRYXSbSzz_Un_rgXxGcOgZmDiSaMJWDwC2-gyJzPiPcndyQ0PmBB3uWW3i/n/idrudhdwamji/b/db-installer/o/dbaessentials_21c_installer.oci
			```

		 - PAR URL for WS2 image from Rene.

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/-aidsyb5OOwAE-8q6Tdxq_rr2V-v5PLADtckYgtzZ-xichKWSv7RK4WNMUWuQdzt/n/natdsecurity/b/stage/o/emcc-livelabs-v3-int-02-10.20.2021
			```

## Task 1: Create a Custom Image from an Instance

Creating a custom image from an instance is a two-step process -
 - Clean up the instance
 - Create the custom image

1. Check the host name in the `hosts` file.

	```
	$ <copy>cat /etc/hosts</copy>
	```

	If the instance is clean, it displays only the following two. 
	
	```
	127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
	::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
	```

	But if instance needs to be cleaned, it displays a third line.

	Example - 

	```
	10.0.0.225   dbaessentials.livelabs.oraclevcn.com  dbaessentials
	```

	Clean up the instance first before proceeding with the custom image. 

1. Follow this task to clean the instance. 

	[Task 1: Cleanup Instance for Image Capture](https://oracle.github.io/learning-library/sample-livelabs-templates/create-labs/labs/workshops/compute/?lab=7-labs-create-custom-image-for-marketplace#Task1:CleanupInstanceforImageCapture)

	> **Note:** Always *clean up* the instance before creating a custom image.


1. Follow this task to create a custom image. 

	[Task 2: Create Custom Image](https://oracle.github.io/learning-library/sample-livelabs-templates/create-labs/labs/workshops/compute/?lab=7-labs-create-custom-image-for-marketplace#Task2:CreateCustomImage)

	## Instance cleanup commands (handy)

	- Log in to the instance as the *opc* user using PuTTY.
	- Run these commands to clean up the instance.

	1. Download the script.

		```
		<copy>
		cd /tmp
		wget https://raw.githubusercontent.com/oracle/oci-utils/master/libexec/oci-image-cleanup -O /tmp/oci-image-cleanup.sh
		chmod +x oci-image-cleanup.sh
		</copy>
		```

	1. Stop the VNC service. 

		```
		<copy>
		cat > /tmp/stopvnc.sh <<EOF
		#!/bin/bash
		cd /etc/systemd/system
		for i in \$(ls vncserver_*@*)
		do
		  sudo systemctl stop \$i
		done
		EOF
		chmod +x /tmp/stopvnc.sh
		/tmp/stopvnc.sh
		</copy>
		```

	1. Run the script. 

		```
		<copy>
		cat > /tmp/cleanup.sh <<EOF
		#!/bin/bash
		sudo service rsyslog stop
		sudo service auditd stop
		sudo sh -c 'yes| /tmp/oci-image-cleanup.sh'
		sudo find /var/log -type f -exec cp /dev/null {} \;
		sudo find /var/log -type f -size 0 -exec rm {} +
		sudo rm -rf /var/lib/cloud/instances/*
		sudo rm -f /home/opc/get-pip.py
		sudo rm -f /home/opc/.bashrc-orig
		sudo rm -f /home/oracle/.bash_history
		sudo sed -i -e 's|\\\(^.*PermitRootLogin.*$\\\)|PermitRootLogin no|g' /etc/ssh/sshd_config
		sudo sed -i -e 's|root:x:0:0:root:/root:/bin/bash|root:x:0:0:root:/root:/sbin/nologin|g' /etc/passwd
		sudo ln -sf /root/bootstrap/firstboot.sh /var/lib/cloud/scripts/per-instance/firstboot.sh
		sudo ln -sf /root/bootstrap/eachboot.sh /var/lib/cloud/scripts/per-boot/eachboot.sh
		sudo rm -f /u01/app/osa/non-marketplace-init/system-configured
		sudo rm -f /var/log/audit/audit.log
		EOF
		chmod +x /tmp/cleanup.sh
		/tmp/cleanup.sh
		</copy>
		```

## Task 2: Import an existing image using a URL

Import an existing image into the Object Storage of your tenancy using a PAR URL. 

1. Log in to the tenancy.
1. Click on the hamburger (sandwich bars) and go to **Compute** > **Custom Images**.
1. Click **Import image** and specify the following.
    - Select the *compartment*
    - Enter a *name* for the image
    - Operating system - *Linux* (leave the default)
    - Import from an Object Storage URL - Paste the URL
    - Image type - *OCI*
1. Click **Import image**.

## Task 3: Create an instance from an image **wip**

tbd

## Task 4: Want to create a New Compute Instance from scratch? **wip**

> This task is still work-in-progress, not fully completed.

High-level steps for provisioning an instance -

1. Create an Instance   
2. Convert Private Key to PPK   
3. Log in to Instance Server   
4. Create users and groups  
5. Enable port 6080 for noVNC
   
   ## 1. Create an Instance

	1. Log in to the tenancy.
	1. Click on the hamburger (sandwich bars) and go to **Compute** > **Instances**.
	1. Click **Create Instance** and specify the following. 
	1. Enter a *name* for the instance.
	1. Select the *compartment* where to create the instance.  

		## Defaults
		<if type="hidden">

		| Type      | Details          | Action                  |
		|-----------|------------------|-------------------------|
		| Placement |                  | Leave the defaults      |
		| Image     | Oracle Linux 7.9 | Do not change the image |
		| Shape     | VM.Standard.E2.1.Micro <br>OCPU Count 1 <br>Memory 1 GB <br>Network Bandwidth 0.48 gbps | Change the shape as explained below |   
		</if>
		  - **Placement** - <ins>Do not change</ins>
		  - **Default image** - *Oracle Linux 7.9* <ins>Do not change</ins>.
		  - **Default shape** -
			 - VM.Standard.E2.1.Micro
			 - OCPU Count 1
			 - Memory 1 GB
			 - Network Bandwidth 0.48 gbps  

		  Leave the default placement and image, and change the shape as explained below. 

	1. Under Image and shape, click **Edit** > **Change shape**. 
		- **Instance type** - *Virtual machine* (default selected)
		- **Shape series** - *AMD*
		- **Shape name** - *VM.Standard.E3.Flex*
		- **No of OCPUs** - *2* (the memory changes to *32 GB* automatically)

		Click **Select shape**.

	1. For networking, leave the defaults *vcnyyyymmdd-xxxx*. For example, `vcn-20220131-2306`.

	1. Under Add SSH keys, Generate a key pair for me. (default selected).  
	   **Save Private key** (`*.key`) and **Save Public key** (`*.pub`) to your local system. 
	   
		> **Note:** Ensure to save both the keys. If you skip downloading the keys now, you do not get a second chance to download them ever again. 

		## Other options
		For SSH keys:
		 - **Upload public key files** - If you already have a public key. 
		 - **Paste public keys** - Paste the contents of the public key. 

		The next time when you create a new instance, you can use the same public key that you already have. 

		While creating an instance, enter the Public Key. The Private key is required to access the server and to configure a static host name. 

	1. The default boot volume is *46 GB*.

	   To increase the boot volume, click **Specify a custom boot volume size**. Starting size is 50 GB, maximum up to 32 TB.

		> **Note:** Alternatively, keep the default boot volume 46 GB for now and increase it later after creating the instance. But you cannot decrease the volume of an existing instance. 

	1. Click **Create** to create the instance.   
	   **Save stack** if you want to create stacks from the instance.

		> **Note:** The lifetime of an instance is <i>forever</i>, until you stop the instance and delete it. 

	The instance status displays *Provisioning*. After the status changes to *Running*, copy the **Public IP Address** (it is publicly accessible). You cannot connect to the server using the Private IP.

    ----
	## 2. Convert Private Key to PPK

	To authenticate and connect to the instance server  -
	- from a **Windows** system - use the *.ppk* file in PuTTY. 
	- from a **Mac** machine - use the *.key* file. 

	You can convert the private key (`*.key`) to `*.ppk` using PuTTYgen (or Mobaxterm).

	1. Open PuTTYgen and **Load** the private key.  
	   It displays a notice - `Successfully imported foreign key...`   

	   Click **OK**. 

	1. Click **Save private key**.   
	   The key passphrase is optional.

	   Click **Yes**.

	1. Enter a *file name* and click **Save**.   
	   It converts the private into the `*.ppk` format. 

	Close PuTTYgen.

	----
	## 3. Log in to Instance Server

	1. Open PuTTY.

	1. Under Host Name, enter the **Public IP** of the instance.   
	   Leave the default port *22* and connection type *ssh*. 

	1. In the **Category** pane on the left, go to **Connection** > **SSH** > **Auth**. 

	1. **Browse** for the ppk file generated above and click **Open**. 

		> **Note:** Disconnect VPN to connect to the instance server.   
		Right-click on the title bar which reads PuTTY (inactive) and **Restart Session** > **Yes**, if required.

	   You can **Save the session** for future logins.

	Log in to the instance server as *opc*. It does not require any password. 
	
	The terminal window displays the user name and the host name of the instance. 

	 - **Format**

	 ```
	 user@instance_hostname
	 ```

	 - **Example**

	 ```
	 oracle@dbaessentials
	 ```
	
	----
	## 4. Create users and groups

	1. Open PuTTY. 

	1. Log in to the instance server and run the following commands. 

	1. Change the user to `root`. 

		```
		$ <copy>sudo su -</copy>
		```

	1. Create a user *oracle*.

		```
		[root@hostname ~]# <copy>useradd oracle</copy>
		```

	1. Set the password for the `oracle` user. 

		```
		[root@hostname ~]# <copy>passwd oracle W@lcome12</copy>
		```

	1. Create the groups.

		- Create group - *dba* (primary).

			```
			[root@hostname ~]# <copy>groupadd dba</copy>
			```

		- Create group - *oinstall* (secondary).

			```
			[root@hostname ~]# <copy>groupadd oinstall</copy>
			```

	1. Add the user `oracle` to the groups.   

		```
		[root@hostname ~]# <copy>usermod -g dba -G oinstall oracle</copy>
		```

	   **Note:** `-g` is for the primary group and `-G` is for the secondary.

		## Verification

		Verify that the user `oracle` can create a file. 

		1. Change the user from `root` to `oracle`.

			```
			[root@hostname ~]# <copy>sudo su - oracle</copy>
			```

		1. Create a file.

			```
			$ <copy>touch text1.txt</copy>
			```

		1. View the newly create file with `ls -l` or simply `ls`.

			```
			$ <copy>ls -l</copy>
			```

			```
			$ <copy>ls</copy>
			```

		1. Remove the file.

			```
			$ <copy>rm text1.txt</copy>
			```

		To change user from oracle to opc, exit two times or run this command. 

		```
		$ <copy>sudo su - opc</copy>
		```

	----
	## 5. Enable port 6080 for noVNC

	1. Log in to the tenancy.

	1. Click on the hamburger (sandwich bars) and go to **Compute** > **Instances**.

	1. Click the **instance name** for which you want to enable the port. 
	
	1. Under Instance details, click the **Virtual cloud network** name, for example *vcn-20200616-1735*.

	1. Under **Resources** on the left, open **Security List**. Click the *Default Security List for vcn-20200616-1735*.

	   **Note:** By default, the Destination Port Range has only port *22* enabled. Since port 22 is for SSH, it means you can do only SSH. 

	1. Click **Add Ingress Rules** and specify the following.

		- **Source Type** - *CIDR* (default selected)
		- **Source CIDR** - *0.0.0.0/0*
		- **IP Protocol** - *TCP* (default selected)
		- **Source Port Range** - *All*
		- **Destination Port Range** - *6080*
		- **Description** - Optionally, add a brief description. 

	   Click **Add Ingress Rules** to enable port 6080.

	### Modify a Port

	1. Click the **three dots** on the right of an ingress rule and select **Edit**. 

	1. Modify the rule and click **Save changes**.

## Task 5: LiveLabs Instance terminal

Change the default home directory in the instance terminal for the `oracle` user. 

1. Connect to the instance using the noVNC URL.   
   A standard noVNC URL looks like this

	```
	http://[your instance public-ip address]:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true
	```

1. Open a terminal window and go to the the home folder

	```
	$ <copy>cd /home/oracle</copy>
	```

1. Modify the file *bashrc*.

	```
	$ <copy>vi ~/.bashrc</copy>
	```

1. Insert the path to the Oracle home location in the bash profile. 

	```
	<copy>cd /u01/app/oracle/product/21.0.0/dbhome_1</copy>
	```

1. Save the file `baserc`.

	### Restart noVNC
	
	To restart the noVNC environment from the instance terminal:

	```
	$ <copy>sudo systemctl restart vncserver_$(whoami)@\:1</copy>
	```

Completed till 1:04:43


### Change the hostname from the instance

1. Log in to the instance server using putty. 
2. Run these commands.

First time change user to root: 

sudo su - || (sudo sed -i -e 's|root:x:0:0:root:/root:.*$|root:x:0:0:root:/root:/bin/bash|g' /etc/passwd && sudo su -)

Subequent times change to root:
sudo su -


### Notes:

- Change to root and change the ownership of the script to oracle user.

```
$ <copy>chown -R oracle:dba start_db_21c_orcl.sh</copy>
```

- Change the mod to 755 for the script (-rwxr-xr-x means read, write, execute).

```
$ <copy>chmod 755 start_db_21c_orcl.sh</copy>
```

**Unverified**

```
mkdir /oracle
chown -R oracle:oinstall /oracle
chmod -R 775 /oracle
chmod g+s /oracle
```

## Task 6: Increase Boot Volume

1. Log in to the tenancy.

1. Click on the hamburger (sandwich bars) and go to **Compute** > **Instances**.

1. Click the **instance name** for which you want to increase the boot volume. 

1. Under **Resources** on the left, open **Boot volume**. 

1. Click the **Boot volume name** > **Edit**.

1. Increase the **Volume Size** (in GB), for example *64* GB, and **Save Changes**.

After the volume is provisioned, for the volume resize to take effect, log in to puTTY as *opc* and do the following -

 - Run the rescan commands. 
 - Extend the partition manually. 

**Steps**

1. Rescan the disk.

	```
	<copy>
	sudo dd iflag=direct if=/dev/oracleoci/oraclevda of=/dev/null count=1
	echo "1" | sudo tee /sys/class/block/`readlink /dev/oracleoci/oraclevda | cut -d'/' -f 2`/device/rescan
	</copy>
	```

2. Extend the root partition.

	```
	<copy>sudo /usr/libexec/oci-growfs</copy>
	```

> **Note:** Increasing the boot volume of an instance does not affect the volume size of the existing custom image. You must create the custom image again with the new (increased) boot volume. 

## Learn More

- [Setup Graphical Remote Desktop](https://oracle.github.io/learning-library/sample-livelabs-templates/create-labs/labs/workshops/compute/)

- [Create Custom OCI Compute Image for Marketplace Publishing](https://oracle.github.io/learning-library/sample-livelabs-templates/create-labs/labs/workshops/compute/?lab=7-labs-create-custom-image-for-marketplace)


## Acknowledgements

 - **Author** - Manish Garodia, Team Database UAD
 - **Last Updated on** - February 1, (Tue) 2022
