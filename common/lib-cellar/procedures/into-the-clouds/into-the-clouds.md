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
    - Install and configure the required applications
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


		 - PAR URL for *EM image with 23ai*

			Object name - *`em135-ru22-db23ai-20240717`* - created on 17 Jul 2024 Wed, valid till 17 Aug.

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/MBFAHBTISbSJ0TdjEpv_kWMCnc99qZ8XlvVNbbPSoe_AoOpaaELCYboxkzeRhdg2/n/idrudhdwamji/b/images-for-livelabs-workshops/o/llw-hol-s01-em135-ru22-db23ai
			```

			New URL

			```
			https://idrudhdwamji.objectstorage.us-ashburn-1.oci.customer-oci.com/p/MBFAHBTISbSJ0TdjEpv_kWMCnc99qZ8XlvVNbbPSoe_AoOpaaELCYboxkzeRhdg2/n/idrudhdwamji/b/images-for-livelabs-workshops/o/llw-hol-s01-em135-ru22-db23ai
			```

			Object name - *`llw-hol-s01-em135-ru22-23ai`* - created on 1 Aug 2024 Thu, valid till 30 Aug.

			```
			https://objectstorage.us-ashburn-1.oraclecloud.com/p/1MCYwa-rWkdVKAx3cuZWg59mKWSCa5i1XT2ZLjXncOjrPxJdP8MLNZUKwZ6983y1/n/idrudhdwamji/b/images-for-livelabs-workshops/o/llw-hol-s01-em135-ru22-23ai
			```

			New URL

			```
			https://idrudhdwamji.objectstorage.us-ashburn-1.oci.customer-oci.com/p/1MCYwa-rWkdVKAx3cuZWg59mKWSCa5i1XT2ZLjXncOjrPxJdP8MLNZUKwZ6983y1/n/idrudhdwamji/b/images-for-livelabs-workshops/o/llw-hol-s01-em135-ru22-23ai
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

## Manage the tenancy

After logging in to your tenancy, you can do various administrative activities, such as:

