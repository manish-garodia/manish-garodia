# ![GitHub](./images/git-black-small.png) &nbsp;Fun with Git-Bits

## The fork, the clone, the OLL master

The information in this lab revolves around - 

### ![GitHub](./images/git-black-small.png) &nbsp;&nbsp;&nbsp;&nbsp;[GitHub](?lab=fun-with-git-bits&type=gitconcepts)

### ![GitHub Desktop](./images/github-desktop-small.png) &nbsp;&nbsp;&nbsp;&nbsp;[GitHub Desktop](?lab=fun-with-git-bits&type=gitdesktop)

### ![Git Bash](./images/git-bash-small.png) &nbsp;&nbsp;&nbsp;&nbsp;[Git Bash](?lab=fun-with-git-bits&type=gitbash)

## Learn about git<if type="gitconcepts"> concepts</if><if type="gitdesktop"> desktop</if><if type="gitbash"> bash</if>

<if type="gitconcepts">
- Basic concepts
- Do's and Don'ts
- A few good practices
</if>
<if type="gitdesktop">
- 
</if>
<if type="gitbash">
- *Fetch* vs *Pull*
</if>

	<if type="gitconcepts">

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

	 Do not `pull origin` every day to update the fork.

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

	</if>

	<if type="gitdesktop">

	## Sync between clone, fork, and OLL master

	1. Go to **File** > **Options**.
	1. The **Accounts** tab shows that you are logged in to your GitHub account. 

	<br>
	Now, to update your fork repo and the clone you have:
	- <font style="color:rgb(112,173,71);">**Option 1** - from **Fork**, *fetch* OLL master and then in Github Desktop *pull origin* to **Clone**</font>
	- <font style="color:rgb(91,155,213);">**Option 2** - from **Clone**, *merge* with OLL master in GitHub Desktop and then *push origin* to **Fork**</font>

		![Update fork and clone](./images/update-fork-clone-grey.png " ")

	</if>

	<if type="gitbash">

	----
	## **Fetch** vs **Pull**

	The `fetch` command and the `pull` command looks similar but they perform different functions and serve different purposes. 

	| git fetch | git pull |
	|-----------|----------|
	| Tells your clone to get the meta-data information from OLL master. It checks if any updates are available but does not do any file transfer. |  Not only does a check for updates but also brings down all changes from OLL master to the clone. |

	In short, the *git pull* command does a *git fetch* followed by a *git merge*. 

	</if>

<if type="gitdesktop">

## Get along with GitHub Desktop

- 

	----
	## Option 1: Update fork > pull to clone (browser)

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
	## Option 2: Update clone > push to fork (GitHub Desktop)
	
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

</if>

<if type="gitconcepts">

## Merge the fork with OLL master (PRs)

Want to merge your updated fork repo with OLL master? *Submit a pull request*.   
After committing your changes to master, go to your fork repo and *create a pull request*. 
 
- Options to open your fork repo

	----
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

	----
	## Submit pull request (PR)

	Once you commit (push) your changes from the clone, using either git desktop or git bash, the fork displays the message.

	```
	This branch is 1 commit ahead of [head:repo]
	```

	![1 commit ahead](./images/1-commit-ahead.png " ")

	Submit a PR to merge your changes with the main repository.
	
	1. From your fork repo, go to **Pull requests** > **New pull request**.

		> **Note:** The page must display that you are **<i><font style="color:rgb(63,185,61);">Able to merge</font></i>** (in green). The arrow is from your fork (head repo) and points to OLL (base repo). 

	1. Click **Create pull request**.

	1. Review the message for the PR.
	
		> **Note:** Do not forget to mention the workshop ID in the subject line of the message. 

	1. Click **Create pull request**.   
		It creates a merge request with a four-digit code and displays a message. 

		```
		[user] wants to merge 1 commit into oracle:master from [user]:master
		```

	Done. Your pull request is submitted for review. Wait for the approval.

</if>

<if type="gitbash">

