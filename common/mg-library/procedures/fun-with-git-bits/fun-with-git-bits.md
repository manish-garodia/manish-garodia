# ![GitHub](./../../../images/git-black-small.png) &nbsp;Fun with Git-Bits

## The fork, the clone, the OLL master

The information in this lab revolves around - 

### ![GitHub](./../../../images/git-black-small.png) &nbsp;&nbsp;&nbsp;&nbsp;GitHub 

### ![GitHub Desktop](./../../../images/github-desktop-small.png) &nbsp;&nbsp;&nbsp;&nbsp;GitHub Desktop

### ![Git Bash](./../../../images/git-bash-small.png) &nbsp;&nbsp;&nbsp;&nbsp;Git Bash 

## Learn about git

- Basic concepts
- Do's and Don'ts
- A few good practices
- *Fetch* vs *Pull*

	----
	## Basic concepts

	The fork creates a copy of the entire Oracle learning-library (OLL) master repository into our GitHub (GH) account. 
	 - Cannot fork a single (or a specific) folder from OLL. In GH, it works as a repository.
	 - Cannot create multiple forks from OLL. 

	Creating a new fork opens the existing repository from our GH account, which is already forked.

	- **Head repository** - where to get data from
	- **Base repository** - where to push data to

	Merge pull request to update the fork from the latest changes in OLL. Fetch origin from Git Desktop and bring the clone up-to-date.

	If we use a file from another location outside the workshop and the file gets modified, for example a lab from the common library, GH automatically updates that file in our workshop. No action required from our side. The turnaround time to approve pull requests may vary, from 2 days to a week or more. 

	If you submit a pull request from the fork to OLL, the labs will not show up on LiveLabs immediately. The admin (Livelabs reviewers) will review the submissions on OLL, creates the required pages, and finally makes them available on the LiveLabs application.

	- All interactions between the clone and the fork can take place using either one of these.
		- *GitHub Desktop*
		- *Git GUI* 
		- *Git Bash*

	 For example, create a clone from the fork, update the clone from the fork, push the clone to fork, and so on.

	- All interactions between the fork and OLL takes places on the GH page (through a web browser).

		> **Note**: To view the details of a file, such as date/timestamp or last modified by, use the GH page.

	### Preview a lab

	**A. View a lab or workshop from the fork**

	```
	<fork>.github.io/<filepath>/filename
	```

	#### Prerequisites

	1. From the fork repo, go to **Settings** > **GitHub pages**. 
	2. Under **Source**, select **Branch master** > */root*.

		It may take ~30-60 mins to publish the site/repo and show-up the preview.

	**B. View html preview of the workshop in OLL**

	```
	oracle.github.io/<path to index.html>
	```

	### Recommendations for working on LiveLabs

	#### Option A: New repo

	1.  Create a new repo: 2-day DBA.
	2.  Add all team members as contributors.
	3.  Create clones of this repo and all members work independently.
	4.  When the entire workshop is ready any one create a fork, keep all files at one place, and push the fork altogether to OLL.

	Ensure to pull from this repo every time someone modifies any file to avoid conflicts.

	#### Option B: Clone from a common fork

	1.  One person to create a fork repo of OLL and add others as contributors to that fork.
	2.  Everyone else clone from the common fork.
	3.  Work independently on respective clones and push to the fork.
	4.  The creator updates the fork and finally sends pull request from the fork to merge with OLL.

	----
	## Do's and Don'ts

	 Do not do 'pull origin' to update the fork every day.

	 Do not submit pull requests from fork to OLL every day, else the moderators/admins would reject.

	 Push to OLL only on completion of a lab/md/file(s) or ready for release.

	----
	## A few good practices

	1. You must keep your fork and clone updated with Oracle learning-library, even though you are not actively working on your workshop or your workshop has no modifications. 

	1. If you do not update your clone and fork for a long time and the number of commit changes with OLL master is significantly high, you may find conflicts while merging or submitting a pull request. Then you may need to delete your fork and your clone, and then redo like afresh. 

		> Update the fork first before pushing the changes from clone to fork and then pull request from fork to OLL. This step ensures other person's changes are also merged.   
	*GH does not allow such pull requests, which creates conflicts*.

	1. Update the fork if someone else modifies a file in-progress.

	1. If more than one person is working on the same lab, they must keep their fork updated to avoid conflicts.

	1. If your fork repo is <ins>old</ins> (not updated), and the clone is <ins>in sync</ins> (up-to-date) with the fork, then `merge upstream/master` will not show any changes. If you try to merge with `upstream/master`, it will show that - <i>your branch is up-to-date</i>. In reality, both clone and fork are <ins>behind</ins> OLL master. 

		> **Note:** Always fetch origin (or fetch upstream) to update the fork from `upstream/master` and then try to `merge upstream`. 

	1. If you modify an older version of a file, GH returns a conflict error on pull request. In such case, update the fork and clone, make changes your file, and submit the pull request again.

	1. When you submit a PR to OLL master, any further merging from your Github account is blocked. Until a code owner reviews and approves the PR, you cannot submit another PR in parallel.  

		> **Note:** After submitting the PR if you make changes to any files, you can still commit to master and submit a *merge request* instead. 

	1. Create a fork from the GH page and create a clone of fork from Git Desktop. If it takes longer, disconnect VPN and try creating the clone again.

	1. If a lab is in development and a writer wants to initiate a review, do it from the fork, not from OLL. 

	----
	## **Fetch** vs **Pull**

	| git fetch | git pull |
	|-----------|----------|
	| Tells your clone to get the meta-data information from OLL master. It checks if any updates are available but does not do any file transfer. |  Not only does a check for updates but also brings down all changes from OLL master to the clone. |

	In short, the *git pull* command does a *git fetch* followed by a *git merge*. 