1. Access the Object Storage
2. Export a custom image
3. Delete an image
4. Move resources between compartments
5. Edit an instance name
6. Terminate an instance
7. Increase the boot volume of an instance
8. Extend the partition

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

	----
	## 7. To increase the boot volume of an instance

	1. Click the hamburger (sandwich bars) and go to **Compute** &gt; **Instances**.   
	   Check if the compartment is correct.

	1. On the Instances page, click the *instance name* for which you want to increase the boot volume.

	1. Under **Resources** on the left, open **Boot volume**.

	1. Click the **Boot volume name** &gt; **Edit**.

	1. Increase the **Volume Size** (in GB), for example *64* GB.

	1. Click **Save Changes**.

	> **Note**: Increasing the boot volume of an instance does not affect the volume size of the existing custom image. For the custom image to have the new (increased) boot volume, create the image again.

	After you increase the boot volume, extend the partition and let the system identify the new volume size. 

	----
	## 8. Extend the partition

	Log in to the instance using an ssh client, for example PuTTY, and extend the partition -

	 - For normal volumes
	 <if type="hidden">- For logical volumes (LVMs)</if>

	> **Note**: If you log in as *opc*, then run the commands with *`sudo`*. If you log in as *`root`*, drop `sudo`.

	### **For normal volumes**

	 - Rescan the disk.
	 - Extend the partition.

	1. Rescan the disk.

		<ins>Syntax</ins>

		```
		$ sudo dd iflag=direct if=/dev/<device_name> of=/dev/null count=1
		echo "1" | sudo tee /sys/class/block/<device_name>/device/rescan
		```

		<ins>Example</ins>

		```
		$ <copy>
		sudo dd iflag=direct if=/dev/oracleoci/oraclevda of=/dev/null count=1
		echo "1" | sudo tee /sys/class/block/`readlink /dev/oracleoci/oraclevda | cut -d'/' -f 2`/device/rescan
		</copy>
		```

	1. Extend the root partition.

		Run the `oci-growfs` utility with the *y* option to automatically select `yes` for all prompts.

		```
		$ <copy>sudo /usr/libexec/oci-growfs -y</copy>
		```

		<if type="hidden">

		Running this command on a logical volume fails with an error.

		```
		Partition findmnt: does not exist.
		An unexpected error occurred: 'type'
		Stack (most recent call last):
		  File "/usr/lib/python3.6/site-packages/oci_utils/impl/__init__.py", line 65, in _oci_utils_exception_hook
			logging.getLogger('oci-utils').critical('An unexpected error occurred: %s', str(value), stack_info=True)
		```

	### **For logical volumes (LVMs)**

	1. Create a partition and a physical volume. 
	1. Use the additional volume as one of the following - 
		- **Option 1**: Add physical volume to a separate volume group
		- **Option 2**: Extend logical volume of an existing volume group

		## Create a partition and a physical volume

		1. Check details of existing block devices.

			```
			$ <copy>lsblk</copy>
			```
			```
			lsblk: /proc/self/mountinfo: parse error at line 43 -- ignored
			NAME               MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
			sda                  8:0    0  256G  0 disk
			├─sda1               8:1    0  100M  0 part /boot/efi
			├─sda2               8:2    0    1G  0 part /boot
			└─sda3               8:3    0 45.5G  0 part
			  ├─ocivolume-root 252:0    0 35.5G  0 lvm  /
			  └─ocivolume-oled 252:1    0   10G  0 lvm  /var/oled
			```

		1. Run to the *fdisk* utility.

			```
			$ <copy>fdisk /dev/sda</copy>
			```
			```
			Welcome to fdisk (util-linux 2.32.1).
			Changes will remain in memory only, until you decide to write them.
			Be careful before using the write command.

			GPT PMBR size mismatch (97727283 != 536870911) will be corrected by write.
			The backup GPT table is not on the end of the device. This problem will be corrected by write.

			Command (m for help): m
			```

			## fdisk help

			```
			Help:

			  GPT
			   M   enter protective/hybrid MBR

			  Generic
			   d   delete a partition
			   F   list free unpartitioned space
			   l   list known partition types
			   n   add a new partition
			   p   print the partition table
			   t   change a partition type
			   v   verify the partition table
			   i   print information about a partition

			  Misc
			   m   print this menu
			   x   extra functionality (experts only)

			  Script
			   I   load disk layout from sfdisk script file
			   O   dump disk layout to sfdisk script file

			  Save & Exit
			   w   write table to disk and exit
			   q   quit without saving changes

			  Create a new label
			   g   create a new empty GPT partition table
			   G   create a new empty SGI (IRIX) partition table
			   o   create a new empty DOS partition table
			   s   create a new empty Sun partition table


			Command (m for help):
			``` 

		1. In fdisk, manage the partitions.

			- Press *n* to add a new partion. Enter a partition number or press Enter to use the default. Here, 1, 2, and 3 are already in use.

				Press Enter for First sector and Last sector options.

				```
				Command (m for help): n

				Partition number (4-128, default 4): 
				First sector (97726464-536870878, default 97726464): 
				Last sector, +sectors or +size{K,M,G,T,P} (97726464-536870878, default 536870878): 

				Created a new partition 4 of type 'Linux filesystem' and of size 209.4 GiB.
				```

				It creates a new partition *4* of type `Linux filesystem`.

			-  Press *t* to change the partition type. Enter the partition number or press Enter to use the default. Enter *31* for partition type `Lunix LVM`. 

				```
				Command (m for help): t

				Partition number (1-4, default 4): 
				Partition type (type L to list all types): 31

				Changed type of partition 'Linux filesystem' to 'Linux LVM'.
				```

				You can check the list of partition types using the *L* command.

			- Press *p* to check the partition table. 

				```
				Command (m for help): p

				Disk /dev/sda: 256 GiB, 274877906944 bytes, 536870912 sectors
				Units: sectors of 1 * 512 = 512 bytes
				Sector size (logical/physical): 512 bytes / 4096 bytes
				I/O size (minimum/optimal): 4096 bytes / 1048576 bytes
				Disklabel type: gpt
				Disk identifier: A8EDFC93-F340-4EA1-A0FF-A579088864BF

				Device        Start       End   Sectors   Size Type
				/dev/sda1      2048    206847    204800   100M EFI System
				/dev/sda2    206848   2303999   2097152     1G Linux filesystem
				/dev/sda3   2304000  97726463  95422464  45.5G Linux LVM
				/dev/sda4  97726464 536870878 439144415 209.4G Linux LVM
				```

			- Press *w* to save the changes and exit fdisk. 

				```
				Command (m for help): w
				The partition table has been altered.
				Syncing disks.
				```

		1. Create a physical volume, *`/dev/sda4`*.

			```
			$ <copy>pvcreate /dev/sda4</copy>

			  Physical volume "/dev/sda4" successfully created.
			```

			Verify the physical volumes. 

			```
			$ <copy>pvs</copy>
			```

			Notice that the new physical volume, *`/dev/sda4`*, does not belong to any volume group. 

			```
			  PV         VG        Fmt  Attr PSize   PFree  
			  /dev/sda3  ocivolume lvm2 a--   45.50g      0 
			  /dev/sda4            lvm2 ---  209.40g 209.40g
			```

			You can now add this new physical volume to a separate volume group or extend an existing logical volume. 

		## **Option 1**: Add physical volume to a separate volume group - *u02*

		- Create a volume group and add the physical volume.
		- Create a logical volume in the new volume group and allocate some size.
		- Create an `ext4` file system.
		- Create a directory in root and mount it on the logical volume.

		1. Create a new volume group, *`ocivolume1`*, and add the physical volume, *`/dev/sda4`*, to that group. 

			```
			$ <copy>vgcreate ocivolume1 /dev/sda4</copy>
			```
			```
			  Couldn't create temporary text file name.
			  Backup of volume group ocivolume1 metadata failed.
			  Volume group "ocivolume1" successfully created
			```

			Verify the physical volumes. 

			```
			$ <copy>pvs</copy>
			```

			The new physical volume, *`/dev/sda4`*, is now added to the new volume group, *`ocivolume1`*.

			```
			  PV         VG         Fmt  Attr PSize    PFree   
			  /dev/sda3  ocivolume  lvm2 a--    45.50g       0 
			  /dev/sda4  ocivolume1 lvm2 a--  <253.40g <253.40g
			```

		1. View the existing volume groups. 

			```
			$ <copy>lvs</copy>
			```

			Notice that it does not display the new volume group, *`ocivolume1`*. This is because the new volume group does not contain any logical volumes or any mounted file system.

			```
			  LV   VG        Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
			  oled ocivolume -wi-ao---- 10.00g                                                    
			  root ocivolume -wi-ao---- 35.50g                                                
			```

			Check the details of the existing volume group, *`ocivolume`*. 

			```
			$ <copy>lvdisplay ocivolume</copy>
			```
			```
			  --- Logical volume ---
			  LV Path                /dev/ocivolume/oled
			  LV Name                oled
			  VG Name                ocivolume
			  LV UUID                jySzgj-lfYt-GWsd-PpB8-8eX2-X9NL-w0YaB5
			  LV Write Access        read/write
			  LV Creation host, time localhost.localdomain, 2024-06-14 01:19:49 +0000
			  LV Status              available
			  # open                 1
			  LV Size                10.00 GiB
			  Current LE             2560
			  Segments               1
			  Allocation             inherit
			  Read ahead sectors     auto
			  - currently set to     4096
			  Block device           252:1
			   
			  --- Logical volume ---
			  LV Path                /dev/ocivolume/root
			  LV Name                root
			  VG Name                ocivolume
			  LV UUID                fULxDl-ZN2u-Cc6j-O72w-qUTe-QyTs-Pw4CIg
			  LV Write Access        read/write
			  LV Creation host, time localhost.localdomain, 2024-06-14 01:19:52 +0000
			  LV Status              available
			  # open                 1
			  LV Size                35.50 GiB
			  Current LE             9088
			  Segments               1
			  Allocation             inherit
			  Read ahead sectors     auto
			  - currently set to     4096
			  Block device           252:0
			```

			Check the new volume group, *`ocivolume`*. It does not display any information. 

			```
			$ <copy>lvdisplay ocivolume1</copy>
			$
			```

		1. Create a new logical volume, *`u02`*, in the volume group, *`ocivolume1`*. Allocate some size, *`200G`*, to the logical volume. 

			```
			$ <copy>lvcreate -n u02 --size 200G ocivolume1</copy>
			```

			If the boot volume is full (100% used), the command fails with an error. 

			```
			  Couldn't create temporary archive name.
			```

			To fix this: 
			- Go to root *`cd /`*
			- Check disk usage *`du -sh *`*
			- Clean up some space, delete stuff *`rm -f *`* under - 
				- `/var/oled/pcp/pmlogger/<hostname>/`
				- `/var/cache/PackageKit/8.10/metadata`

			Now, try creating the logical volume again. 

			```
			$ <copy>lvcreate -n u02 --size 200G ocivolume1</copy>

			  Logical volume "u02" created.
			```

		1. Create a new *`ext4`* file system (partition).

			```
			$ <copy>mkfs.ext4 /dev/ocivolume1/u02</copy>
			```
			```
			mke2fs 1.46.2 (28-Feb-2021)
			Discarding device blocks: done                            
			Creating filesystem with 52428800 4k blocks and 13107200 inodes
			Filesystem UUID: 33259805-ae80-4bb1-b96a-5d528de70bad
			Superblock backups stored on blocks: 
				32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
				4096000, 7962624, 11239424, 20480000, 23887872

			Allocating group tables: done                            
			Writing inode tables: done                            
			Creating journal (262144 blocks): done
			Writing superblocks and filesystem accounting information: done     
			```

		1. Create a directory, *`/u02`*, under root.

			```
			$ <copy>mkdir /u02</copy>
			```

		1. Mount the directory, *`/u02`*, on the logical volume, *`u02`*. 

			```
			$ mount /dev/ocivolume1/u02 /u02
			```

			Check that the system displays information about the new logical volume, *`u02`*. 

			```
			$ vi /etc/fstab 
			```
			```
			$ ls /dev/mapper/

			control         ocivolume1-u02  ocivolume-oled  ocivolume-root  
			```

			If found errors, unmount the directory, *`/u02`*, from the logical volume, *`u02`*. 

			```
			$ umount /u02
			```

			Go to root and mount again.

			```
			$ cd

			$ mount -a

			mount: /proc/self/mountinfo: parse error at line 43 -- ignored
			mount: (hint) your fstab has been modified, but systemd still uses
				   the old version; use 'systemctl daemon-reload' to reload.
			```

			Use this command to mount the volumes. 

			```
			$ <copy>mount</copy>
			```

			 - 

				## Output 

				```
				mount: /proc/self/mountinfo: parse error at line 43 -- ignored
				sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime,seclabel)
				proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
				devtmpfs on /dev type devtmpfs (rw,nosuid,seclabel,size=16235944k,nr_inodes=4058986,mode=755,inode64)
				securityfs on /sys/kernel/security type securityfs (rw,nosuid,nodev,noexec,relatime)
				tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev,noexec,seclabel,inode64)
				devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,seclabel,gid=5,mode=620,ptmxmode=000)
				tmpfs on /run type tmpfs (rw,nosuid,nodev,seclabel,mode=755,inode64)
				tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,seclabel,mode=755,inode64)
				cgroup on /sys/fs/cgroup/systemd type cgroup (rw,nosuid,nodev,noexec,relatime,seclabel,xattr,release_agent=/usr/lib/systemd/systemd-cgroups-agent,name=systemd)
				pstore on /sys/fs/pstore type pstore (rw,nosuid,nodev,noexec,relatime,seclabel)
				efivarfs on /sys/firmware/efi/efivars type efivarfs (rw,nosuid,nodev,noexec,relatime)
				bpf on /sys/fs/bpf type bpf (rw,nosuid,nodev,noexec,relatime,mode=700)
				cgroup on /sys/fs/cgroup/rdma type cgroup (rw,nosuid,nodev,noexec,relatime,seclabel,rdma)
				cgroup on /sys/fs/cgroup/blkio type cgroup (rw,nosuid,nodev,noexec,relatime,seclabel,blkio)
				cgroup on /sys/fs/cgroup/pids type cgroup (rw,nosuid,nodev,noexec,relatime,seclabel,pids)
				cgroup on /sys/fs/cgroup/perf_event type cgroup (rw,nosuid,nodev,noexec,relatime,seclabel,perf_event)
				cgroup on /sys/fs/cgroup/freezer type cgroup (rw,nosuid,nodev,noexec,relatime,seclabel,freezer)
				cgroup on /sys/fs/cgroup/memory type cgroup (rw,nosuid,nodev,noexec,relatime,seclabel,memory)
				cgroup on /sys/fs/cgroup/cpuset type cgroup (rw,nosuid,nodev,noexec,relatime,seclabel,cpuset)
				cgroup on /sys/fs/cgroup/cpu,cpuacct type cgroup (rw,nosuid,nodev,noexec,relatime,seclabel,cpu,cpuacct)
				cgroup on /sys/fs/cgroup/net_cls,net_prio type cgroup (rw,nosuid,nodev,noexec,relatime,seclabel,net_cls,net_prio)
				cgroup on /sys/fs/cgroup/misc type cgroup (rw,nosuid,nodev,noexec,relatime,seclabel,misc)
				cgroup on /sys/fs/cgroup/hugetlb type cgroup (rw,nosuid,nodev,noexec,relatime,seclabel,hugetlb)
				cgroup on /sys/fs/cgroup/devices type cgroup (rw,nosuid,nodev,noexec,relatime,seclabel,devices)
				none on /sys/kernel/tracing type tracefs (rw,relatime,seclabel)
				configfs on /sys/kernel/config type configfs (rw,relatime)
				/dev/mapper/ocivolume-root on / type xfs (rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,noquota)
				rpc_pipefs on /var/lib/nfs/rpc_pipefs type rpc_pipefs (rw,relatime)
				selinuxfs on /sys/fs/selinux type selinuxfs (rw,relatime)
				debugfs on /sys/kernel/debug type debugfs (rw,relatime,seclabel)
				systemd-1 on /proc/sys/fs/binfmt_misc type autofs (rw,relatime,fd=38,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=17979)
				hugetlbfs on /dev/hugepages type hugetlbfs (rw,relatime,seclabel,pagesize=2M)
				mqueue on /dev/mqueue type mqueue (rw,relatime,seclabel)
				binfmt_misc on /proc/sys/fs/binfmt_misc type binfmt_misc (rw,relatime)
				fusectl on /sys/fs/fuse/connections type fusectl (rw,relatime)
				/dev/mapper/ocivolume-oled on /var/oled type xfs (rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,noquota)
				/dev/sda2 on /boot type xfs (rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,noquota)
				/dev/sda1 on /boot/efi type vfat (rw,relatime,fmask=0077,dmask=0077,codepage=437,iocharset=ascii,shortname=winnt,errors=remount-ro)
				tmpfs on /run/user/54321 type tmpfs (rw,nosuid,nodev,relatime,seclabel,size=3256748k,mode=700,uid=54321,gid=54321,inode64)
				gvfsd-fuse on /run/user/54321/gvfs type fuse.gvfsd-fuse (rw,nosuid,nodev,relatime,user_id=54321,group_id=54321)
				tracefs on /sys/kernel/debug/tracing type tracefs (rw,relatime,seclabel)
				cgroupfs on /var/lib/oracle/ORA_orcl_bda7066c/bpf/cgroup type cgroup2 (rw,relatime,seclabel)
				tmpfs on /run/user/986 type tmpfs (rw,nosuid,nodev,relatime,seclabel,size=3256748k,mode=700,uid=986,gid=984,inode64)
				/dev/sda2 on /mnt type xfs (rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,noquota)
				tmpfs on /run/user/1000 type tmpfs (rw,nosuid,nodev,relatime,seclabel,size=3256748k,mode=700,uid=1000,gid=1000,inode64)
				/dev/mapper/ocivolume1-u02 on /u02 type ext4 (rw,relatime,seclabel,stripe=256)
				```

		1. Verify that the system identifies the new logical volume in the root partition.

			- Check details of the block devices.

				```
				$ <copy>lsblk</copy>
				```
				```
				lsblk: /proc/self/mountinfo: parse error at line 43 -- ignored
				NAME               MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
				sda                  8:0    0   300G  0 disk 
				├─sda1               8:1    0   100M  0 part /boot/efi
				├─sda2               8:2    0     1G  0 part /mnt
				├─sda3               8:3    0  45.5G  0 part 
				│ ├─ocivolume-root 252:0    0  35.5G  0 lvm  /
				│ └─ocivolume-oled 252:1    0    10G  0 lvm  /var/oled
				└─sda4               8:4    0 253.4G  0 part 
				  └─ocivolume1-u02 252:2    0   200G  0 lvm  /u02
				```

			- Check the disk space usage details. 

				```
				$ <copy>df -h</copy>
				```
				```
				Filesystem                  Size  Used Avail Use% Mounted on
				devtmpfs                     16G     0   16G   0% /dev
				tmpfs                        16G     0   16G   0% /dev/shm
				tmpfs                        16G  1.6G   14G  11% /run
				tmpfs                        16G     0   16G   0% /sys/fs/cgroup
				/dev/mapper/ocivolume-root   36G   35G  1.1G  98% /
				/dev/mapper/ocivolume-oled   10G   10G   60K 100% /var/oled
				/dev/sda2                  1014M  445M  570M  44% /mnt
				/dev/sda1                   100M  6.0M   94M   6% /boot/efi
				tmpfs                       3.2G   36K  3.2G   1% /run/user/54321
				tmpfs                       3.2G  4.0K  3.2G   1% /run/user/986
				tmpfs                       3.2G  4.0K  3.2G   1% /run/user/1000
				/dev/mapper/ocivolume1-u02  196G   28K  186G   1% /u02
				```

			- Check the logical volumes. 

				```
				$ <copy>lvs</copy>
				```
				```
				  LV   VG         Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
				  oled ocivolume  -wi-ao----  10.00g                                                    
				  root ocivolume  -wi-ao----  35.50g                                                    
				  u02  ocivolume1 -wi-ao---- 200.00g                                                    
				```
			- List details of your partition

				```
				fdisk -l
				```
				```
				Disk /dev/sda: 300 GiB, 322122547200 bytes, 629145600 sectors
				Units: sectors of 1 * 512 = 512 bytes
				Sector size (logical/physical): 512 bytes / 4096 bytes
				I/O size (minimum/optimal): 4096 bytes / 1048576 bytes
				Disklabel type: gpt
				Disk identifier: A8EDFC93-F340-4EA1-A0FF-A579088864BF

				Device        Start       End   Sectors   Size Type
				/dev/sda1      2048    206847    204800   100M EFI System
				/dev/sda2    206848   2303999   2097152     1G Linux filesystem
				/dev/sda3   2304000  97726463  95422464  45.5G Linux LVM
				/dev/sda4  97726464 629145566 531419103 253.4G Linux LVM


				Disk /dev/mapper/ocivolume-root: 35.5 GiB, 38117834752 bytes, 74448896 sectors
				Units: sectors of 1 * 512 = 512 bytes
				Sector size (logical/physical): 512 bytes / 4096 bytes
				I/O size (minimum/optimal): 4096 bytes / 1048576 bytes


				Disk /dev/mapper/ocivolume-oled: 10 GiB, 10737418240 bytes, 20971520 sectors
				Units: sectors of 1 * 512 = 512 bytes
				Sector size (logical/physical): 512 bytes / 4096 bytes
				I/O size (minimum/optimal): 4096 bytes / 1048576 bytes


				Disk /dev/mapper/ocivolume1-u02: 200 GiB, 214748364800 bytes, 419430400 sectors
				Units: sectors of 1 * 512 = 512 bytes
				Sector size (logical/physical): 512 bytes / 4096 bytes
				I/O size (minimum/optimal): 4096 bytes / 1048576 bytes
				```

		You have successfully created a new volume group in your boot volume. 

		## **Option 2**: Extend logical volume of an existing volume group - *u01*

		- Extend existing volume group and add the physical volume.
		- Extend the logical root volume in the volume group and allocate some size.
		- Increase the size of the file system 

		1. Extend the volume group, *`ocivolume`*, and add the physical volume, *`/dev/sda4`*, to that group. 

			```
			$ <copy>vgextend ocivolume /dev/sda4</copy>

			  Volume group "ocivolume" successfully extended
			```

			Verify the physical volumes. 

			```
			$ <copy>pvs</copy>
			```

			The new physical volume, *`/dev/sda4`*, is now added to the existing volume group, *`ocivolume`*.

			```
			  PV         VG        Fmt  Attr PSize    PFree   
			  /dev/sda3  ocivolume lvm2 a--    45.50g       0 
			  /dev/sda4  ocivolume lvm2 a--  <209.40g <209.40g
			```

		1.	Check the details of the existing volume group, *`ocivolume`*.

			```
			$ <copy>vgdisplay ocivolume</copy>
			```

			Notice that the volume size includes the new physical volume. 

			```
			  --- Volume group ---
			  VG Name               ocivolume
			  System ID             
			  Format                lvm2
			  Metadata Areas        2
			  Metadata Sequence No  20
			  VG Access             read/write
			  VG Status             resizable
			  MAX LV                0
			  Cur LV                2
			  Open LV               2
			  Max PV                0
			  Cur PV                2
			  Act PV                2
			  VG Size               <254.90 GiB
			  PE Size               4.00 MiB
			  Total PE              65254
			  Alloc PE / Size       11648 / 45.50 GiB
			  Free  PE / Size       53606 / <209.40 GiB
			  VG UUID               JqVozX-70KC-bp4l-fQBZ-p0u3-oQOo-iFBsmj   
			```

		1. Extend the logical root volume in the volume group. Allocate some size, *`100G`*, to the logical volume. 

			```
			$ <copy>lvextend -L +100G /dev/ocivolume/root</copy>
			```
			``` 
			  Size of logical volume ocivolume/root changed from 35.50 GiB (9088 extents) to 135.50 GiB (34688 extents).
			  Logical volume ocivolume/root successfully resized.
			```

			To use the entire free space in the volume group and add it to the logical volume:

			```
			# <copy>lvextend -l +100%FREE /dev/ocivolume/root</copy>

			  Extending logical volume ocivolume/root to 257.53 GiB
			  Logical volume ocivolume/root successfully resized
			```

			Check the disk space usage details.

			```
			$ <copy>df -h</copy>
			```
			```
			Filesystem                  Size  Used Avail Use% Mounted on
			devtmpfs                     16G     0   16G   0% /dev
			tmpfs                        16G     0   16G   0% /dev/shm
			tmpfs                        16G  9.4M   16G   1% /run
			tmpfs                        16G     0   16G   0% /sys/fs/cgroup
			/dev/mapper/ocivolume-root   36G   31G  5.4G  86% /
			/dev/sda2                  1014M  445M  570M  44% /boot
			/dev/sda1                   100M  6.0M   94M   6% /boot/efi
			/dev/mapper/ocivolume-oled   10G  216M  9.8G   3% /var/oled
			tmpfs                       3.2G  4.0K  3.2G   1% /run/user/986
			tmpfs                       3.2G   28K  3.2G   1% /run/user/54321
			```

		1. Increase the size of the file system (root partition).

			```
			$ <copy>xfs_growfs /</copy>
			```			
			```
			meta-data=/dev/mapper/ocivolume-root isize=512    agcount=4, agsize=2326528 blks
					 =                       sectsz=512   attr=2, projid32bit=1
					 =                       crc=1        finobt=1, sparse=1, rmapbt=0
					 =                       reflink=1    bigtime=0 inobtcount=0
			data     =                       bsize=4096   blocks=9306112, imaxpct=25
					 =                       sunit=0      swidth=0 blks
			naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
			log      =internal log           bsize=4096   blocks=4544, version=2
					 =                       sectsz=512   sunit=0 blks, lazy-count=1
			realtime =none                   extsz=4096   blocks=0, rtextents=0
			data blocks changed from 9306112 to 35520512
			```

		1. Verify that the system identifies the new size of the root partition.

			```
			$ <copy>lsblk</copy>
			```			
			```
			NAME               MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
			sda                  8:0    0   256G  0 disk 
			├─sda1               8:1    0   100M  0 part /boot/efi
			├─sda2               8:2    0     1G  0 part /boot
			├─sda3               8:3    0  45.5G  0 part 
			│ ├─ocivolume-root 252:0    0 135.5G  0 lvm  /
			│ └─ocivolume-oled 252:1    0    10G  0 lvm  /var/oled
			└─sda4               8:4    0 209.4G  0 part 
			  └─ocivolume-root 252:0    0 135.5G  0 lvm  /
			```

			Check the disk space usage details.

			```
			$ <copy>df -h</copy>
			```
			```
			Filesystem                  Size  Used Avail Use% Mounted on
			devtmpfs                     16G     0   16G   0% /dev
			tmpfs                        16G     0   16G   0% /dev/shm
			tmpfs                        16G  9.4M   16G   1% /run
			tmpfs                        16G     0   16G   0% /sys/fs/cgroup
			/dev/mapper/ocivolume-root  136G   31G  105G  23% /
			/dev/sda2                  1014M  445M  570M  44% /boot
			/dev/sda1                   100M  6.0M   94M   6% /boot/efi
			/dev/mapper/ocivolume-oled   10G  216M  9.8G   3% /var/oled
			tmpfs                       3.2G  4.0K  3.2G   1% /run/user/986
			tmpfs                       3.2G   28K  3.2G   1% /run/user/54321
			```

		You have successfully extended the existing logical volume (root partition) of your boot volume.

		## Remove logical volume and delete partition

		To delete a partition, first delete the logical volume and remove the physical volume from the volume group. 

		1. Start with removing the logical volume.

			```
			$ lvremove <logical-volume-name>
			```

			Alternatively, remove the volume group. It also removes the logical volumes in the group.

			```
			$ vgremove <volume-group-name>
			```
			```
			Do you really want to remove volume group "<volume-group-name>" containing 1 logical volumes? [y/n]: y
			Do you really want to remove active logical volume <volume-group-name>/<logical-volume-name>? [y/n]: y
			  Logical volume "<logical-volume-name>" successfully removed.
			  Volume group "<volume-group-name>" successfully removed
			```

		1. Check the physical volumes does not display the volume group anymore.

			```
			$ pvs
			```
			```
			  PV         VG        Fmt  Attr PSize   PFree
			  /dev/sda3  vol-grp lvm2 a--   45.50g      0
			  /dev/sda4            lvm2 ---  213.40g 213.40g
			```

		You can now delete the partition using fdisk.

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

- [Setup Graphical Remote Desktop](https://oracle-livelabs.github.io/common/sample-livelabs-templates/create-labs/labs/workshops/compute/)

- [Create Custom OCI Compute Image for Marketplace Publishing](https://oracle-livelabs.github.io/common/sample-livelabs-templates/create-labs/labs/workshops/compute/?lab=7-labs-create-custom-image-for-marketplace)

## Acknowledgments

 - **Author** - [](include:author)
 - **Created on** - January 13, (Thu) 2022
 - **Last Updated on** - April 2, (Sun) 2023
 - **Questions/Feedback?** - Blame [](include:profile)