## Take a plunge into *Git Bash*

 - Learn about stage, commit, push, pull, fetch, git configurations, and other commonly used commands

	## All about commit

	The main steps for pushing the local changes from the clone to the fork repo -

	1. Display local changes
	1. Stage files for committing
	1. Commit to master
	1. Push from clone to fork

		----
		## 1. Display local changes

		 - View the staged/unstaged files in the clone. 

			----
			## Display modified files in the clone

			View the files that are modified, moved, added, or deleted in the clone. It displays only the files and not the content changes within the files. 

			```
			$ <copy>git status</copy>
			```

			> **Tip:** It is a good practice to view git status at the beginning and also in between or at the end before commit, to verify the correct files are included in the commit. 

			----
			## Display compact status

			```
			$ <copy>git status --short</copy>
			```

			The `short status` flags are -
			 - *??* - untracked files
			 - *A* - files added to stage
			 - *M* - modified files
			 - *D* - deleted files

			----
			## Display content changes in the clone

			Compare the clone with the fork. View the content changes line-by-line within the modified files in the clone. 

			- **for detailed view**

				```
				$ <copy>git diff origin/main</copy>
				```
			Press ***q*** to quit.

			- **for quick view**

				```
				$ <copy>git diff</copy>
				```

		----
		## 2. Stage files for committing

		You can stage one or more changed files and folders in the local repo for committing.

		 - To stage a specific file or folder

			```
			$ git add [full path of the file or folder]
			```
			Example
			```
			$ git add common/intro/readme.md
			```

			----
			## More staging options

			1. 	```
				use wildcards in the file name
				$ git add [*file-name*]
				```

				Example
				```
				$ <copy>git add *install-emcc*</copy>
				```

			1. 	```
				specify the file type (*.png)
				$ git add [file.extension]
				```

				Example
				```
				$ <copy>git add *.png</copy>
				```

			----
			## Stage all files together

			Use anyone

			1. This command works only from the root directory only.

				```
				$ <copy>git add .</copy>
				 
				```

			1. These commands work from anywhere in the local repo (clone). 

			- 	```
				$ <copy>git add -A</copy>
				```

			- 	```
				$ <copy>git add --a</copy>
				```

			-	```
				$ <copy>git add --all</copy>
				```

				With these, you can stage all files and folders (modified, moved, added, or deleted) together in a single step.

			----
			## Undo (Rollback) staging

			**Use case:** You have staged your modified files in the clone but not yet committed to master. And you want to bring them back and make more changes to the staged files, before committing. 

			You can undo staging without hurting the files or losing your local changes. This will bring the staged files back into their previous unstaged condition but will not affect the content changes. 
			
			**Note:** This command is *safe* to use.

			- To unstage a single file:

				```
				$ <copy>git restore --staged [file-name full-path]</copy>
				``` 

				Note the flag **--staged** used in this command. If you do not use this flag, then all local changes will be lost ***permanently***. 

			- To unstage everything but keep you local changes intact:

				```
				$ <copy>git reset</copy>
				``` 

			**See also** *Discard local changes*

			----
			## Discard local changes

			**Use case**: The local changes in the clone are incorrect and you want the files back from the master. 

			<i>DO NOT</i> use these, unless you want to discard all changes made in the clone and update from master. 

			```
			$ git restore [file-name]...
			$ git restore *.*
			$ git restore .
			```

			**Warning:** All local changes will be **lost forever**.

			The `git restore` command without the *--staged* flag will forget all local changes. This command is irreversible, you cannot retrieve the discarded changes ever again. 

			> **Note:** If you stage some files followed by `git restore`, then all unstaged files (local changes) will be lost but the files that are already staged will remain intact, ready for committing. 

			**See also** *un-stage a file*

		----
		## 3. Commit to master

		1. Initiate the commit (without any flags).  

			```
			$ <copy>git commit</copy>
			```

			This command opens a file in an editor where you can enter the details, including the <i>summary</i> and <i>description</i>.

			> **Note:** The first line is the <i>summary</i> and remaining portion is the <i>description</i>. Leave an empty line between the summary and description.

		1. Save the file for commit, *:wq*.

			Another option is, quit without saving, *:q!*. This will cancel the commit and go back to staging.

			**Scenario**  
			Suppose, you forgot to stage some files, or want to un-stage a wrong file, you can quit without saving and cancel the commit. 
				
			> **Note:** Git Bash does not commit with an empty file. 

			----
			## Still hungry for more?

			 - Sometimes, you may want to stage and commit together in a single command. 

				----
				## Stage and commit along

				To stage the files and also commit them together in a single step -

				```
				$ <copy>git commit -am "commit-name"</copy>
				```

				**Flags**
				 - *-a* stages every changed, tracked file automatically. Use this flag if no new files are added. However, if you have new additions or deletions, do a `git add` and then `git commit -m` separately.			 
				 - *-am* adds all changed files with the commit message. 

				----
				## Undo (rollback) commit and redo

				**Use case**: Your commit message is wrong or you want to bring back for more editing, before issuing a `push origin`. You can undo the last commit without hurting any files or local changes. 
				
				It is safe to use.

				1. You have committed your files already. 
				
					```
					$ <copy>git commit -m "something terribly misguided"</copy>
					```

				1. Undo the last commit and bring back prior to the staging state. The changes are still visible, and not lost. 

					```
					$ <copy>git reset HEAD~</copy>
					```

					This step erases your git history instead of making a new commit. 

				1. Make changes as necessary.

				1. Stage the files again, including any new files.

					```
					$ <copy>git add .</copy>
					```

				1. Redo commit along with the new changes. 

					```
					$ <copy>git commit -c ORIG_HEAD</copy>
					```

					It opens an editor and displays the log message from your previous commit. You may edit or add more to the message and commit again. 

				----
				## What is the full syntax for commit?

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

				```
				$ <copy>git commit pull origin main</copy>
				```

		----
		## 4. Push from clone to fork

		After the files are committe to master, `push origin` from clone to fork.

		```
		$ <copy>git push origin main</copy>
		```

	----
	## Update fork and clone :: fetch and merge ::

	- You have multiple ways to update the clone and the fork repo. 

		----
		## Option 1: Update clone > push to fork

		Update the clone from OLL master and then push the changes from clone to fork. 

		1.  ```
			$ <copy>git checkout master</copy>
			```

		1. 	```
			$ <copy>git fetch upstream master</copy>
			```

		1. 	```
			$ <copy>git merge upstream/master</copy>
			```

			The changes in OLL master are merged with the clone. The clone is up-to-date with OLL master.

		1. 	```
			$ <copy>git push origin master</copy>
			```

			The updates in the clone are pushed to the fork repo. Both clone and fork are in sync with OLL master.

		----
		## Option 2: Update fork > pull to clone

		Update the fork and pull the changes from fork to clone. 

		Use these commands to find the difference between the clone and your fork repo.  

		- 	```
			$ <copy>git fetch</copy>
			```

		- 	```
			$ <copy>git fetch origin main</copy>
			```

			It does not update the clone.

		After you update your fork from OLL master using `fetch and merge` in a web browser, it is time to update the clone. Use this command to merge the changes from your fork into your clone.

		- 	```
			$ <copy>git pull --all</copy>
			```

			Brings the clone up-to-date with the changes in the fork. 

	----
	## Set up proxy config

	1.	```
		$ <copy>git config --global --unset http.proxy</copy>
		```

	1. 	```
		$ <copy>git config --global --get http.proxy</copy>
		```

		Output

		```
		http://manish.garodia@oracle.com:Oracle.com@www-proxy-idc.in.oracle.com:80
		```

	1.	Syntax

		```
		$ git config --global http.proxy http[s]://userName:password@proxyaddress.com:port
		```

		Example

		```
		$ <copy>git config --global http.proxy http://manish.garodia%40oracle.com:Oracle.com@www-proxy-idc.in.oracle.com:80</copy>
		```

		> **Note:** Encode `@` in username with `%40`.

	----
	## Start a new repo

	Open Git Bash and go to the directory where you want to create the repo. Create a new repo, *musical-lamp*, from the command line.

	1. 	Create a file `readme.md` and add a title to the lab.

		```
		$ <copy>echo "# musical-lamp" >> README.md</copy>
		```

	1. 	Initialize the (new) local repo.
		```
		$ <copy>git init</copy>
		```

	1. 	Stage the `README.md` file for committing.

		```
		$ <copy>git add README.md</copy>
		```

	1. 	Commit the file to master with a message, <i>first commit</i>.

		```
		$ <copy>git commit -m "first commit"</copy>
		```

	----
	Push the repo from the command line.

	1. 	Add a new remote repo. 

		```
		$ <copy>git remote add origin https://github.com/bg-manish/musical-lamp.git</copy>
		```

		To change the url of an existing remote repo:

		```
		$ <copy>git remote set-url origin git@github.com:User/musical-lamp.git</copy>
		```

	1. 	Set up a branch, *main*, for the repo. 

		```
		$ <copy>git branch -M main</copy>
		```

	1. 	Push the changes from clone to remote repo. 

		```
		$ <copy>git push -u origin main</copy>
		```

		- Once you use `git push -u origin main`, from next time onwards you can use only `git push` without any flags. 
		- If you do only `git push` (without -u), then next time you use `git pull`, you have to enter the remote repository url when git pulling.

		To check existing remotes:

		```
		$ <copy>git remote -v</copy>
		```

	----
	## Create a clone from fork

	To clone a repository: 

	1. Go to the GitHub directory on your local system.

	1. Create a new folder for the clone. 
	
		```
		$ <copy>mkdir <dir-name></copy>
		```
	1. Change directory for the new folder.

		```
		$ <copy>cd <dir-name></copy>
		```

	1. Run the commands to clone into the fork repo. 
	
		**Syntax**

		```
		$ git clone url

		$ git clone https://github.com/<your-username>/<your-repository>
		```

		**Example**

		```
		$ <copy>git clone https://github.com/bg-manish/northern-lights</copy>
		```

	Alternatively, you can specify a *folder-name* and clone the repo together in a single step. 

	**Syntax**

	```
	$ git clone url <folder-name>
	```

	**Example**

	```
	$ <copy>git clone https://github.com/bg-manish/northern-lights northern-lights</copy>
	```

	> **Note:** This command will create a folder *`northern-lights`* and clone the repo from the given URL. 

	----
	## Common `git` commands

	| Command                                                | Usage                                     |
	|--------------------------------------------------------|-------------------------------------------|
	| `cd /d/GitHub`                                         | change drives                             |
	| `cd <folder-name>`                                     | navigate between folders                  | 
	| `git log`                                              | display log                               | 
	| **Configuration**                                      |
	| `~/.gitconfig`                                         | git config location                       | 
	| `cat ~/.gitconfig`<br>`more ~/.gitconfig`              | display contents of config file           | 
	| `vi ~/.gitconfig`                                      | modify config file                        | 
	| `git config --list`                                    | display configuration settings            |
	| `git config --list --show-origin`                      | view all variables in the config file     |
	| `git config user.name`                                 | display git user name                     |
	| `git config --global user.name "FIRST-NAME LAST-NAME"` | set git user name                         | 
	| `git config --global user.email "MY-NAME@example.com"` | set git email address                     | 
	| `git remote add origin repository-URL`                 | add repository URL                        | 
	| **Branch**                                             |
	| `git branch`                                           | display branches in repo                  | 
	| `git branch branch-name`                               | create a new branch                       | 
	| `git branch -d branch-name`                            | remove a branch - <i>**safe** delete</i>  |
	|`git branch -D branch-name`                             | remove a branch - <i>**force** delete</i> |
	| 														 | 											 |
	| `git rm` | If you just use only `rm`, you will need to follow it up with `git add <fileRemoved>`. Whereas `git rm` does this in one step (both file removal and staging for deletion on the next commit). It keeps a copy in the local file system until commit. |
	| `git --version`                                        | current version of git                    |

	### Yet to be tested (not verified)

	- `git revert`   
	create a new commit with the changes that are rolled back.

