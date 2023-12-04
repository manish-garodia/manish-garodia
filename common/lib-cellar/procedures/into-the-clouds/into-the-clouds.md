# Into the Clouds

## OCI Tenancy

This lab discusses about a few features and services in Oracle Cloud Infrastructure (OCI).

For example,
 - concepts of noVNC environment
 - how to create and manage compute instances and custom images
 - about administrative tasks, such as object storage, compartments, etc.

## About noVNC environment

The basic steps for setting up a noVNC environment include -

1. Create an instance.

1. Prepare the environment with the prerequisites, such as:
    - Create user accounts
	- Copy files and folders
    - Install the applications
	- Any other requirements

1. Create a custom image and export to the object storage.

	The custom image creates a package of the instance that you have configured. It acts as a backup, and you can re-create another instance from it. When you create a new instance from this custom image, it generates a copy of the original instance server with preconfigured settings, for example, libraries, user accounts, applications, and so on. After creating the custom image, you can terminate the instance.

	> **Note:** Do not delete the custom image from the tenancy before publishing it to the OCI marketplace.  
	After the Livelabs goes to production, it has no dependency on the custom image. Now, if you delete the custom image, then connect with the Livelabs OCI team to get the image.

### Points to consider

If the host name of the instance changes, Enterprise Manager fails to run. Therefore, keep the *host name static*. To run noVNC, it requires a user account on the host. Create the user and then install Vnc.

You cannot transfer files and folders from the local host or a laptop to the noVNC server.
 - Upload objects or packages, for example Oracle Database 21c installer, to the Object store.
 - Give public access and directly download it in the instance using the command `wget URL`.   
   If the bucket visibility is public, anyone can access it from anywhere.

The users need not go through these detailed steps to set up their VM. Nor do they have access to the internal systems. The *terraform scripts* automate these steps and create an instance for the users from the custom image. The OCI team (Rene or Ashish) deploys the custom image to the marketplace as *private* because it is not available for public view.

With growing customer needs, Oracle keeps expanding its infrastructure by introducing additional regions. As you continue using OCI, Oracle adds new regions to the list. Currently, OCI has **38 regions** that are associated with specific teams. 
 - An image existing in a tenancy is available only to that team. The teams from other regions in the OCI do not have access to that image.
 - But if an image is published to the OCI marketplace, then it is available to all regions in OCI.

<if type="hidden">

