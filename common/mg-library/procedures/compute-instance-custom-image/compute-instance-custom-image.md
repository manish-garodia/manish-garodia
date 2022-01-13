

http://150.230.160.80:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true
150.230.185.102

Set up a VM for Livelabs
----------------------------
Create an instance, keep the prerequisites, create user accounts, install the required applications, and create a custom image. 
The custom image creates a package of the instance you have configured. When you create a new instance from this custom image, it generates a copy of the instance server with preconfigured settings, for example, libraries, user accounts, applications, etc.

If the host name of the instance changes, EM fails to run. Therefore, keep the hostname static. 

Create a user and then install Vnc because to run NoVnc, it requires a user account on the host. 

Store the database installer and the packages in Object store, give public access, and directly download in the isntance using this command: wget URL

You don't have to transfer the files from local host or laptop to the server. 

If the bucket visibility is public, anyone can access it from anywhere. 

After creating the custom image, you can terminate the instance. The custom images acts as a backup and you can create another instance from it. Do not delete the custom image. 
After the livelabs is production and there is no dependency on the custom image, even if you delete the custom image, connect with Rene or Ashish to get the image back. 

Terraform scripts will automate these steps and create an instance for the users from the custom image. The users will not have access to internal systems and they need not go through these steps to set up their VM.
The OCI team (Rene or Ashish) deploys the custom image to the marketplace as private, it is not available for public view. OCI has 26 regions, any image existing in a specific tenancy is available to the team and the teams from other regions in OCI do not have access to the image. 
If the image is published to OCI marketplace, it is available to all the 26 regions in OCI. 



Import an existing image
----------------------------
1. Log in to the tenancy
2. Hamburger (Sandwich bars) > Compute > Custom Images
3. Click Import Image and specify the following 
   - Select the compartment
   - Enter a name
   - Import from an Object Storage URL
   - Image type: OCI
4. Click Import Image


Create a new image
--------------------
1. Log in to the tenancy
2. Hamburger (Sandwich bars) > Compute > Instances
3. Click Create Instance and specify the following. 
4. Enter a name, select the compartment. 
5. Under Image and shape, click Edit. 
   Default image and shape
   Default image - Oracle Linux 7.9 (Do click Change Image)
   Default shape - VM.Standard.E2.1.Micro, OCPU Count 1, Memory 1GB, Network Bandwidth 0.48 gbps
6. Click Change Shape and specify the following. 
   Instance type: Virtual machine (default)
   Shape series: AMD
   Shape Name: VM.Standard.E3.Flex
   No of OCPU: 2 (memory changes to 32 GB automatically)
7. Leave the default networking: vcn20200616-1735
8. Add SSH keys > Generate a key pair for me. Save both Private key (*.key) and Public key (*.pub). 
   Upload public key files: If you already have a public key. 
   Paste public keys: Paste the contents of the public key. 
   The next time when you create a new instance, use the same public key which you already have. While creating an instance, you give the Public Key. Private key is required to access the server and configure a static hostname. 
   If you skip downloading the keys now, you do get a second chance to download them ever again. 
9. Boot volume - 46 GB (default). Click Specify a custom boot volume size if you want to increase the boot volume now. Starting size is 50 GB, max up to 32 TB. Or, you can keep the default boot volume 46 GB and increase it later after creating the instance. But you cannot decrease the volume of an existing instance. 

10. Click Create to create the instance. 
    Save stack if you want to create stacks from the instance.

    The lifetime of an instance is forever, until you stop and delete the instance. 

11. After the instance status changes to running, copy the Public IP Address (it is publicly accessible). You cannot connect the the server using the Private IP. 


Convert the private key (*.key) to *.ppk format using PuTTYgen (or Mobaxterm) 
-------------------------------------
If you want to connect to the instance server:
- From a Windows system, use the ppk file in Putty. 
- From a Mac machine, use the key file . 

1. Open PuTTYgen and load the private key.
   Displays a message "Successfully imported foreign key..." > click OK. 
2. Save private key. Passphrase is optional > click Yes. 
3. Enter a filename and click Save (as *.ppk format). 

Close PuTTYgen.

Log in to the instance server
-------------------------------------
1. Open PuTTY and enter the public IP of the instance in the host name. 
2. Under Category > SSH, click Auth. (Save the session for future connections)
3. Browse for the *.ppk file generated above > Open. 
   Disconnect VPN to connect to the server. Right-click on the title bar which reads PuTTY (inactive) and Restart Session, if required > Yes.
4. Login as: opc (requires no password)

Create users and groups in the instance
-----------------------------------------
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


Enable port 6080 for noVnc
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

NoVNC URL: 
http://150.136.138.183:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true

Instance 2
----------
Instance name: DBAEssentials_21c_installer
Public IP: 129.213.163.15
Image 2: dbaessentials_21c_installer_v1

NoVNC URL:
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


