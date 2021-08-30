## Start Enterprise Manager Cloud Control (EMCC)

This lab illustrates how to log in to Enterprise Manager Cloud Control and set the homepage. The homepage you select will be the default landing page whenever you log in to EMCC. 

Estimated Lab Time: 5 minutes

### What You Need?

- Oracle Database 21c installed

- Enterprise Manager Cloud Control 13.5 configured

## **STEP 1**: Login to EMCC and set the homepage

1. In a web browser, enter the URL for Enterprise Manager Cloud Control: https://hostname:portnumber/em.  
	The URL for EMCC comprises the hostname of your machine and the port number. The default port number for EMCC is *7803*. 
	
	<!-- Added explanation for hostname and the default port for EMCC, 7803. The URL for EMCC depends on the VM for the LiveLabs. Shall specify the actual URL after the VM is configured. -->

   ![Image alt text](images/emcc_start_001_url.png)

	**Note**: If you get a security certificate warning, ignore the error. Depending on your web browser, click on *Advanced* or *More Information* and continue to the login page.

2. Provide the following credentials to log in as an authorized user account.  
	**Username** - *SYSMAN* (not case sensitive)  
	**Password** - Enter the password.

   ![Image alt text](images/emcc_start_002_login.png)

3. On the License Agreement page click on **I Accept** to confirm your compliance and continue. 

   ![Image alt text](images/emcc_start_003_license.png)

4. The screen lands on the Welcome homepage indicating that the login is successful. You can select the homepage for Enterprise Manager from the given options. Your personal homepage will appear the next time you log in. 

   ![Image alt text](images/emcc_start_004_home.png)


<!--At the conclusion of the lab add this statement:-->
You may proceed to the next lab.

## Acknowledgements

- **Created by/Date**: Manish Garodia, Principal User Assistance Developer, June 2021

- **Contributors**: Suresh Rajan (Senior Manager, User Assistance Development)

- **Last Updated By/Date**: Manish Garodia, July 2021

## See an issue?

Submit feedback using this [form](https://apexapps.oracle.com/pls/apex/f?p=133:1:::::P1_FEEDBACK:1). Select the *workshop name*, *lab details*, and *step* in your request.  If you don't see the workshop name in the list, enter it manually. If you would like us to follow-up with you, enter your email in the *Feedback Comments* section.