## Credentials and specifications

 - Instance credentials
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

		| User name or email | Password          |
		| -------------------|-------------------|
		| ManishGarodia      | Enter the password <!-- *Sujangarh,21*--> |
		| <!--SureshRRajan        *Merleauponty@67* -->|

		<!--  - **User name** or **email** - *SureshRRajan*
			- **Password** - *Merleauponty@67*
		-->

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

		## PAR URLs

		 - PAR URL for *Image 2* - expired on Aug 20, 2021

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/iz-YYHBb7OyEJmUQ0fDK2IUdqwhqyfRlTcWfEoCwGbWMm9B4M3S8WK3hFmxXqO2M/n/idrudhdwamji/b/db-installer/o/dbaessentials_21c_installer
			```
		 - PAR URL for *Image 2* - created on Aug 26, 2021

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/Q-gwaJOKQVOkjOJ9mK4mF4tjCPi0irqiHXI0C2aBiYDy6QDcujdXH5oN2uqGXUB4/n/idrudhdwamji/b/db-installer/o/dbaessentials_21c_installer
			```

		 - PAR URL for *WS1* - created on 7 Jan 2022, valid till 14 Jan.

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/B873TzZRYXSbSzz_Un_rgXxGcOgZmDiSaMJWDwC2-gyJzPiPcndyQ0PmBB3uWW3i/n/idrudhdwamji/b/db-installer/o/dbaessentials_21c_installer.oci
			```

		 - PAR URL for *WS2 image* from Rene.

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/-aidsyb5OOwAE-8q6Tdxq_rr2V-v5PLADtckYgtzZ-xichKWSv7RK4WNMUWuQdzt/n/natdsecurity/b/stage/o/emcc-livelabs-v3-int-02-10.20.2021
			```

		 - PAR URL for *WS3*, *WS8*, *WS11 image* - created on 4 Feb 2022, valid till 18 Feb.

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/8Priv4KCP6ttV0Rqc9Zy0bis2ui_rPu1xWKMSZWSv941Fyl6QV2lg9uANgdlNPaJ/n/idrudhdwamji/b/images-for-livelabs-workshops/o/dbaessentials-21c-installed-appuser_v1
			```

		 - PAR URL for *WS4 image* - created on 25 Mar 2022, valid till 15 Apr.

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/wQ-t802jacSqeclmlefOKENYpTniIi59C6FACdUF2iBhMClAy8-XdbNHy98ys7Ap/n/idrudhdwamji/b/images-for-livelabs-workshops/o/dbaessentials-21c-emcc_v2
			```

		 - PAR URL for *WS4 image* - created on 19 Apr 2022, valid till 20 May.

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/StcksXQChoqJfQ4q46oUVoWChVmGH-2rDDTJIMfpJ6NUS31Fvjnp79SQbcOgLgdo/n/idrudhdwamji/b/images-for-livelabs-workshops/o/dbaessentials-21c-emcc_v3
			```

		 - PAR URL for *WS4 image* - created on 21 Apr 2022, valid till 20 May.

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/_mwMLRZ6vFDWD_PZ2IF1Ih6RuJKYLTLWJ7dl8Cq534vOmxf40D3sn6YKlgZoFQJV/n/idrudhdwamji/b/images-for-livelabs-workshops/o/dbaessentials-21c-emcc_v4
			```

		 - PAR URL for *WS11-8341-live* name par-object-20220408-1257 - created on 8 Apr 2022, valid till 31 Dec, 2033.

			Old

			```
			https://objectstorage.ap-seoul-1.oraclecloud.com/p/Db0-IwNRpeapsxh3TsMf7aHP41Rb1-zMluhCOn0O4MVAFuGTLTbEOdTx6_yzUe-B/n/cnmyhyct1k43/b/dba-essentials/o/ws11-8341-live.png
			```

			New

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/_HuemwlaO6RZQNLOljUCsgs6tvUX2E8DsDi66GvYxbBdf1T2J9SZp-eu6Qd8VXQR/n/idrudhdwamji/b/dba-e-ws-live/o/ws11-8341-live.png
			```

		 - PAR URL for *dba-e-filter* - created on 6 June 2022, valid till 31 Dec, 2033.

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/CKeQN8E9rvQw-tdCj4OudcCzO0rs6x0ZYmms46ttwBQH1VUV1X9g3CxUC-Kt3RvJ/n/idrudhdwamji/b/dba-e-ws-live/o/dba-e-filter.png
			```

		 - PAR URL for *WS6-11060-live* - created on 6 June 2022, valid till 31 Dec, 2033.

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/ORzD8dbvOACgLnjG8uchLoRgOqd3wun3sB-RewT0jM5dsQTtVkmXq4YG0_fU0r7D/n/idrudhdwamji/b/dba-e-ws-live/o/ws6-11060-live.png
			```

		 - PAR URL for *manishgarodia-objectstore-20221206-time.html* - created on 6 Dec 2022, valid till 31 Dec, 2051.

			```
			https://objectstorage.ap-seoul-1.oraclecloud.com/p/EoSugBzbgMituYPpGuv5T9ZGLBP3K-inJlYnR2UasCiizCVAwM_0jDGpj96cP-K9/n/cnmyhyct1k43/b/bucket-20210824-2326/o/time.html
			```

			```
			https://objectstorage.ap-seoul-1.oraclecloud.com/p/dUEnGWixmpsK1TcgbbfEVuTZtQ8h1wiK7rf-rjeg53pI9VstofxSCe4sChHeoCuh/n/cnmyhyct1k43/b/bucket-20210824-2326/o/time.html
			```

			```
			https://objectstorage.ap-seoul-1.oraclecloud.com/p/Wnmwviac2Iw9jR7WuDdTJWDXifI23CHNmZqSXCQPXdXJqNDogWagV9WPKyoEANr3/n/cnmyhyct1k43/b/bucket-20210824-2326/o/time.html
			```

		 - PAR URL for *ws10-11300-live* - created on 19 Dec 2022, valid till 31 Dec, 2051.

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/CW0vc3DEfkuuQc4OQVOED1K8toeqzR9KD7O9fYRNgqkKMIljArKQKi4dsFyxpAWe/n/idrudhdwamji/b/dba-e-ws-live/o/ws10-11300-live.png
			```

		 - PAR URL for *wordlist* - created on 7 Mar 2023, valid till 31 Dec, 2051.

			```
			https://objectstorage.ap-seoul-1.oraclecloud.com/p/m7lcmI9dS-GcuDuDPtIngbxMtUVbeOHSYG4K871CK8GsEzwEaUr2kJPY22TVVYXj/n/cnmyhyct1k43/b/bucket-20210824-2326/o/wordlist
			```

			bitly - short url TBD

			```
			https://bit.ly/wordlist-mg
			```

		 - PAR URL for *wordlist.sh* - created on 25 Mar 2023, valid till 31 Dec, 2051.

			```
			https://objectstorage.ap-seoul-1.oraclecloud.com/p/nYgbWDImBDQAqUfiRNFXaA9UueC3w1ZpuEi7YviCUhYptHuY49WDy0eKBQ4G3DFN/n/cnmyhyct1k43/b/mg-store/o/wordlist.sh
			```

			bitly - short url

			```
			https://bit.ly/3ZgJ4aj
			```

		 - PAR URL for *wordlist.zip* - created on 25 Mar 2023, valid till 31 Dec, 2051.

			```
			https://objectstorage.ap-seoul-1.oraclecloud.com/p/ysyuZDLAuJZfL2Z2JbED8KuSbS1xer5MJWkzhArtMYDTvqN5CtQpXGpn0tl5CKII/n/cnmyhyct1k43/b/mg-store/o/wordlist.zip
			```

			bitly - short url

			```

			```

		 - PAR URL for *wordlist.zip* - created on 13 Apr 2023, valid till 31 Dec, 2051.

			```
			https://objectstorage.ap-seoul-1.oraclecloud.com/p/cllTxmSZnae2rVOoK8pJE7VZLWvJmdSYxWjuNg5kYhXmnWyAzHObGaDoNkfZAyml/n/cnmyhyct1k43/b/mg-store/o/wordlist.zip
			```

			bitly - short url

			```
			https://bit.ly/wordlist_mg
			```

		 - PAR URL for *wordlist-check.zip* - created on 25 Jun 2023, valid till 31 Dec, 2051.

			```
			https://objectstorage.ap-seoul-1.oraclecloud.com/p/HQZRih37GzkgfF9QQRS_uvVKZQ6Vy4WfNq0nHYzF19nG8SiVkqOFgHlmR6uycECd/n/cnmyhyct1k43/b/mg-store/o/wordlist-check.zip
			```

			bitly - short url tool

			```
			https://bit.ly/wordlist-check-mg
			```

		 - PAR URL for the tool help text - created on 25 Jun 2023, valid till 31 Dec, 2051.

			```
			https://manish-garodia.github.io/mg-playground/topic-title/wordlist-check/
			```

			bitly - short url help text

			```
			https://bit.ly/wordlist-check-help
			```