## Get along with GitHub Desktop

1. Go to **File** > **Options**.
1. The **Accounts** tab shows that you are logged in to your GitHub account. 

Now, to update your fork repo and the clone you have:
- <font style="color:rgb(112,173,71);">**Option 1** - from **Fork**, *fetch* OLL master and then in Github Desktop *pull origin* to **Clone**</font>
- <font style="color:rgb(91,155,213);">**Option 2** - from **Clone**, *merge* with OLL master in GitHub Desktop and then *push origin* to **Fork**</font>

	![Update fork and clone](./../../../images/update-fork-clone-grey.png " ")

	----
	## Option 1: Update the fork and pull to clone (browser)

	In this method, you update your fork repo first and then pull origin to the clone.

	1. Update the fork repo from upstream master using a **browser** - *fetch and merge*
	1. Update the clone from fork using **Github Desktop** - *pull origin*

		----
		## 1. To update the fork from upstream master (browser)

		1. Log in to your Github account in a browser. 
		
		1. Go to your fork repo `<your-account>/learning-library`.   
		   The **Code** tab displays a message. 
		   
			```
			This branch is xx commits behind oracle:master.
			```

		1. Click **Fetch upstream** > **Fetch and merge**.  
		   Verify that you have <i>Successfully fetched and fast-forwarded from upstream oracle:master</i>.

			```
			This branch is even with oracle:master.
			```

		The fork repo is now updated.

		----
		## 2. To update the clone from fork (GitHub Desktop)

		1. Open **GitHub Desktop**. It displays a message.

		    ```
		    Last fetched xx time ago
		    ```

		1. Click **Fetch origin**. It displays the message.

		    ```
		    Pull xx commits from the origin remote. 
		    ```

		1. Click **Pull origin** (either one). It displays the message. 

		    ```
		    Last fetch just now.
		    ```

		The clone is now updated. 

	----
	## Option 2: Update the clone and push to fork (GitHub Desktop)
	
	Update both clone and fork together using GitHub Desktop.

	1. Open **GitHub Desktop**.

	1. From **Branch** > select **Merge into current branch**. 

	1. The default branch selected is *master*.   
	   Under Other branches, select *upstream/master*. It displays a message.

		```
		This will merge xx commits from upstream/master into master
		```

	1. Click **Create a merge commit**. It displays the message. 

	    ```
	    Successfully merged upstream/master into master
	    ```

	   This step updates the clone. 

	5. Click **Push origin**.  	
		This step updates the fork repo. 

		From **Repository** > select **View on GitHub** to open OLL master. Go to your fork repo and verify this message.

		 ```
		 This branch is not behind the upstream oracle:master.

		 No new commits to fetch. Enjoy your day!
		 ```

		## Cite source 
		[Video by Tom McGinn](https://otube.oracle.com/media/t/1_bxj0cfqf) on 30 July, 2020   
		In this video, I'll show you how to:  
		- Merge the production repo files with your fork and local clone, to ensure you have the latest/greatest files  
		- Commit changes you've made to your fork and review the changes  
		- Make a pull request

	----
	## Commit to master - from clone to fork

	To send the changes from the clone to the fork repo:

	1. Open **GitHub Desktop**.

	1. Add a *Summary* and a brief *Description*.

	1. Under **Changes**, verify that the impacted files are selected. 

	1. Click **Commit to master**. 
	
	1. Click **Push origin**.

	The changes from the local clone are pushed to the fork repo. 
	
	> **Note:** It may take a few minutes for your fork to build the Github pages. 

	## Merge the fork with OLL master (PRs)

	Want to merge your updated fork repo with OLL master? *Submit a pull request*.   
	After committing your changes to master, go to your fork repo and *create a pull request*. 
	 
	- Options to open your fork repo

		## Open your fork repo

		- **Option A: using a browser**

			1. Log in to your GitHub account in a browser.

			1. Go to your fork repo `<your-account>/learning-library`.

		- **Option B: using GitHub Desktop**

			1. Open GitHub Desktop.

			1. From **Branch** > select **Create pull request**.  
				It opens OLL master in a browser.

			1. Go to your fork repo `<your-account>/learning-library`.

			> **Note:** If you have submitted a pull request already and it is under review (waiting for approval), then you cannot create another pull request in parallel. The **Branch** menu will have an option to **Show pull request** instead. 

		## Submit pull request (PR)

		To submit a PR:
		
		1. From your fork repo, go to **Pull requests** > click **New pull request**.

			> **Note:** The page must display that you are **<i><font style="color:rgb(63,185,61);">Able to merge</font></i>** (in green). 

		1. Review your comment for the PR.
		
			> **Note:** Do not forget to mention the workshop ID in the subject line of the comment. 

		1. Click **Create pull request**.   
			It creates a merge request with a four-digit code and displays a message. 

			```
			[user] wants to merge 1 commit into oracle:master from [user]:master
			```

		Done. Your pull request is submitted for review. Wait for the approval.


## Take a plunge in Git Bash

in-progress

<if type="hidden">

## TBD from here

Common `git` commands

### change the drive
cd /d/GitHub

### navigate between folders
cd <folder_name>

### display log
git log

### git config location
~/.gitconfig

### display the contents of config file
cat ~/.gitconfig

### modify config file
vi ~/.gitconfig
more ~/.gitconfig

### set your username
git config --global user.name "FIRST_NAME LAST_NAME"

### set your email address
git config --global user.email "MY_NAME@example.com"

### add repository URL 
git remote add origin repository_URL

### initialize a local repo
git init

### display branches in the repo
git branch

### create a new branch
git branch branch_name

### Remove a branch
safe delete 

git branch -d branch_name

force delete

git branch -D branch_name

### clone repository
git clone url
git clone url custom_name

### commit full syntax

```
git commit [-a | --interactive | --patch] [-s] [-v] [-u<mode>] [--amend]
	   [--dry-run] [(-c | -C | --squash) <commit> | --fixup [(amend|reword):]<commit>)]
	   [-F <file> | -m <msg>] [--reset-author] [--allow-empty]
	   [--allow-empty-message] [--no-verify] [-e] [--author=<author>]
	   [--date=<date>] [--cleanup=<mode>] [--[no-]status]
	   [-i | -o] [--pathspec-from-file=<file> [--pathspec-file-nul]]
	   [(--trailer <token>[(=|:)<value>])…​] [-S[<keyid>]]
	   [--] [<pathspec>…​]
```

### Commit steps

### stage files for committing 

Stage the changed files in the local repo for committing 

To stage a specific file or folder

git add [file-name]

To stage all files and folders 

git add .
git add -A
git add --a
git add --all

To un-stage a file (undo staging)
git restore --staged [file]...

### display the staged files
git status

### display compact status
git status --short

Short status flags are:
?? - Untracked files
A - Files added to stage
M - Modified files
D - Deleted files

### stage and commit along
To stage the changed files and to commit them in a single step
git commit -am "commit_name"

The -a option will automatically stage every changed, already tracked file. It works good if no new files are added. If there are new additions or deletions, use git add and git commit -m separately. -am will add all files but with git add you can add individual files to the staging area. 

To open an editor and add both summary and description: 
Leave an empty line between the summary and description.

git commit (without any flags)

save the file :wq, exit without saving :q! (does not commit with an empty file)

### push changes from local repository to GitHub.
git push origin main

### display user name
git config user.name

### display configuration settings
git config --list

### undo local changes to the state of the git repo, undo git stage
git reset

### create a new clone
git clone https://github.com/<your-username>/<your-repository>

git clone https://github.com/bg-manish/northern-lights

### notepad++: select text in column mode
Keeping 'Shift' and 'Alt' pressed, use the cursor keys to select text.

### merge clone and update fork

git checkout master

git merge upstream/master

git push origin master

### undo Commit

bring back from staging, before commit push origin, without hurting any files or local changes. 

git reset HEAD~

### change commit message
git commit --amend 

git commit pull origin main

### discard the changes in working directory and update from master. All local changes will be lost
git restore 

### Others

git revert
git rm

git config --list --show-origin

git --version

git diff master origin/master 


### proxy config

git config --global --unset http.proxy

git config --global --get http.proxy
output
http://manish.garodia@oracle.com:Oracle.com@www-proxy-idc.in.oracle.com:80


git config --global http.proxy http://username:pass@proxy.com:port
git config --global http.proxy http[s]://userName:password@proxyaddress:port

git config --global http.proxy http://manish.garodia%40oracle.com:Oracle.com@www-proxy-idc.in.oracle.com:80

encode @ in username with %40

### config



### Push and Pull

git fetch origin main

### merges the files from remote repository into local repository
git pull --all

In Unix systems the end of a line is represented with a line feed (LF). In windows a line is represented with a carriage return (CR) and a line feed (LF) thus (CRLF). when you get code from git that was uploaded from a unix system they will only have an LF.

If you are a single developer working on a windows machine, and you don't care that git automatically replaces LFs to CRLFs, you can turn this warning off by typing the following in the git command line

If you want, you can deactivate this feature in your git core config using
git config core.autocrlf false

But it would be better to just get rid of the warnings using
git config core.autocrlf true


### startup

create a new repository on the command line

echo "# musical-lamp" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/bg-manish/musical-lamp.git
git push -u origin main

 Once you use git push -u origin main, from next time onwards you can use only git push without any flags. if you do git push only, then next time you use git pull you have to enter the remote repository url when git pulling

push an existing repository from the command line

git remote add origin https://github.com/bg-manish/musical-lamp.git
git branch -M main
git push -u origin main


### Update fork with - fetch and merge
Merge upstream/master

git checkout master
git merge upstream/master
Dont save the file :q!
git push origin master

Message: Merge remote-tracking branch 'upstream/master'

</if>

## Tricks up-the-sleeves

- Scenarios, solutions, troubleshooting options

	## Git Bash :: default start location ::

	A quick way to set the default start location (without installing `msysgit`) - 

	1. Right-click Git Bash (shortcut icon) > select **Properties**.

		Default -

		- **Target** - *"C:\Program Files\Git\git-bash.exe" --cd-to-home*
		- **Start in** - *%HOMEDRIVE%%HOMEPATH%*

	1. Modify **Start in** and point to the desired location, preferrably the directory where your Clone resides.   
	   Remove --cd-to-home.

		Change to -
		
		- **Target** - *"C:\Program Files\Git\git-bash.exe"*   
		- **Start in** - `[desired-location]` for example *D:\GitHub*

		> **Note:** Do not forget to delete `--cd to home` from **Target**, otherwise the **Start in** value gets overridden.

		## Okay, show me the screenshot >>

		![Git Bash start in](./../../../images/gitbash-startin.jpg)

<if type="hidden">

### Bring your repo in sync with OLL master (up-to-date)

```
Your branch is X commits ahead 
```

If you get this above message on your fork, how to clean this without pushing to OLL master? 

git fetch upstream

git checkout master

	Output
	Already on 'master'
	Your branch is up to date with 'origin/master'.

git reset --hard upstream/master

	Output
	Updating files: 100% (1126/1126), done.
	HEAD is now at e7edee3254 Update title (#4398)

git push --force

	Output
	Total 0 (delta 0), reused 0 (delta 0), pack-reused 0
	To https://github.com/manish-garodia/learning-library.git
	 + bf93e2e310...e7edee3254 master -> master (forced update)

git checkout master

	Output
	Already on 'master'
	Your branch is up to date with 'origin/master'.

git rebase master

	Output
	Current branch master is up to date.

git push -u origin master

	Output
	Everything up-to-date
	Branch 'master' set up to track remote branch 'master' from 'origin'.


Explanation
Here: 'git reset --hard upstream/master' will reset 'master' HEAD on the updated 'upstream/master', in order for master to reflect the exact same history as the one in the original repo.

But since some commits where previously done on 'master' and pushed on the fork ('origin/master'), you would need to replace that history with the new master state. Hence the 'git push --force'.

- Rebasing mybranch allows for those current patches to be based on the most up-to-date commit of the original repo.

</if>

	----
	## Rename objects in GitHub

	Applicable to both - <i>files</i> and <i>folders</i>. 

	- **Option 1**: Open *Git Bash*
		1. Go to the file in the Clone. 
		1. Use the Linux command for moving/renaming files and folders. 

			```
			$ <copy>mv <old name> <new name></copy>
			```

	- **Option 2**: Directly on *GitHub*
		1. Open the repo in a browser.
		1. Go to the file and > select **Edit file**. 
		1. Place the cursor at the first character of the file name and hit backspace.

	- **Option 3**: Open the Windows Explorer and
		1. Move the file to another location, outside the Clone.
		1. Right-click (F2) and rename.
		1. Copy the file back to the original location with the new name. 

		> **Note:** Renaming a file or a folder at the same location in Windows Explorer does not help because the names are not case-sensitive. 

	- **Final Option 3**: if all the above failed - 
		1. Delete the file (or move it out to another location) 
		1. Create a folder with the new name (or rename at another location and copy it back). 
		1. Commit to master with the new name.

	----
	## Upstream master does not show up in GitHub Desktop?

	In GitHub Desktop, you click **Branch** then > **Merge into current branch**. The merge into remote repo window does not show `upstream/msater` under `Other branches`, then do the following. 

	1. Open the remote upstream folder in this location.

		```
		$ <clone>\<local-repository>\.git\refs\remotes\upstream
		```

		**Example** -

		```
		D:\GitHub\learning-library\.git\refs\remotes\upstream
		```

	1. Delete the master file.

	1. Fetch again to get a new copy of the master file.

	Now, upstream/master will show up again in the merge window. 

<if type="hidden">

	## Repo-name suggestions

	choco-bites  
	fluffy-cat  
	johnny-bravo  
	keep-the-change  
	micky-mouse  
	mount-everest  
	rainbow-colors  
	shining-star  
	silver-fork  
	boiled-potatoes  
	taj-mahal  
	time-machine  
	whos-the-boss  

</if>


## Acknowledgements

 - **Author** - Manish Garodia, Team Database UAD
 - **Last Updated on** - February 20, (Sun) 2022
 - **Questions/Feedback?** - Blame [manish.garodia@oracle.com](./../../../intro/files/email.md)
