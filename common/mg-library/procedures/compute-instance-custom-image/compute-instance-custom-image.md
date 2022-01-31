# Compute Instance and Custom Image

## Introduction

This lab discusses about creating and managing compute instances and custom images in the OCI tenancy. 

## About noVNC environment

Basic steps for setting up a noVNC environment include -

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

The users need not go through these detailed steps to set up their VM. Nor do they have access to the internal systems. The *terraform scripts* automate these steps and create an instance for the users from the custom image. 

The OCI team (Rene or Ashish) deploys the custom image to the marketplace as *private* because it is not available for public view. The OCI has **26 regions** which are associated with specific teams. An image existing in a tenancy is available only to that team. The teams from other regions in the OCI do not have access to that image. 
But if an image is published to the OCI marketplace, then it is available to all (26) regions in the OCI. 

## Task 1: Create a Custom Image from an Instance

tbd

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

## Task 3: Create an instance from an image

tbd

## Task 4: Want to create a New Compute Instance from scratch?

**High-level steps for provisioning an instance -**

A. Create an Instance   
B. Convert Private Key to PPK   
C. Log in to Instance Server   
D. Create users and groups
E. Enable port 6080 for noVNC

----
### **A. Create an Instance**

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
### **B. Convert Private Key to PPK**

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
### **C. Log in to Instance Server**

1. Open PuTTY.

1. Under Host Name, enter the **Public IP** of the instance.   
   Leave the default port *22* and connection type *ssh*. 

1. In the **Category** pane on the left, go to **Connection** > **SSH** > **Auth**. 

1. **Browse** for the ppk file generated above and click **Open**. 

    > **Note:** Disconnect VPN to connect to the instance server.   
	Right-click on the title bar which reads PuTTY (inactive) and **Restart Session** > **Yes**, if required.

   You can **Save the session** for future logins.

Log in to the instance server as *opc*. It does not require any password.

----
# **D. Create users and groups**

1. Log in to the instance server using putty. 
2. Run these commands.
Change user to root: sudo su -
Create oracle user: useradd oracle
Create password for oracle user: passwd oracle
Create groups: groupadd dba
groupadd oinstall
Add user oracle to the groups: usermod -g dba -G oinstall oracle
Test if the user can create a file: touch text1.txt 
See the newly create file: ls -l/ls
Remove the file: rm text1.txt

3. Change user to opc: Exit two times or 

4. Change user to oracle: sudo su - oracle 

Unverified
-------------
mkdir /oracle
chown -R oracle:oinstall /oracle
chmod -R 775 /oracle
chmod g+s /oracle

Run these labs:
- Lab 1: Setup Graphical Remote Desktop

https://oracle.github.io/learning-library/sample-livelabs-templates/create-labs/labs/workshops/compute/?lab=6-labs-setup-graphical-remote-desktop

- Lab 2: Create Custom OCI Compute Image for Marketplace Publishing

https://oracle.github.io/learning-library/sample-livelabs-templates/create-labs/labs/workshops/compute/?lab=7-labs-create-custom-image-for-marketplace

First time change user to root: 

sudo su - || (sudo sed -i -e 's|root:x:0:0:root:/root:.*$|root:x:0:0:root:/root:/bin/bash|g' /etc/passwd && sudo su -)

Subequent times change to root:
sudo su -


**E. Enable port 6080 for noVNC**
-------------------------------------

1. Log in to the tenancy
2. Hamburger (Sandwich bars) > Compute > Instances.
3. Click the instance name > Virtual Cloud Network name
4. Open Security List > Default Security List for vcn-20200616-1735
   Be default, only Port 22 is enabled which is for SSH. So, you can do only SSH. 

5. Add ingress Rule.
   Source type: CIDR (default)
   Source CIDR: 0.0.0.0/0
   Source Port Range: All
   Destination Port range: 6080
   IP Protocol: TCP

Save changes.


Completed till 1:04:43

Terminal window
-------------------
user@instance_name
oracle@dbaessentials

Check the hostname name
------------------------
cat /etc/hosts

Change the hostname from the instance
-----------------------------------------
1. Log in to the instance server using putty. 
2. Run these commands.

Change user to root:
sudo su - || (sudo sed -i -e 's|root:x:0:0:root:/root:.*$|root:x:0:0:root:/root:/bin/bash|g' /etc/passwd && sudo su -)






Notes:
------
- change to root and change ownership the script to oracle user
chown -R oracle:dba start_db_21c_orcl.sh

- Change mod to 755 for the script [read, write, execute]  (-rwxr-xr-x)
chmod 755 start_db_21c_orcl.sh



Standard noVNC URL
-------------------
http://[your instance public-ip address]:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true

Restart VNC from instance terminal
----------------------------------
sudo systemctl restart vncserver_$(whoami)@\:1

For LiveLabs instance terminal
----------------------------------
change default home directory for oracle user
modify bashrc file under /home/oracle

vi ~/.bashrc
cd /u01/app/oracle/product/21.0.0/dbhome_1