</if>

## Options for custom image

Either of the following will get you a custom image.
 - **Option 1** - *Create* a custom image from an instance.
 - **Option 2** - *Import* an existing image into your tenancy using a URL.

	## 1. How to create a custom image from an instance?

	Creating a custom image from an instance is a two-step process -
	 - Clean up the instance
	 - Create the image

	VPN is disconnected, yes? Follow these steps.

	1. Log in to the instance server as *opc* using PuTTY.

	1. Check the host name in the `hosts` file.

		```
		$ <copy>cat /etc/hosts</copy>
		```

		If the instance is clean, it displays only the following two.

		```
		127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
		::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
		```

		But, if instance requires cleaning, then it displays a third line.

		Example -

		```
		10.0.0.225   dbaessentials.livelabs.oraclevcn.com  dbaessentials
		```

		Clean up the instance first before proceeding with the custom image.

	1. Follow this task to clean the instance.

		[Task 1: Cleanup Instance for Image Capture](https://oracle.github.io/learning-library/sample-livelabs-templates/create-labs/labs/workshops/compute/?lab=7-labs-create-custom-image-for-marketplace#Task1:CleanupInstanceforImageCapture)

		> **Note:** Always *clean up* the instance before creating a custom image.

	1. Check the `hosts` file again and verify that the instance is clean.

		```
		$ <copy>cat /etc/hosts</copy>
		```

	1. Follow this task to create a custom image.

		[Task 2: Create Custom Image](https://oracle.github.io/learning-library/sample-livelabs-templates/create-labs/labs/workshops/compute/?lab=7-labs-create-custom-image-for-marketplace#Task2:CreateCustomImage)

	> **Note:** Ensure to select the correct *compartment* while creating the custom image. If you create the image in a wrong compartment by mistake, you can *Move Resource* and bring the image back to the relevant compartment.

	After creating the custom image -
	 - Export the image to the object store
	 - Share the PAR URL with the OCI team
	 - The OCI team downloads the image and publishes it to the OCI marketplace.

		## Instance cleanup commands (handy)

		- Log in to the instance as *opc* using PuTTY.
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

	## 2. How to import an existing image using a URL?

	Import an existing image from another Object Storage into your tenancy using a PAR URL.

	1. Log in to the tenancy.

	1. Click the hamburger (sandwich bars) and go to **Compute** &gt; **Custom Images**.  
	   Check if the compartment is correct.

	1. On the Images page, click **Import image** and specify the following.
		- Select the *compartment*
		- Enter a *name* for the image
		- Operating system - *Linux* (leave the default)
		- Import from an Object Storage URL - Paste the URL
		- Image type - *OCI*

	1. Click **Import image**.

	You can create an instance from the imported image and modify the environment as required.

## Options for creating instance

After logging in to the tenancy:

 - **Case #1** - Create a new instance from scratch altogether.

 - **Case #2** - Create an instance from an existing custom image.

	> **Note:** Create an instance from the custom image to verify whether the image has the correct prerequisites, the packages, the configurations, and the environment.

   ## 1. To create an instance from scratch

	1. Click the hamburger (sandwich bars) and go to **Compute** &gt; **Instances**.   
		Check if the compartment is correct.

	1. On the Instances page, click **Create instance**.

	1. Follow [Task 3: How to create a compute instance?](?lab=compute-instance-custom-image#Task3:Howtocreateacomputeinstance?).

   ## 2. To create an instance from an existing image

	1. Click the hamburger (sandwich bars) and go to **Compute** &gt; **Custom Images**.   
	   Check if the compartment is correct.

	1. Click the *image name* from which you want to create the instance.

	1. On the Custom image details page, click **Create instance**.

		Alternatively, click the three dots on the right of the image name and select **Create instance**.

	1. Follow [Task 3: How to create a compute instance?](?lab=compute-instance-custom-image#Task3:Howtocreateacomputeinstance?).

## How to create a compute instance?

> **Note:** Whether from an image or from scratch, the steps for creating an instance is the same.

Following the **Create instance** button, do these steps.

1. Enter a *name* for the instance.

1. Select the *compartment* for the instance to create in.  

	## Defaults
	  <!--
			| Type      | Details          | Action                  |
			|-----------|------------------|-------------------------|
			| Placement |                  | Leave the defaults      |
			| Image     | Oracle Linux 7.9 | Do not change the image |
			| Shape     | VM.Standard.E2.1.Micro <br>OCPU Count 1 <br>Memory 1 GB <br>Network Bandwidth 0.48 gbps | Change the shape as explained here |   
	  -->
	  - **Placement** - <ins>Do not change</ins>
	  - **Default image** - <ins>Do not change</ins>

	  The image can be:
		 - a Linux version, for example *Oracle Linux 7.9*, for a new instance from scratch, or
		 - the custom image from which it is created.

	  - **Default shape** -
		 - Shape - *VM.Standard.E2.1.Micro*
		 - OCPU Count - *1*
		 - Memory - *1 GB*
		 - Network Bandwidth - *0.48 gbps*

	  Leave the default placement and image, and change the shape as explained here.

1. Under Image and shape, click **Edit** &gt; **Change shape**.
	- **Instance type** - *Virtual machine* (default selected)
	- **Shape series** - *AMD*
	- **Shape name** - *VM.Standard.E3.Flex*
	- **No of OCPUs** - *2* (the memory changes to *32 GB* automatically)

	Click **Select shape**.

	> **Note:** Adding a shape compatibility to an image does not guarantee that the image will work on the shape. You must test the image on the shape after you add compatibility. Some images (especially Windows) might never be cross-compatible with other shapes because of driver or hardware differences.

1. For networking, leave the defaults *vcnyyyymmdd-xxxx*. For example, `vcn-20220131-2306`.

1. Under Add SSH keys, the page displays the default **Generate a key pair for me** selected.  
   Save both the keys to your local system, **Save Private key** (`*.key`) and **Save Public key** (`*.pub`).

	> **Note:** Ensure to save both, the private key and the public key. If you skip downloading the keys now, you do not get a second chance to download them ever again.

	## Other options
	For SSH keys:
	 - **Upload public key files** - If you already have a public key.
	 - **Paste public keys** - If you want to paste the contents of the public key.

	The next time when you create a new instance, you can use the same public key that you already have.

	While creating an instance, enter the Public Key. The Private key is required to access the server and to configure a static host name.

1. Determine the boot volume for the instance.
	- For a new instance, the default size is *46 GB*.
	- For an instance from an image, the boot volume takes the size of the image.

	Optionally, you can click **Specify a custom boot volume size** to increase the size. Skip this for now and use the default boot volume.

	> **Note:** After creating the instance, you can increase the boot volume later. But you cannot decrease the size of an existing instance.   
	The boot volume size starts at *50 GB* with a maximum is up to *32 TB*.

1. Click **Create** to create the instance.   
   You can **Save stack** if you want to create stacks from the instance. Skip this for now.

	> **Note:** The lifetime of an instance is <i>forever</i>, until you stop the instance and delete it.

The instance status displays *Provisioning*. After some time, the status changes to *Running*. Note the **Public IP Address** of the instance (because it is publicly accessible). You cannot connect to the server using the Private IP.

> **Note:** If you create a compute instance from scratch, enable port *6080* for noVNC.

## Enable port *6080* for noVNC

To access the remote desktop for noVNC environment, enable port *6080*.

1. Log in to the tenancy.

1. Click the hamburger (sandwich bars) and go to **Compute** &gt; **Instances**.   
	Check if the compartment is correct.

1. On the Instances page, click the *instance name* for which you want to enable the port.

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

1. Click **Add Ingress Rules** to enable port 6080.

You can now connect to the noVNC remote desktop and provision a green button reservation for your Livelabs workshop.

### Modify a Port

1. Click the **three dots** on the right of an ingress rule and select **Edit**.

1. Modify the rule and click **Save changes**.

## Manage your tenancy

After logging in to your tenancy, you can do various administrative activities, such as:

1. Access the Object Storage
2. Export a custom image
3. Delete an image
4. Move resources between compartments
5. Edit an instance name
6. Terminate an instance
7. Increase the boot volume of an instance

	----
	## 1. To access the Object Storage

	1. Click the hamburger (sandwich bars) and go to **Storage** &gt; **Buckets**.   
		Check if the compartment is correct.

		The Object Storage & Archive Storage page displays the buckets.

	1. Click the *bucket name* to view its contents.

	----
	## 2. To export a custom image

	1. Click the hamburger (sandwich bars) and go to **Compute** &gt; **Custom Images**.   
		Check if the compartment is correct.

	1. On the Images page, click the *custom image name* that you want to export.

		Alternatively, click the three dots on the right of the image name and select **Export**.

	1. On the Custom image details page, click **Export** to export the image to the object store.

	After some time, go to the object storage and verify that the custom image is exported successfully.

	----
	## 3. To delete an image

	1. Click the hamburger (sandwich bars) and go to **Compute** &gt; **Custom Images**.   
		Check if the compartment is correct.

	1. On the Images page, click the *custom image name* that you want to delete.

		Alternatively, click the three dots on the right of the image name and select **Delete**.

	1. On the Custom image details page, click **More Actions** &gt; **Delete**.

	1. On the confirmation screen, click **Delete** to remove the custom image permanently.

	The custom image is deleted from the tenancy immediately.

	----
	## 4. To move resources between compartments

	1. Click the hamburger (sandwich bars) and go to **Compute** &gt; **Instances**.   
		Check if the compartment is correct.

	1. On the Instances page, click the *instance name* that you want to move.

	1. On the Instance details page, click **More Actions** &gt; **Move Resource**.

	1. Select the *compartment* where you want to move the resource.

	1. Click **Move Resource** to move the instance to the selected compartment.

		The instance is moved to the new compartment immediately. It is not displayed in the compartment anymore. Change to the new compartment and verify that it dispays the instance.

	Similarly, you can move images, buckets in the object store, etc. between compartments. Moving a bucket to another compartment also moves all the underlying objects stored within the bucket.

	You can move resources from one compartment to another within your tenancy. In this example, we moved an instance to another compartment.

	> **Note:** Moving a resource does not export it to the Object Store. Nor can you move a resource from your tenancy to another tenancy or region.

	----
	## 5. To edit an instance name

	1. Click the hamburger (sandwich bars) and go to **Compute** &gt; **Instances**.   
		Check if the compartment is correct.

	1. On the Instance details page, click **Edit** and specify a new name.

	1. Click **Save changes**.

	----
	## 6. To terminate an instance

	1. Click the hamburger (sandwich bars) and go to **Compute** &gt; **Instances**.   
		Check if the compartment is correct.

	1. On the Instances page, click the *instance name* that you want to delete.

		Alternatively, click the three dots on the right of the instance name and select **Terminate**.

	1. On the Instance details page, click **More Actions** &gt; **Terminate**.

	1. On the confirmation screen, select *Permanently delete the attached boot volume*.

	1. Click **Terminate instance** to remove the instance permanently.

	The instance status displays *Terminated*. After some time, the instance is removed from the tenancy.

	## 7. To increase the boot volume of an instance

	1. Click the hamburger (sandwich bars) and go to **Compute** &gt; **Instances**.   
	   Check if the compartment is correct.

	1. On the Instances page, click the *instance name* for which you want to increase the boot volume.

	1. Under **Resources** on the left, open **Boot volume**.

	1. Click the **Boot volume name** &gt; **Edit**.

	1. Increase the **Volume Size** (in GB), for example *64* GB.

	1. Click **Save Changes**.

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

	> **Note:** Increasing the boot volume of an instance does not affect the volume size of the existing custom image. For the custom image to have the new (increased) boot volume, create the image again.

<if type="hidden">

## Task 6: Set up the instance post creation **wip**

> This task is still work-in-progress, not fully completed.

After creating the instance from scratch, set up the instance as follows.

1. Convert Private Key to PPK
2. Log in to Instance Server
3. Create users and groups

    ----
	## 1. Convert Private Key to PPK

	To authenticate and connect to the instance server  -
	- from a **Windows** system - use the *.ppk* file in PuTTY.
	- from a **Mac** system - use the *.key* file.

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
	## 2. Log in to Instance Server

	VPN is disconnected, yes? Follow these steps.

	1. Open PuTTY.

	1. Under Host Name, enter the **Public IP** of the instance.   
	   Leave the default port *22* and connection type *ssh*.

	1. In the **Category** pane on the left, go to **Connection** &gt; **SSH** &gt; **Auth**.

	1. **Browse** for the ppk file generated earlier and click **Open**.

		> **Note:** Disconnect VPN to connect to the instance server.   
		Right-click the title bar which reads PuTTY (inactive) and **Restart Session** &gt; **Yes**, if required.

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
	## 3. Create users and groups

	Ensure to disconnect VPN before proceeding.

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

		1. View the newly create file with `ls -l` or `ls`.

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

## Task 7: LiveLabs Instance terminal

Change the default home directory in the instance terminal for the `oracle` user.

1. Connect to the instance using the noVNC URL.   
   A standard noVNC URL is -

	```
	http://[your instance public-ip address]:6080/vnc.html?password=LiveLabs.Rocks_99&resize=scale&quality=9&autoconnect=true
	```

1. Open a terminal window and go to the home folder.

	```
	$ <copy>cd /home/oracle</copy>
	```

1. Modify the file *bashrc*.

	```
	$ <copy>vi ~/.bashrc</copy>
	```

1. Insert the path to the Oracle home location in the Bash profile.

	```
	<copy>cd /u01/app/oracle/product/21.0.0/dbhome_1</copy>
	```

1. Save the file `bashrc`.

	### Restart noVNC

	To restart the noVNC environment from the instance terminal:

	```
	$ <copy>sudo systemctl restart vncserver_$(whoami)@\:1</copy>
	```

Completed till 1:04:43


### Change host name from instance

Ensure to disconnect VPN before proceeding.

1. Log in to the instance server using putty.

2. Run these commands.

First time change user to root:

sudo su - || (sudo sed -i -e 's|root:x:0:0:root:/root:.*$|root:x:0:0:root:/root:/bin/bash|g' /etc/passwd && sudo su -)

Subsequent times change to root:
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


</if>

## Learn more

- [Setup Graphical Remote Desktop](https://oracle.github.io/learning-library/sample-livelabs-templates/create-labs/labs/workshops/compute/)

- [Create Custom OCI Compute Image for Marketplace Publishing](https://oracle.github.io/learning-library/sample-livelabs-templates/create-labs/labs/workshops/compute/?lab=7-labs-create-custom-image-for-marketplace)

## Acknowledgments

 - **Author** - ♏🅰️♑❗💲♓ Team Database UAD
 - **Last Updated on** - April 2, (Sun) 2023
 - **Questions/Feedback?** - Blame [manish.garodia@oracle.com](./../../../intro/files/email.md)