</if>

## Tricks up-the-sleeves

- Scenarios, solutions, troubleshooting options

	<if type="gitbash">

	----
	## Git Bash :: default start location ::

	**Problem statement**  
	You want to change the default directory to start in when you open Git Bash. 

	**What to do**  
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

		----
		## Okay, show me the screenshot >>

		![Git Bash start in](./images/gitbash-startin.jpg " ")

	</if>
	<if type="gitdesktop">

	----
	## The fork is ahead of OLL master?

	**Problem statement**  
	Your fork says -

	```
	Your branch is X commits ahead 
	```

	![tbd](./images/rebase-01-fork-ahead.png " ")

	You do a `fetch origin`, `merge upstream/master`, and `push origin` to update both clone and fork repo with OLL master. Even after updating both clone and fork, you get a *commits mismatch* message on your fork. 

	This means that your fork is not fully synced with OLL master. If you get this message on your fork, how to clean this without submitting a pull request to OLL master? 

	**What to do**  
	Bring your fork repo in sync with OLL master (fully up-to-date). 

	In GitHub Desktop - 

	1. Go to **Branch** > **Rebase current branch**.

		![tbd](./images/rebase-02-rebase-menu.png " ")

	1. In the Rebase master window, select the branch *upstream/master* and click **Rebase**.

		![tbd](./images/rebase-03-select-branch.png " ")

		GitHub Desktop starts the rebase and displays the commits.

		![tbd](./images/rebase-04-rebase-progress.png " ")

		GitHub Desktop gives an option to force push with all ahead and behind commits.

	1. Click on **Force push origin** to rewrite history on `origin/master`.   
		The window displays a pop-up to confirm this action. Click on **I'm sure** to proceed.

		![tbd](./images/rebase-05-force-push.png " ")

	Refresh the browser page for the fork. You will see that the fork is now up to date with the master. 

	![tbd](./images/rebase-06-fork-uptodate.png " ")

	</if>

	<if type="gitbash">

	----
	## The fork is ahead of OLL master?

	**Problem statement**  
	Your fork says -

	```
	Your branch is X commits ahead 
	```

	![tbd](./images/rebase-01-fork-ahead.png " ")

	You do a `fetch origin`, `merge upstream/master`, and `push origin` to update both clone and fork repo with OLL master. Even after updating both clone and fork, you get a *commits mismatch* message on your fork. 

	This means that your fork is not fully synced with OLL master. If you get this message on your fork, how to clean this without submitting a pull request to OLL master? 

	**What to do**  
	Bring your fork repo in sync with OLL master (fully up-to-date).  

	From Git Bash - 

	1. Go to the clone directory.

	1.	```
		$ <copy>git fetch upstream</copy>
		```

	1.	```
		$ <copy>git checkout master</copy>
		```

		## Result

		```
		Already on 'master'
		Your branch is up to date with 'origin/master'.
		```

	1.	```
		$ <copy>git reset --hard upstream/master</copy>
		```

		## Result

		```
		Updating files: 100% (1126/1126), done.
		HEAD is now at e7edee3254 Update title (#4398)
		```

	1.	```
		$ <copy>git push --force</copy>
		```

		## Result

		```
		Total 0 (delta 0), reused 0 (delta 0), pack-reused 0
		To https://github.com/manish-garodia/learning-library.git
		 + bf93e2e310...e7edee3254 master -> master (forced update)
		```

	1.	```
		$ <copy>git checkout master</copy>
		```

		## Result

		```
		Already on 'master'
		Your branch is up to date with 'origin/master'.
		```

	1. 	```
		$ <copy>git rebase master</copy>
		```

		## Result

		```
		Current branch master is up to date.
		```

	1. 	```
		$ <copy>git push -u origin master</copy>
		```

		## Result

		```
		Everything up-to-date
		Branch 'master' set up to track remote branch 'master' from 'origin'.
		```

		----
		## Need an explanation?

		Here, `git reset --hard upstream/master` will *reset master HEAD* on the updated `upstream/master`, in order for `master` to reflect the exact same history as the one in the remote repo.

		But since some commits where previously done on master and pushed on the fork (`origin/master`), you would need to replace that history with the new master state. Hence, the `git push --force`.

		Now, rebasing `mybranch` allows those current patches to be based on the most up-to-date commit in the remote repo.

	Refresh the browser page for the fork. You will see that the fork is now up to date with the master. 

	![tbd](./images/rebase-06-fork-uptodate.png " ")

	</if>

	----
	## Rename objects in GitHub

	**Problem statement**  
	You want to rename files or folders in your repo, but GitHub does not reflect your changes.

	**What to do**  
	Applicable to both - <i>files</i> and <i>folders</i>. 

	<if type="gitbash">

	- **Using Git Bash**
		1. Open *Git Bash*.
		1. Go to the file in the clone. 
		1. Use the Linux command for moving/renaming files and folders. 

			```
			$ <copy>mv <old name> <new name></copy>
			```
	</if>

	- **Modify directly on GitHub** 
		1. Login to *GitHub* in a browser and go to the repo.
		1. Go to the file and > select **Edit file**. 
		1. Place the cursor at the first character of the file name and hit backspace.

	- **Using Windows Explorer**
		1. Move the file to another location, outside the Clone.
		1. Right-click (F2) and rename.
		1. Copy the file back to the original location with the new name. 

		> **Note:** Renaming a file or a folder at the same location in Windows Explorer does not help because the names are not case-sensitive. 

	- **Final option**: if all the above failed, take the long route - 
		1. Delete the file (or move it out to another location) 
		1. Create a folder with the new name (or rename at another location and copy it back). 
		1. Commit to master with the new name.

		Use this option as the last resort. 

	<if type="gitbash">

	----
	## Change the last commit

	**Problem statement**

	You entered a wrong message in the log, or forgot to add some files to staging. 
	
	**What to do**

	You can amend your last commit (just before `push origin`). Thus, instead of doing a new commit, you combine the staged changes with your previous commit. 

	To modify the commit message:

	```
	$ <copy>git commit --amend</copy>
	```

	> **Note:** Do this just after the `commit` command, before issuing a `push origin`.

	To add more files for staging to the previous commit:

	1. Add the missed file or files.
	
		```
		$ <copy>git add common/mg-library/procedures/fun-with-git-bits/fun-with-git-bits.md</copy>
		```

	1. Amend the last commit. 

		```
		$ <copy>git commit --amend --no-edit</copy>
		```

	With the `--no-edit` flag, you amend your commit without changing the commit message.

	----
	## Change a previous commit (cherry pick)

	**Problem statement**

	You do *multiple commits* from your clone (local repo). Now, you want to find an older commit, before the last commit, and modify it.
	 - Scenario 1 - before `push origin`
	 - Scenario 2 - after `push origin` 

	**Scenario 1** - *Before `push origin`*

	You did `commit to master` but did not `push origin` yet.

	**What to do**

	Do these steps just before `push origin`.
	
	1. Perform an interactive rebase and squash your commits.

		Syntax

		```
		$ git rebase --interactive HEAD~n

		or short-form as below

		git rebase -i @~n
		```

		 > Where, 
		 >> *`n`* indicates the number of commits up to the first commit you want to edit   
		 >> *`@`* is a shorthand for `HEAD`   
		 >> *`~`* is the commit before the specified commit

		Example, you want to modify up to last 7 commits.

		```
		$ <copy>git rebase -i @~7</copy>
		```

		Output 

		```
		[detached HEAD bae62a1] WS5 (11056) Released to prod
		 Date: Sun Jun 12 13:18:30 2022 +0530
		 84 files changed, 1441 insertions(+)
		 create mode 100644 live/dba-essentials/manage-storage-structures/initialize-environment/images/db-service-status.png
		 create mode 100644 live/dba-essentials/manage-storage-structures/initialize-environment/images/db-service-status2.png
		 create mode 100644 live/dba-essentials/manage-storage-structures/initialize-environment/images/em-landing.png
		 ...
		 ...
		 create mode 100644 live/dba-essentials/manage-storage-structures/workshops/livelabs/manifest.json
Successfully rebased and updated refs/heads/main.
		```

		This opens the previous commits in the default editor. 
		
	1. Go to the **Edit** mode and replace *`pick`* with *`e`* or *`r`* (*`edit`*).

	 ![git rebase options](./images/git-commit-rebase.png " ")

		 > **Note:** Press **i** to enter the **Edit** mode.

		Use either of the following: 

		 - **e** (edit) - use commit but stop for amending
		 - **r** (reword) - use commit but edit only the commit message; you can directly modify the commit message
		 - any other option shown in the editor

		With *`e`*, you can use *`git commit --amend`* to modify the message or *`git reset @~`* to discard the last commit without losing the local changes. 

	1. Modify *`pick`* to *`r`* and save the commit history file.

		 > **Esc** + **:wq** or **Esc** + **Shift** + **zz**

	 It opens the particular commit that you selected to modify.

	1. Edit the commit message and save the file.

		 > **Esc** + **:wq** or **Esc** + **Shift** + **zz**

	 Optionally, you may try to continue rebase if in progress. But it may give an error if no rebase is in progress.

		 ```
		 $ <copy>git rebase --continue</copy>
		 
		 fatal: No rebase in progress?
		 ```
	
	1. You can now push your commit with the modified message to the main repo. 

		 ```
		 $ <copy>git push origin main</copy>
		 ```

	> **Note:** Git returns an error if you have unstaged changed in your clone. Stage them first (`git add`) before issuing `git rebase -i`.

	![Git rebase unstaged files](./images/rebase-error.png " ")

	**Scenario 2** - *After `push origin`* 

	You did not only `commit to master` but also `push origin`. Can such commits be modified?

	**What to do**

	Let's find out.

	1. Perform an interactive rebase and squash your commits.

		Example, you want to modify up to last 18 commits.

		```
		$ <copy>git rebase -i @~18</copy>
		```

		 > Where, 
		 >> *`n`* indicates the number of commits up to the first commit you want to edit   
		 >> *`@`* is a shorthand for `HEAD`   
		 >> *`~`* is the commit before the specified commit

		Output 

		```
		[detached HEAD 236ec52] WS2 (7141) Released to prod
		 Author: manish-garodia <manish.garodia@oracle.com>
		 Date: Thu Jan 13 21:26:55 2022 +0530
		 83 files changed, 1460 insertions(+)
		 create mode 100644 Live/dba-essentials/em-dba/access-homepage/access-homepage.md
		 create mode 100644 Live/dba-essentials/em-dba/access-homepage/images/emcc-dbhome-001-expandall.png
		 create mode 100644 Live/dba-essentials/em-dba/access-homepage/images/emcc-dbhome-002-dblist.png
		 create mode 100644 Live/dba-essentials/em-dba/access-homepage/images/emcc-dbhome-003-instancehome.png
		...
		...
		 create mode 100644 Live/dba-essentials/em-dba/workshops/livelabs/manifest.json
		Successfully rebased and updated refs/heads/main.
		```

		This opens the previous commits in the default editor. 

	1. Go to the **Edit** mode and replace *`pick`* with *`e`* or *`r`* (*`edit`*).

		 > **Esc** + **:wq** or **Esc** + **Shift** + **zz**

	 It opens the particular commit that you selected to modify.

	1. Edit the commit message and save the file.

		 > **Esc** + **:wq** or **Esc** + **Shift** + **zz**

	1. Pull origin to update the clone and merge made by the 'recursive' strategy.

		```
		$ <copy>git pull origin main</copy>
		```

		Output

		```
		From https://github.com/bg-manish/mg-library
		 * branch            main       -> FETCH_HEAD
		Auto-merging live/dba-essentials/install-db/workshops/livelabs/manifest.json
		Auto-merging live/dba-essentials/install-db/workshops/freetier/manifest.json
		Auto-merging live/dba-essentials/install-db/workshops/desktop/manifest.json
		Auto-merging live/dba-essentials/install-db/prepare-setup/prepare-setup.md
		Auto-merging live/dba-essentials/install-db/intro-install/intro-install.md
		Auto-merging live/dba-essentials/install-db/install-desktop-server/install-desktop-server.md
		Auto-merging live/dba-essentials/install-db/dbca/dbca-typical-advanced.md
		Auto-merging live/dba-essentials/configure-network-env/workshops/desktop/index.html
		Auto-merging live/dba-essentials/backup-recovery/workshops/livelabs/index.html
		Auto-merging live/dba-essentials/backup-recovery/workshops/desktop/index.html
		Merge made by the 'recursive' strategy.
		```

	1. Now push origin with the modified message from the clone to the main repo. 

		 ```
		 $ <copy>git push origin main</copy>
		 ```

	It will create additional sets of commits on your main repo. 

	</if>

	----
	## Recv failure: Connection was reset

	**Problem statement**  
	You do a `git push origin`, ` git pull origin`, or `git fetch` from Git Bash or Git Desktop and get the following message.

	```
	fatal: unable to access   
	'https://github.com/[your-account]/[your-repo].git/':   
	Recv failure: Connection was reset
	```

	**What happened**  

	The clone could not talk to the fork or the remote repo. 
	- Port 80 might be blocked, or 
	- you have not set the proxy configurations
	- your internet is down

	**What to do**  

	1. Check your internet connection. 
	1. VPN must be connected for the clone to talk to the fork repo. Disconnect the VPN and reconnect. 
	1. Check the proxy configurations for git. See [Set up proxy config](https://manish-garodia.github.io/mg-playground/z-sandbox/?lab=fun-with-git-bits&type=gitbash#TakeaplungeintoGitBash)

	----
	## Could not resolve proxy: [proxy-URL]

	**Problem statement**  
	You run a git command and get the following message.

	Error in Git Bash - 
	```
	fatal: unable to access 'https://github.com/[your-account]/[your-repo].git/': 
	Could not resolve proxy: [proxy-url]
	```

	Error in Git Desktop - 
	![Proxy issue-VPN error](./images/proxy-error-mask.png " ")

	**What happened**   
	VPN is disconnected. 

	**What to do**  
	1. Connect VPN and try again. 
	1. If VPN is already connected, disconnect VPN and reconnect. 

	VPN must be connected for the clone to talk to the fork repo. 

	<if type="gitbash">

	----
	## warning: LF will be replaced by CRLF in [file]

	**Problem statement**  
	You `git add` one or more files and get the following message.

	```
	warning: LF will be replaced by CRLF in ansible.cfg.
	The file will have its original line endings in your working directory
	```

	**What it means**  
	In Unix systems, the end of a line is represented with a line feed (LF). In Windows, a line is represented with a carriage return (CR) and a line feed (LF), thus (CRLF). 
	
	When you get code from git that was uploaded from a Unix system, they will only have an LF.

	**What to do**

	- If you are a single developer working on a Windows machine, you can simply turn this warning off from the command line.

		```
		$ <copy>git config core.autocrlf true</copy>
		```

	- You can also deactivate this feature in your git core config. 

		```
		$ <copy>git config core.autocrlf false</copy>
		```

	- But maybe you want to just get rid of the warnings altogether.

		```
		$ <copy>git config core.autocrlf true</copy>
		```

		```
		$ <copy>git config --global core.autocrlf true</copy>
		```

		## Cite source 

		[Virtual geek on vcloud-lab](http://vcloud-lab.com/entries/devops/resolved-git-warning-lf-will-be-replaced-by-crlf-in-file)

	</if>

	<if type="gitdesktop">

	----
	## Upstream master does not show up in GitHub Desktop?

	**Problem statement**  
	In GitHub Desktop, you click **Branch** then > **Merge into current branch**. The merge into remote repo window does not show `upstream/msater` under `Other branches`. 
	
	**What to do**

	1. Open the remote upstream folder in this location.

		```
		$ <clone>\<local-repository>\.git\refs\remotes\upstream
		```

		**Example** -

		```
		D:\GitHub\learning-library\.git\refs\remotes\upstream
		```

	1. Delete the master file in the clone.

	1. Fetch again to get a new copy of the master file from the fork.

	Now, `upstream/master` will be displayed again in the merge window. 

	----
	## Change the default External Editor from Notepad++ to Atom

	**Problem statement**  
	In GitHub Desktop, the default **External Editor** shows *Notepad++*.   
	You want to set the default editor to *Atom*. 
	
	![Default External Editor Notepad++](./images/desktop-editor-01-default-notepad.png " ")

	**What to do**  
	1. Download the new [Atom app](https://atom.io/) (`v1.60.0`) and install afresh. 

		 > **Note:** You may remove the older version of Atom manually using Window Explorer or CLI (git bash). 

	1. Open GitHub Desktop and go to **File** > **Options**. 

	 ![Modify GitHub preferences](./images/desktop-editor-02-modify-options.png " ")

	1. In the **Integrations** tab, under **External Editor** select *Atom*.

	 ![External Editor Atom](./images/desktop-editor-03-select-external-editor.png " ")

	1. Click **Save** to set the new external editor.   
		The new default editor in GitHub Desktop is Atom.

	 ![New Default Editor Atom](./images/desktop-editor-04-new-default-editor-atom.png " ")

	</if>

	## Notepad++ tips

	**Problem statement**  
	You want to select the text in column mode.

	**What to do**  
	Keeping **Shift** and **Alt** pressed, use the cursor keys to select text in column mode.

	<if type="hidden">

	## Crazy repo-names

	choco-bites  
	beautiful-chaos
	fluffy-cat  
	johhny-bravo  
	keep-the-change  
	mickey-mouse  
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
 - **Last Updated on** - June 25, (Sat) 2022
 - **Questions/Feedback?** - Blame [manish.garodia@oracle.com](./intro/files/email.md)