copy 21c goldimage to instance
-----------------------------------
mkdir -p /u01/app/oracle/product/21.0.0/dbhome_1
cd /net/adcnas481.us.oracle.com/export/pd_shiphomes/shiphomes/rdbms/linux.x64/21c/21.3.0.0.0/LATEST/goldimage
unzip -q db_home.zip -d /u01/app/oracle/product/21.0.0/dbhome_1


Instance details
---------------------

VM details
--------------
hostname: dbaessentials.livelabs.oraclevcn.com
port: 6080

username: oracle
Password: W@lcome12

Instance 1
----------
Instance name: DBAEssentials_21c_os-only
Public IP: 150.136.138.183
Image 1: dbaessentials_21c_os-only_v1

noVNC URL: 
http://150.136.138.183:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true

Instance 2
----------
Instance name: DBAEssentials_21c_installer
Public IP: 129.213.163.15
Image 2: dbaessentials_21c_installer_v1

noVNC URL:
http://129.213.163.15:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true

Bucket name: db-installer
Object name: dbaessentials_21c_installer

PAR URL for Image 2: expired on Aug 20
https://objectstorage.us-ashburn-1.oraclecloud.com/p/iz-YYHBb7OyEJmUQ0fDK2IUdqwhqyfRlTcWfEoCwGbWMm9B4M3S8WK3hFmxXqO2M/n/idrudhdwamji/b/db-installer/o/dbaessentials_21c_installer

PAR URL for Image 2: created on Aug 26
https://objectstorage.us-ashburn-1.oraclecloud.com/p/Q-gwaJOKQVOkjOJ9mK4mF4tjCPi0irqiHXI0C2aBiYDy6QDcujdXH5oN2uqGXUB4/n/idrudhdwamji/b/db-installer/o/dbaessentials_21c_installer

PAR URL for WS1: created on 7 Jan 2022, valid till 14 Jan
https://objectstorage.us-ashburn-1.oraclecloud.com/p/B873TzZRYXSbSzz_Un_rgXxGcOgZmDiSaMJWDwC2-gyJzPiPcndyQ0PmBB3uWW3i/n/idrudhdwamji/b/db-installer/o/dbaessentials_21c_installer.oci

PAR URL for Ws2 image from Rene:
https://objectstorage.us-ashburn-1.oraclecloud.com/p/-aidsyb5OOwAE-8q6Tdxq_rr2V-v5PLADtckYgtzZ-xichKWSv7RK4WNMUWuQdzt/n/natdsecurity/b/stage/o/emcc-livelabs-v3-int-02-10.20.2021

Image 3: emcc-image-imported-from Rene-20211021

Instance 3: dbaessentials-21c-emcc

Image 4: dbaessentials_emcc_v0
Image 5: dbaessentials_emcc_21c_v1

DBA-Essentials-EMCC-V0-imported from Rene

DBA-Essentials-EMCC-V0
Public IP 150.230.160.80

Instance 4
----------
Instance name: DBAEssentials_21c_installer-v2-test-labs
Public IP: 150.230.185.102
For emcc labs testing
https://150.230.185.102:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true

/home/oracle/start_db.sh

export ORACLE_HOME=/u01/app/oracle/product/21.0.0/dbhome_1
export PATH=$ORACLE_HOME/bin:$PATH
export ORACLE_SID=orcl

$ORACLE_HOME/bin/lsnrctl start LISTENER_1522

$ORACLE_HOME/bin/sqlplus '/as sysdba'<<- _START_DB
	startup;
	alter system register;
	exit;
_START_DB


Cleanup instance before creating image
---------------------------------------
Run as opc

cd /tmp
wget https://raw.githubusercontent.com/oracle/oci-utils/master/libexec/oci-image-cleanup -O /tmp/oci-image-cleanup.sh
chmod +x oci-image-cleanup.sh

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


Increase boot volume to 64 GB
-------------------------------
Increasing the boot volume of an instance does not affect the volume size of existing custom images. You need to create custom image again with the increased boot volume. 

1. Log in to the tenancy
2. Hamburger (Sandwich bars) > Compute > Instances.
3. Click the instance name. 
4. Under Resources > open Boot Volume. Click the boot volume name > Edit.
5. Increase the volume size and Save changes.

After the volume is provisioned, for the volume resize to take effect, you need to:
1. Run the rescan commands. 
2. Extend the partition manually. 

Log in to putty as opc user

1 Rescan disk

sudo dd iflag=direct if=/dev/oracleoci/oraclevda of=/dev/null count=1
echo "1" | sudo tee /sys/class/block/`readlink /dev/oracleoci/oraclevda | cut -d'/' -f 2`/device/rescan

2 Extend root partition

sudo /usr/libexec/oci-growfs


Tenancy credentials
----------------------- 
URL: https://cloud.oracle.com/?tenant=ngreenbeorg&provider=OracleIdentityCloudService&region=us-ashburn-1
username: SureshRRajan
password: Merleauponty@67


## noVNC Environments

Image with EMCC from Rene -
http://150.230.160.80:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true

Test labs for EMCC -
http://150.230.185.102:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true
