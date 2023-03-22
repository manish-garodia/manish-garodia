# ![GitHub](./images/git-black-small.png) &nbsp;Fun with Git-Bits

## The fork, the clone, the main repo

The information in this lab revolves around -

### ![GitHub](./images/git-black-small.png) &nbsp;&nbsp;&nbsp;&nbsp;[GitHub](?lab=fun-with-git-bits&type=gitconcepts)

### ![GitHub Desktop](./images/github-desktop-small.png) &nbsp;&nbsp;&nbsp;&nbsp;[GitHub Desktop](?lab=fun-with-git-bits&type=gitdesktop)

### ![Git Bash](./images/git-bash-small.png) &nbsp;&nbsp;&nbsp;&nbsp;[Git Bash](?lab=fun-with-git-bits&type=gitbash)

## Learn about git<if type="gitconcepts"> concepts</if><if type="gitdesktop">hub desktop</if><if type="gitbash"> bash</if>

<if type="gitconcepts">
 - Basic concepts
 - Do's and Don'ts
 - A few good practices
</if>
<if type="gitdesktop">
 - GitHub Desktop basic setup
</if>
<if type="gitbash">
 - *Upstream* and *Origin*: what are these?
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

	----
	### Preview a lab

	**A. View a lab or workshop from the fork**

	```
	<fork>.github.io/<filepath>/filename
	```

	----
	#### Prerequisites

	1. From the fork repo, go to **Settings** &gt; **GitHub pages**.
	2. Under **Source**, select **Branch: main** &gt; */root*.

		It may take ~30-60 mins to publish the site/repo and show-up the preview.

	**B. View html preview of the workshop in OLL**

	```
	oracle.github.io/<path to index.html>
	```

	----
	### Recommendations for working on LiveLabs

	----
	#### Option A: New repo

	1.  Create a new repo: 2-day DBA.
	2.  Add all team members as contributors.
	3.  Create clones of this repo and all members work independently.
	4.  When the entire workshop is ready any one create a fork, keep all files at one place, and push the fork altogether to OLL.

	Ensure to pull from this repo every time someone modifies any file to avoid conflicts.

	----
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

	Remember to:

	1. Keep your fork and clone updated with Oracle learning-library, even though you are not actively working on your workshop or your workshop has no modifications.

	1. If you do not update your clone and fork for a long time and the number of commit changes with OLL master is significantly high, you may find conflicts while merging or submitting a pull request. Then you may need to delete your fork and your clone, and then redo like afresh.

		> Update the fork first before pushing the changes from clone to fork and then pull request from fork to OLL. This step ensures other person's changes are also merged.   
	*GH does not allow such pull requests, which creates conflicts*.

	1. Update the fork if someone else modifies a file in-progress.

	1. If more than one person is working on the same lab, they must keep their fork updated to avoid conflicts.

	1. If your fork repo is <ins>old</ins> (not updated), and the clone is <ins>in sync</ins> (up-to-date) with the fork, then `merge upstream/main` will not show any changes. If you try to merge with `upstream/main`, it will show that - <i>your branch is up-to-date</i>. In reality, both clone and fork are <ins>behind</ins> OLL master.

		> **Note**: Always fetch origin (or fetch upstream) to update the fork from `upstream/main` and then try to `merge upstream`.

	1. If you modify an older version of a file, GH returns a conflict error on pull request. In such case, update the fork and clone, make changes your file, and submit the pull request again.

	1. When you submit a PR to OLL master, any further merging from your Github account is blocked. Until a code owner reviews and approves the PR, you cannot submit another PR in parallel.  

		> **Note**: After submitting the PR if you make changes to any files, you can still commit to master and submit a *merge request* instead.

	1. Create a fork from the GH page and create a clone of fork from Git Desktop. If it takes longer, disconnect VPN and try creating the clone again.

	1. If a lab is in development and a writer wants to initiate a review, do it from the fork, not from OLL. 

	1. When you edit the contents of a markdown file or add/modify/remove files from the lab folders, the live-server plugin reloads the entire page immediately even for minor changes. It jumps to the top of the page and you have to scroll down again to the edited section.

		> **Tip**: To update the html output instantenously keeping the focus on the section being edited, click on the *Heading level 2* (task URLs) in the left navigation pane. The page will reload but will display the edited section instead of displaying the top of the page.

	1. Keep your clone up-to-date before making any changes locally.

	1. Resolve conflicts in clone first before issuing a merge or push

	</if>

	<if type="gitdesktop">

	----
	## Sync between clone, fork, and main repo

	1. Go to **File** &gt; **Options** (keyboard shortcut **Ctrl**+**,**).
	1. The **Accounts** tab shows that you are logged in to your GitHub account.

	<br>
	Now, to update your fork repo and the clone you have:
	- <font style="color:rgb(112,173,71);">**Option 1** - from **Fork**, *fetch* OLL master and then in Github Desktop *pull origin* to **Clone**</font>
	- <font style="color:rgb(91,155,213);">**Option 2** - from **Clone**, *merge* with OLL master in GitHub Desktop and then *push origin* to **Fork**</font>

		![Update fork and clone](./images/desktop/update-fork-clone-grey.png " ")

	</if>

	<if type="gitbash">

	----
	## **Upstream** and **Origin**: what are these?

	 You would come across these terms *upstream* and *origin* while working with git. Though both are repos but indicate different locations.

	 - *upstream* - is the main repo (Eg: oracle-livelabs/learning-library, em-omc, database)
	 - *origin* - is the fork repo (manish-garodia/repo, etc) in your account

	 If you run a `fetch` or `merge` on `upstream`, you are talking to the `main` repo. But if you point to `origin`, then your communication is with your fork.

	----
	## **Fetch** vs **Pull**

	The `fetch` command and the `pull` command looks similar but they perform different functions and serve different purposes.

	| git fetch | git pull |
	|-----------|----------|
	| Tells your clone to get the meta-data information from OLL master. It checks if any updates are available but does not do any file transfer. |  Not only does a check for updates but also brings down all changes from OLL master to the clone. |

	In short, the *git pull* command does a *git fetch* followed by a *git merge*.

	</if>

	----
	## Github pages

	You can apply Jekyll themes to your Github pages.

	1. Keep this configuration file under the root folder of your repo.

		- *`_config.yml`*

	1. Edit the `yml` file and specify the theme.

		```
		# theme: jekyll-theme-architect
		# theme: jekyll-theme-cayman
		# theme: jekyll-theme-dinky
		# theme: jekyll-theme-hacker
		# theme: jekyll-theme-leap-day
		# theme: jekyll-theme-merlot
		# theme: jekyll-theme-midnight
		# theme: jekyll-theme-minima
		# theme: jekyll-theme-minimal
		# theme: jekyll-theme-modernist
		# theme: jekyll-theme-primer
		# theme: jekyll-theme-slate
		# theme: jekyll-theme-tactile
		# theme: jekyll-theme-time-machine
		```

		> Do not forget to uncomment the line before saving.

	 - See the GitHub Pages help documentation for instructions on how to add a theme to your GitHub Pages site, and follow The GitHub Blog for information on additional theme support.

		**Cite**: Video on [Getting Started with GitHub Pages](https://www.youtube.com/watch?v=QyFcl_Fba-k)

		----
		## Supported Jekyll themes

		GitHub Pages supports the following themes.
		 - Architect
			![Architect theme](./images/jekyll-themes/jekyll-theme-architect.jpg " ")
		 - Cayman
			![Cayman theme](./images/jekyll-themes/jekyll-theme-cayman.jpg " ")
		 - Dinky
			![Dinky theme](./images/jekyll-themes/jekyll-theme-dinky.jpg " ")
		 - Hacker
			![Hacker theme](./images/jekyll-themes/jekyll-theme-hacker.jpg " ")
		 - Leap day
			![Leap day theme](./images/jekyll-themes/jekyll-theme-leap-day.jpg " ")
		 - Merlot
			![Merlot theme](./images/jekyll-themes/jekyll-theme-merlot.jpg " ")
		 - Midnight
			![Midnight theme](./images/jekyll-themes/jekyll-theme-midnight.jpg " ")
		 - Minima
		 - [Minimal](https://orderedlist.com/minimal/)

			![Minimal theme](./images/jekyll-themes/jekyll-theme-minimal.jpg " ")

			Used for Github pages theme - [database](https://oracle-livelabs.github.io/database/)

		 - Modernist
			![Modernist theme](./images/jekyll-themes/jekyll-theme-modernist.jpg " ")
		 - Slate
			![Slate theme](./images/jekyll-themes/jekyll-theme-slate.jpg " ")
		 - Tactile
			![Tactile theme](./images/jekyll-themes/jekyll-theme-tactile.jpg " ")
		 - Time machine

<if type="gitdesktop">

## Get along with GitHub Desktop

- Regular activities using GitHub Desktop

	----
	## Option 1: Update fork &gt; pull to clone (browser)

	In this method, you update your fork repo first and then pull origin to the clone.

	1. Update the fork repo from upstream main using a **browser** - *fetch and merge*
	1. Update the clone from fork using **Github Desktop** - *pull origin*

		----
		## 1. To update fork from upstream main (browser)

		1. Log in to your Github account in a browser.

		1. Go to your fork repo `<your-account>/learning-library`.   
		   The **Code** tab displays a message.

			```
			This branch is xx commits behind oracle:main.
			```

		1. Click **Fetch upstream** &gt; **Fetch and merge**.  
		   Verify that you have <i>Successfully fetched and fast-forwarded from upstream oracle:main</i>.

			```
			This branch is even with oracle:main.
			```

		The fork repo is now updated.

		----
		## 2. To update clone from fork (GitHub Desktop)

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
	## Option 2: Update clone &gt; push to fork (GitHub Desktop)

	Update both clone and fork together using GitHub Desktop.

	1. Open **GitHub Desktop**.

	1. From **Branch** &gt; select **Merge into current branch**.

	1. The default branch selected is *main*.   
	   Under Other branches, select *upstream/main*. It displays a message.

		```
		This will merge xx commits from upstream/main into main
		```

	1. Click **Create a merge commit**. It displays the message.

	    ```
	    Successfully merged upstream/main into main
	    ```

	   This step updates the clone.

	5. Click **Push origin**.  	
		This step updates the fork repo.

		From **Repository** &gt; select **View on GitHub** to open OLL master. Go to your fork repo and verify this message.

		 ```
		 This branch is not behind the upstream oracle:main.

		 No new commits to fetch. Enjoy your day!
		 ```

		----
		## Cite source
		[Video by Tom McGinn](https://otube.oracle.com/media/t/1_bxj0cfqf) on 30 July, 2020   
		In this video, I'll show you how to:  
		- Merge the production repo files with your fork and local clone, to ensure you have the latest/greatest files  
		- Commit changes you've made to your fork and review the changes  
		- Make a pull request

	----
	## Commit to main - from clone to fork

	To send the changes from the clone to the fork repo:

	1. Open **GitHub Desktop**.

	1. Add a *Summary* and a brief *Description*.

	1. Under **Changes**, verify that the impacted files are selected.

	1. Click **Commit to master**.

	1. Click **Push origin**.

	The changes from the local clone are pushed to the fork repo.

	> **Note**: It may take a few minutes for your fork to build the Github pages.

	----
	## Create a new clone from your fork

	After you fork the main repo, you can create a clone of the fork on your local system.

	1. Go to **File** &gt; **Clone repository** (keyboard shortcut **Ctrl**+**Shift**+**O**).

		![Clone menu option 1](./images/desktop/clone-01-menu-option1.png " ")

		Alternatively, click the arrow next to **Current repository** &gt; **Add** &gt; **Clone repository**.

		![Clone menu option 2](./images/desktop/clone-02-menu-option2.png " ")

		If you are logged in to Github, the desktop app displays all repos associated with your account under **Your repositories**.

	1. Select the repo that you want to clone, for example, *common*.

		![Select local path and create clone repo](./images/desktop/clone-03-select-repo-local-path.png " ")

		> **Note**: Check if the **Local path** is correct, or **Choose** a different path for the clone repo directory.

	If you add a new repo to GitHub Desktop, then you publish the branch for the first time.

	![Publish branch](./images/desktop/new-repo-publish-branch.png " ")

	----
	## Add existing clone to GitHub Desktop

	If you create a new clone using GitHub Desktop, then the window displays the repo under the account name. But if you have a clone already created using Git Bash or other sources, it will be not listed in GitHub Desktop automatically.

	However, you can add such existing clone repos to your GitHub Desktop application.

	1. From the **File** menu, select **Add local repository** (keyboard shortcut **Ctrl**+**O**).

		![Add local repo menu option 1](./images/desktop/clone-04-add-local-repo-menu-option1.png " ")

		Alternatively, click the arrow next to **Current repository** &gt; **Add** &gt; **Add existing repository**.

		![Add local repo menu option 2](./images/desktop/clone-05-add-local-repo-option2.png " ")

	1. **Choose** the **Local path** of the clone repo folder.

		![Choose local path](./images/desktop/clone-06-local-path.png " ")

	1. Select the clone repo folder in the browser window.

		![Select folder](./images/desktop/clone-07-select-folder.png " ")

		The Add local repository window displays the folder you selected.

	1. Click on **Add repository** to add the clone repository to GitHub Desktop.

		![Add clone repo](./images/desktop/clone-08-add-clone-repo.png " ")

		GitHub Desktop displays the repos under the associated account name.

		![All repos](./images/desktop/clone-09-all-repos.png " ")

		Similarly, you can remove clone repos from GitHub Desktop.

	----
	## Remove a clone and clone again

	If you do not want to manage a repo, you can remove it from GitHub Desktop. While removing a repo, you may choose to keep the files and folders on your system or delete them along.

	1. Right-click the repo, which you want to remove, and select **Remove**.

		![Remove option](./images/desktop/clone-10-remove-option.png " ")

		It displays a confirmation pop-up.

	1. Click **Remove** again to remove the clone repo from GitHub Desktop.

		![Remove repo](./images/desktop/clone-11-remove-repo.png " ")

		 > **Note**: To physically remove files and folders of the repo from your system, select the option **Also move this repository to Recycle Bin** in the above pop-up window. Optionally, this step may display a window for folder access permissions.   
		 Click **Continue** to delete the files and folders of the repo.

		 > ![Folder permission](./images/desktop/clone-12-folder-permission.png " ")

		If GitHub Desktop is unable to remove the clone repo, then it displays an error message.

		![Error removing repo](./images/desktop/clone-13-remove-repo-error.png " ")

	Alternatively, you can delete the clone from Windows Explorer or command line and then remove it from GitHub Desktop.

	1. Right-click the repo and select **Remove**.

		> **Tip**: Notice the exclamation sign within a triangle indicating that something is not right with the repo.

		![Remove option](./images/desktop/clone-14-remove-repo-option.png " ")

		It displays that it could not find the selected repo because it is either moved or deleted. You can either locate the repo on your system or create a clone again. However, for this task, remove the repo altogether.

	1. Click **Remove** again to remove the clone repo from GitHub Desktop.

		![Remove repo](./images/desktop/clone-15-remove-repo-deleted.png " ")

		If the clone is moved to another location, then you can **Locate** your clone to add it again.

		> **Note**: If you want to re-create the clone from your fork, then click **Clone Again**.

	----
	## Pull error - **Stash changes**

	You do a *pull origin* to update your clone but a message appears stating that some files would be overwritten.

	![Pull origin error - stash changes](./images/desktop/pull-error-01-stash.jpg " ")

	If you want to continue `pull origin` without losing the local changes, then click on **Stash changes and continue**. Your files remain unhurt, though they do not appear in the changes list anymore.

	> It is like storing in a recycle bin temporarily.

	If you do not want to keep the changes and throw them away, then click **Discard** to forget the changes permanently.

	Else, you can click **Restore** to get the local changes back in the changes list after the pull is complete.

	![Restore changes from stash](./images/desktop/pull-error-02-restore-stash.jpg " ")

	You can then continue from the same point where you stashed.

</if>

<if type="gitconcepts">

## Pull Requests (PRs) to push changes

- Submit PRs on remote repo and approve PRs

	----
	## Open your fork repo

	- **Option A: using a browser**

		1. Log on to your GitHub account in a browser.

		1. Go to your fork repo `<your-account>/<your-fork>`.

	- **Option B: using GitHub Desktop**

		1. Open GitHub Desktop.

		1. From **Branch** &gt; select **Create pull request**.  
			It opens main repo in a browser.

		1. Go to your fork repo `<your-account>/<your-fork>`.

	----
	## About PRs

	Want to merge your updated fork repo with remote repo? *submit a PR*.   
	After committing your changes to `main`, go to your fork repo and *create a PR*.

	As a moderator (administrator), you can perform tasks, such as review PRs, add comments, approve PRs and merge changes with the remote repo or even request the contributor for further changes.

	> **Tip**: A moderator can approve PRs from other users, but not their own.

	----
	## Submit a PR - <i>contributor</i>

	When you commit (push) your changes from the clone, using either git Desktop or git Bash, the fork displays the message.

	```
	This branch is 1 commit ahead of [head:repo]
	```

	![1 commit ahead](./images/github/fork-ahead-of-main.png " ")

	Submit a PR to merge your changes with the remote repo.

	1. From your fork repo, go to **Pull requests** &gt; **New pull request**.

		> **Note**: The page must display that you are **<i><font style="color:rgb(63,185,61);">Able to merge</font></i>** (in green). The arrow is from your fork (head repo) and points to OLL (base repo).

	1. Click **Create pull request**.

	1. Review the message for the PR.

		> **Note**: Do not forget to mention the workshop ID in the subject line of the message.

	1. Click **Create pull request** to submit the PR.   
		Github assigns each PR with a unique (incremental) ID and displays a message.

		```
		[user] wants to merge 1 commit into oracle:main from [user]:main
		```

	Done. Your PR is submitted for review. Github may send notification mails depending on your configuration. Next, one of the moderators (administrators) will review the PR and respond.

	> **Did you know..?**   
	When a user (contributor) submits a PR and it is under review (waiting for approval), further merging is blocked for the user. This means until the currently submitted PR is approved and merged (or rejected), the user cannot create another PR in parallel on the same repo.

	![PR submitted - merging blocked](./images/github/pr-submitted-merging-blocked.png " ")

	----
	## Approve a PR - <i>moderator</i>

	Approving a PR involves two major steps: *approve* and *merge*

	- **approve PR** - to accept the change request
	- **merge PR** - to integrate the modified files with the remote repo

	<ins>**Steps**</ins>

	1. Log on to Github in a web browser and open the repo where the PR is submitted.

	1. Go to the **Pull requests** tab.

		![PR tab - review required](./images/github/approve-pr-01-pr-tab.jpg " ")

		This tab contains a list of open PRs that require review and displays PR information, such as:
		- PR IDs
		- how many PRs are open and how many are closed
		- contributors who submitted the PRs
		- time when the PRs were submitted

		You can click **Closed** to view the closed PRs.

	1. Click a PR title or summary to view details of the PR.

		![PR details](./images/github/approve-pr-02-pr-details.jpg " ")

		It opens the Conversation tab and displays commit description, if any. It also shows how many commits requested and the number of files changed.

	1. Click **Files changed** to view the modified files and their changes.

		![Files changed](./images/github/approve-pr-03-files-changed.png " ")

	1. Click **Review changes** on the right to open a window for adding comments and to submit your review.

		In this window, you can submit your review as follows:
		- add comments without approving PR
		- approve PR along with your comments
		- request further changes

		![Review changes](./images/github/approve-pr-04-review-changes-submit-approval.jpg " ")

		Optionally, you may add comments in the box.

	1. Select *Approve* and then &gt; click **Submit review** to finish the review and approve the PR.   
		Github displays a message to confirm that you have submitted your review.

		![Review submitted](./images/github/approve-pr-05-review-submitted.jpg " ")


		> **Note**: Approving a PR means the change request is accepted. However, the changes are not reflected on the remote repo until the files are merged.

	1. Select **Merge pull request** to proceed with merging.

		![Merge PR](./images/github/approve-pr-06-merge-pr.jpg " ")

		Click **Confirm merge** to start the merge and to close the PR.   
		It integrates the changes from the contributor's fork and updates the files on the remote repo.

		![Confirm merge](./images/github/approve-pr-07-confirm-merge.jpg " ")

		Optionally, you may add comments in the box and click **Comment**.

	You have approved PR the and merged the changes. Github may send notification mails depending on your configuration. The changes will be available on the remote repo after the build and deployment workflow completes.

</if>

<if type="gitbash">

## Take a plunge into *Git Bash*

 - Learn about stage, commit, push, pull, fetch, git configurations, and other commonly used commands

	----
	## All about commit

	The main steps for pushing the local changes from the clone to the fork repo -

	1. Display local changes
	1. Stage files for committing
	1. Commit to main
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

			> **Tip**: It is a good practice to view git status at the beginning and also in between or at the end before commit, to verify the correct files are included in the commit.

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
				$ <copy>git add *install-em*</copy>
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

			**Use case**: You have staged your modified files in the clone but not yet committed to main repo. You want to bring them back and make more changes to the staged files, before committing.

			You can undo staging without hurting the files or losing your local changes. This will bring the staged files back into their previous unstaged condition but will not affect the content changes.

			 > **Note**: This command is *safe* to use.

			 - To unstage a single file:

				```
				$ <copy>git restore --staged [file-name full-path]</copy>
				```

				Note the flag **--staged** used in this command. If you do not use this flag, then all local changes will be lost ***permanently***.

			 - To unstage everything but keep your local changes intact:

				```
				$ <copy>git reset</copy>
				```

			**See also** *Discard local changes*

			----
			## Discard local changes

			**Use case**: The local changes in the clone are incorrect and you want the files back from the main repo.

			<i>DO NOT</i> use these, unless you want to discard all changes made in the clone and update from main repo.

			```
			$ git restore [file-name]...
			$ git restore *.*
			$ git restore .
			```

			**Warning**: All local changes will be **lost forever**.

			The `git restore` command without the *--staged* flag will forget all local changes. This command is irreversible, you cannot retrieve the discarded changes ever again.

			> **Note**: If you stage some files followed by `git restore`, then all unstaged files (local changes) will be lost but the files that are already staged will remain intact, ready for committing.

			**See also** *un-stage a file*

		----
		## 3. Commit to main

		1. Initiate the commit (without any flags).  

			```
			$ <copy>git commit</copy>
			```

			This command opens a file in an editor where you can enter the details, including the <i>summary</i> and <i>description</i>.

			> **Note**: The first line is the <i>summary</i> and remaining portion is the <i>description</i>. Leave an empty line between the summary and description.

		1. Save the file for commit, *:wq*.

			Another option is, quit without saving, *:q!*. This will cancel the commit and go back to staging.

			**Scenario**  
			Suppose, you forgot to stage some files, or want to un-stage a wrong file, you can quit without saving and cancel the commit.

			> **Note**: Git Bash does not commit with an empty file.

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

		After the files are committed to main repo, `push origin` from clone to fork.

		```
		$ <copy>git push origin main</copy>
		```

	----
	## Update fork and clone :: fetch and merge ::

	- You have multiple ways to update the clone and the fork repo.

		----
		## Option 1: Update clone &gt; push to fork

		Update the clone from OLL master and then push the changes from clone to fork.

		1.  ```
			$ <copy>git checkout main</copy>
			```

		1. 	```
			$ <copy>git fetch upstream main</copy>
			```

		1. 	```
			$ <copy>git merge upstream/main</copy>
			```

			The changes in OLL master are merged with the clone. The clone is up-to-date with OLL master.

		1. 	```
			$ <copy>git push origin main</copy>
			```

			The updates in the clone are pushed to the fork repo. Both clone and fork are in sync with OLL master.

		----
		## Option 2: Update fork &gt; pull to clone

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

		> **Note**: Encode `@` in username with `%40`.

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

	1. 	Commit the file to main repo with a message, <i>first commit</i>.

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

	----
	## Check existing remotes

	 - Option 1

		```
		$ <copy>git remote -v</copy>
		```

	 - Option 2

		```
		$  <copy>git remote show origin</copy>
		```

		```
		* remote origin
		  Fetch URL: https://github.com/<your-account>/<your-repo>.git
		  Push  URL: https://github.com/<your-account>/<your-repo>.git
		  HEAD branch: main
		  Remote branches:
			main    tracked
			sub-dev tracked
		  Local branch configured for 'git pull':
			main merges with remote main
		  Local ref configured for 'git push':
			main pushes to main (up to date)
		```

	 - Option 3

		```
		$ <copy>git config -e</copy>
		```

		```
		[core]
				repositoryformatversion = 0
				filemode = false
				bare = false
				logallrefupdates = true
				symlinks = false
				ignorecase = true
		[submodule]
				active = .
		[remote "origin"]
				url = https://github.com/<your-account>/<your-repo>.git
				fetch = +refs/heads/*:refs/remotes/origin/*
		[branch "main"]
				remote = origin
				merge = refs/heads/main

		```

		Press **Esc + :q** to quit without saving.

	 - Check all branches

		```
		$ <copy>git branch -a</copy>
		```

		```
		* main
		  sub-dev
		  remotes/origin/HEAD -> origin/main
		  remotes/origin/main
		  remotes/origin/sub-dev
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

		$ git clone https://github.com/[your-account]/[your-repo]
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

	> **Note**: This command will create a folder *`northern-lights`* and clone the repo from the given URL.

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

	----
	### Yet to be tested (not verified)

	- `git revert`   
	create a new commit with the changes that are rolled back.

## Check for disallowed words

To check for disallowed words, download this script on your local system, if not already downloaded, and run it on your labs.

- [wordlist](https://bit.ly/wordlist-mg)

	This script contains a piece of code that checks for restricted words according to Oracle Documentation Style Guide (OSG).

	----
	## Run the script

	1. Open git bash and go to the topmost (workshop) level where the content resides.

		```
		$ <copy>cd github/your-repo/your-workshop-folder</copy>
		```

	1. Specify the full path of the script *`wordlist`* and press **Enter** to run it.

		```
		$ <copy>~/Downloads/wordlist</copy>
		```

		In this example, the script is located in the `Downloads` folder.

	1. The script prompts you to save the results to an `output.txt` file in the `Downloads` folder.

		```
		$ <copy>your-account/Downloads/output.txt</copy>
		```

		Press **y** to save the output file or press **n** or **Enter** to ignore.

		> **Note**: As the `output.txt` file is created in bash (Linux-based), if you view it in Windows, then it may display some junk characters because of conversion between operating systems.

		Viewing the same file in Git Bash does not display any junk characters.

		```
		$ <copy>cat ~/Downloads/output.txt</copy>
		```

	----
	**Results**

	![Disallowed words search results](./images/gitbash/disallowed-words-01-script-results.png " ")

	The script checks whether the workshop contains any disallowed words. If it finds any such word, then it displays result with the following details -
	- <font style="color:rgb(177,72,198);">**file name with full path**</font>
	- <font style="color:rgb(28,168,0);">**line number**</font>
	- <font style="color:rgb(255,118,118);">**disallowed word or incorrect usage**</font>

	----
	## Run script without full path

	You can run this script as a command from any location without specifying the full path. To achieve this, set the environment variable *`$PATH`* depending on the operating system.  

	> ***Warning***: Exercise *<ins>utmost caution</ins>* while doing these.

	----
	**For Windows**

	1. Right-click **My Computer** or **This PC** &gt; select **Properties** and open **Advanced system settings**.

		![This PC properties](./images/gitbash/disallowed-words-02-thispc-properties.png " ")

	1. In the **Advanced** tab &gt; click **Environment Variables**.

		![Advanced system properties](./images/gitbash/disallowed-words-03-advanced-sys-properties.png " ")

		The window displays user variables for your acount and system variables.

	1. Under **System variables**, select *Path* and click **Edit** to modify the variable.

		![System variable Path - edit](./images/gitbash/disallowed-words-04-sys-var-path-edit.png " ")

	1. Click **New** and then **Browse** to add the location where the script *wordlist* exists.

		![Environment variable Path - new](./images/gitbash/disallowed-words-05-env-var-path-new.png " ")

		> **Caution**: Ensure that you click **New** and browse to the location of the script.   
		DO NOT edit anything in the Edit environment variable window. Clicking edit will overwrite an existing variable and your system may face serious consequences.

	Click **OK** for all three windows to save your changes and close them.

	You have successfully set the environment variable *$PATH* for Windows system. Similarly, you can set the variable for a Linux system.

	----
	**For Linux**

	It is pretty much quick.

	1. Edit the *`.bashrc`* file.   
		Usually, the system files `.bashrc` and `.bash_profile` are located in the home folder under `your-account`.

		 - Windows: `C:\Users\your-account`
		 - Linux: `/home/your-account`

	1. Add the following lines and include the full path of the script file to set the *`$PATH`* variable.

		```
		<copy>export PATH=~/Downloads/:$PATH
		export PATH=/d/git/GitHub/:$PATH</copy>
		```

	The *$PATH* variable is now set.

	Restart git Bash for the variable to take effect. When you open a new git Bash window, type *wordlist* without the full path to run the script.

	> **Tip**: Git Bash automatically picks up environment variables defined in your system.

	----
	## Need more explanation?

	**Background**   
	OSG recommends a **[Word List](https://docs-uat.us.oracle.com/en/sptest/osgxx/word-list.html)** preferred by the National Standards Organization (NISO). For more information about the NISO sort order, see [Sorting Glossary Entries](https://docs-uat.us.oracle.com/en/sptest/osgxx/sorting-glossary-entries.html#GUID-3219677E-95D8-45FC-92EA-CA554D1E1162).

	| What the script does                | What the script does not do |
	|-------------------------------------|-----------------------------|
	| Looks for disallowed words across all labs in each subfolder      | Does not perform english grammar checks   |
	| Exclude files, such as images, `index.html`, and `manifest.json`  | Include files in markdown (or text) format |
	| Checks for most, if not all, words mentioned in the style guide   |  Does not check the `*.docx` files   |
	| Provides option to save the output to a file  |  Does not fix the issues automatically |

	Glance the piece of code inside the script -

	```
	$ <copy>grep -wrEniTaH -B 0 --color=always 'abort|above|admin|afterwards|alive|allow|alphabetical|alphanumerical|all right|amongst|analogue|and/or|anti|as-of date|as per|associate to|auto|backend|backwards|be sure|behave|behavior|below|blacklist|blocksize|boot|bulletted|cancell|can not|case-insensitive|categorise|checkbox|checkmark|check list|choose|classpath|click on|client-server|clusterwide|clipboard|coexist|colour|comment out|comprise|consideration|controlfile|crash|datacenter|datadictionary|datafile|dataguide|dataset|datatype|datawarehouse|deactivate|dead|deconfigure|de-install|dependant|desireable|desire|dialogue box|done|dumb|easy|easier|else|execute|fat client|fatal|filename|fileserver|filesystem|forwards|grey|gray scale|hang|hard code|hard copy|high level|hit|homepage|hot fix|hot keys|hotspot|hyperlink|hyper text|illegal|info|initiate|initiating|input|inter-related|invoke|irrecoverable|issue|joy stick|judgement|keep in mind|kill|lower|left-hand|legal|leverage|licence|like|linearise|link|list box|live|log into|logoff|lower|lower--case|machine|machine-learning|mailstop|mail box|main frame|master|mathematic|menubar|menu option|meta data|mice|moveable|DOS prompt|need to|needs to|non-existent|nonrecoverable|non-volatile|normal|numerical|off.line|on-premise|once|on-line|on-site|onwards|open-source|output|outwards|outdent|over-estimate|over-ride|please|pop-up|possesses|postal code|post.installation|pre-configure|pre-define|pre-existing|prepend|preventative|pull-down|queueing|read-write|reboot|reoccur|removeable|right-hand|run-time|scroll bar|should|sign-in|slave|slider|soft copy|stylesheet|sub-menu|sub-system|tar|tick mark|time-zone|time-line|to-do|tool-bar|tool-tip|top-most|towards|untar|unzip|upper.case|up-time|upwards|username|utilize|via|victim|webpage|web-page|webserver|web-server|web.site|where|whitelist|wish|[cw]ould|zip' --exclude={\*prepare-setup\*,\*manifest\*,\*initialize-environment\*,\*index.html,\*.png,\*.jpg} </copy>
	```

	### Qualifiers

	*grep* (Global Regular Expression Print)

	- **`'text1|text2|textn'`** - separate different words with pipes to search for multiple patterns (or words) together
	- **`r`**, *`--recursive`* - include subdirectories
	- **`E`**, *`--extended-regexp`* - extended regular expression
	- **`n`**, *`--line-number`* - prints line number
	- **`i`**, *`--ignore-case`* - for case independent
	- **`T`**, *`--initial-tab`* - shows tab spacing
	- **`a`**, *`--text`* - equivalent to --binary-files=text
	- **`H`**, *`--with-filename`* - prints file name
	- **`B 0`**, *`--before-context=x`* - prints `x` lines before the context; keep `0` to exclude extra lines
	- **`color=always`**, *`--colour[=WHEN]`* - use color markers to highlight
	- **`--exclude=filename`** - skips this single file or directory
	- **`--exclude={`\*.png,\*.jpg`}`** - skips multiple files and directories together; use backslash  `\` to escape characters

	More qualifiers -

	- `c`, `--count` - shows count of words
	- `h`, `--no-filename` - hides the file names
	- `l`, `--files-with-matches` - displays only file names containing matches
	- `L`, `--files-without-matches` - displays only file names without matches
	- `o`, `--only-matching` - shows only matching part
	- `R`, `--dereference-recursive` - recursive and also follow symbolic links
	- `v`, `--invert-match` - invert match; displays all but matched words
	- `w`, `--word-regexp` - match only whole words
	- `z`, `--null-data` - displays entire contents of matching files

	Other search options -

	```
	$ grep -e pattern1 -e pattern2 filename-or-filepath
	$ awk '/error|critical/failed/' /var/log/httpd/error_log
	$ sed -e '/error/b' -e '/critcial/b' -e d /var/log/apache/nixcraft.com_error_log
	```

	**Cite**

	- [linuxize - using grep](https://linuxize.com/post/how-to-use-grep-command-to-search-files-in-linux/)

	- [cyberciti - search mutliple words](https://www.cyberciti.biz/faq/searching-multiple-words-string-using-grep/)

	- [phoenixnap - mutliple patterns](https://phoenixnap.com/kb/grep-multiple-strings)

	- [linuxhint - prompt for input](https://linuxhint.com/prompt-for-input-bash/)

</if>

## Code editors and plugins

 - Install plugins for code editors

	----
	## Know your plugins

	***Live Server plugin***    
	Plugins are extensions of a code editor. For a workshop to run locally from the clone, it requires a <i>Live Server plugin</i> for the code editor.  

	Depending on the code editor, **Atom** or **Visual Studio Code**, install the corresponding live server plugin.

	| Code Editor        | Live Server Plugin      | Version       | Credits            |
	|--------------------|-------------------------|:-------------:|--------------------|
	| Atom               | `atom-live-server`      | 2.3.0         | <i>jas-chen</i>    |
	| Atom               | `atom-live-server-plus` | 3.0.1         | <i>richiksc</i>    |
	| Visual Studio Code | `Live Server`           | 5.7.9         | <i>Ritwick Dey</i> |

	Other VS Code plugins -

	 - `Trailing Spaces` v0.4.1 - <i>Shardul Mahadik</i>
	 - `Path IntelliSense` v2.8.3 - <i>Christian Kohler</i>
	 - `Code Spell Checker` v2.11.1 - <i>Street Code Software</i>
	 - `markdownlint` v0.48.1 - <i>David Anson</i>

	<!--

	### **Other VS Code plugins**

	| VS Code Plugin              | Version       | Credits                      |
	|-----------------------------|:-------------:|------------------------------|
	| `Trailing Spaces`           | 0.4.1         | <i>Shardul Mahadik</i>       |
	| `Path Intellisense`         | 2.8.3         | <i>Christian Kohler</i>      |
	| `Code Spell Checker`        | 2.11.1        | <i>Street Code Software</i>  |
	| `markdownlint`              | 0.48.1        | <i>David Anson</i>           |

	-->

	![VS Code Plugins](./images/editors/vscode-plugins-all.png " ")

	> **Note**: Install the editor first, followed by the plugin.

	----
	## Visual Studio Code editor

	Visual Studio Code is available for free download from its official site, [here](https://code.visualstudio.com/download).

	Select the installer type based on the operating system -
	 - Windows
	 - Linux (Debian, Ubuntu, RH, etc.)
	 - Mac

	Run the installer and install VS Code on your system. It hardly takes a few blinks of eye, if one of your lucky days.

	For this lab, the (latest) versions used are -
	 - Visual Studio Code *1.72*   
	   for Windows 8, 10, 11 (`VSCodeUserSetup-x64-1.72.2.exe`)
	 - Live Server plugin *5.7.9*

	If you already have VS Code, then skip this and jump to the plugins section.

	> **Did you know..?**   
	You do not require VS Code editor installed on your system. Open a `markdown.md` file in *`github.dev`* and it opens the file in VS Code editor in a web browser (online).

	----
	## Live Server plugin for VS Code

	### *Install Live Server*

	1. Open the VS Code editor and click the **Extensions** icon in the left menu to open the plugins manager.

		![VS Code - Extensions](./images/editors/vscode-plugin-live-server-install1.png " ")

	1. Search for *Live Server*. Under Live Server, click **Install** to start installing live server.

		![Install Live Server plugin](./images/editors/vscode-plugin-live-server-install2.png " ")

	1.	On completion, click on **Live Server** to verify that the plugin is installed.

		![Live Server installed](./images/editors/vscode-plugin-live-server-install3.png " ")

		You can now run the Live Server plugin from VS Code.

	### *Run Live Server*

	To run Live Server, you must have a folder in your VS Code workspace.

	1. Click **File** &gt; **Open Folder**.

		![Open folder in workspace](./images/editors/vscode-workspace-open-folder.png " ")

		Browse for the project folder (clone directory) and add it to your workshop.   
		Alternatively, you can right-click the explorer and **Add Folder to Workspace**.

		![Add folder to workspace](./images/editors/vscode-workspace-add-folder.png " ")

		> **Tip**: Adding folders to workspace is a one-time activity. If you have added one or more folders to your workspace already, next time onwards you can directly run the live server.

	1. Click on **Go Live** at the bottom-right corner to run the live server.

		![Run Live Server](./images/editors/vscode-run-live-server.png " ")

		It opens the Live Server page (clone directory) in your default browser with the URL  `http://127.0.0.1:5500/`.

		> **Tip**: Unlike Atom, keep the VS Code window open (or minimized) while working on your clone. If you close the VS Code window, Live Server stops and you cannot view the pages anymore.

		If you have more than one folder in your VS Code workspace, while you run the live server it may ask which folder to select for the live server.

		> **Did you know..?**   
		For the Live Server to render output, your system must be connected to the internet.

	### *Close Live Server*

	 - Click *Port : 5500* at the bottom-right corner of VS Code window to stop Live Server.

		![Close Live Server](./images/editors/vscode-close-live-server.png " ")

		> Another option is to install the Live Server plugin from [here](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer).

		----
		## Cite reference

		 - [Visual Studio Code for Markdown Development](https://confluence.oraclecorp.com/confluence/display/DBIDDP/Visual+Studio+Code+for+Markdown+Development)

		----
		## Other plugins for VS Code

		Additional plugins to install for VS Code -

		 - **Trailing Spaces**   
			Highlight trailing spaces and remove them

			![VS Code - Trailing Spaces plugin](./images/editors/vscode-plugin-trailing-spaces.png " ")

		 - **Path Intellisense**   
			Browse and select files and folders in `manifest.json`

			![VS Code - Path Intellisense plugin](./images/editors/vscode-plugin-path-intellisense.png " ")

		 - **Code Spell Checker**   
			Check spellings in the files

			![VS Code - Code Spell Checker plugin](./images/editors/vscode-plugin-code-spell-checker.png " ")

		 - **markdownlint**   
			Styling and lint checker for labs

			![VS Code - markdownlint plugin](./images/editors/vscode-plugin-md-lint.png " ")

	----
	## Live Server plugins for Atom

	 Install as required

	![Atom live server plugins](./images/editors/atom-live-server-plugins.png " ")

	----
	## Notepad++: column mode

	**Use case**  
	You want to select the text in column mode.

	**What to do**  
	 - Keeping **Shift** and **Alt** pressed, use the cursor keys to select the text in column mode.
	 - Use **Alt** + drag the Mouse

	> **Note**: I prefer the second option, <i>Shift+Alt</i> and cursor keys.

## Tricks up-the-sleeves

- Scenarios, solutions, troubleshooting options, good practices

	<if type="gitbash">

	----
	## Git Bash :: default start location ::

	**Problem statement**  
	You want to change the default directory to start in when you open Git Bash.

	**What to do**  
	A quick way to set the default start location (without installing `msysgit`) -

	1. Right-click Git Bash (shortcut icon) &gt; select **Properties**.

		Default -

		- **Target** - *"C:\Program Files\Git\git-bash.exe" --cd-to-home*
		- **Start in** - *%HOMEDRIVE%%HOMEPATH%*

	1. Modify **Start in** and point to the desired location, preferably the directory where your Clone resides.   
	   Remove --cd-to-home.

		Change to -

		- **Target** - *"C:\Program Files\Git\git-bash.exe"*   
		- **Start in** - `[desired-location]` for example *D:\GitHub*

		> **Note**: Do not forget to delete `--cd to home` from **Target**, otherwise the **Start in** value gets overridden.

		----
		## Okay, show the screenshot >>

		![Git Bash start in](./images/gitbash/gitbash-startin.jpg " ")

	</if>

	----
	## The fork is ahead of main repo?

	**Problem statement**  
	Your fork says -

	```
	Your branch is X commits ahead
	```

	![Fork ahead of main](./images/desktop/rebase-01-fork-ahead.png " ")

	You do a `fetch origin`, `merge upstream/main`, and `push origin`. This updates both clone and fork repo with main repo. However, you get a *commits mismatch* message on your fork.

	This means that your fork is not fully synced with main repo. If you get this message on your fork, how to clean this up without submitting a pull request to main repo?

	**What to do**  
	Bring your fork repo in sync with main repo (fully up-to-date).

	<if type="gitdesktop">

	In GitHub Desktop -

	1. Go to **Branch** &gt; **Rebase current branch**.

		![Rebase branch menu](./images/desktop/rebase-02-rebase-menu.png " ")

	1. In the Rebase main window, select the branch *upstream/main* and click **Rebase**.

		![Select branch](./images/desktop/rebase-03-select-branch.png " ")

		GitHub Desktop starts the rebase and displays the commits.

		![Rebase in progress](./images/desktop/rebase-04-rebase-progress.png " ")

		GitHub Desktop gives an option to force push with all ahead and behind commits.

	1. Click on **Force push origin** to rewrite history on `origin/main`.   
		The window displays a pop-up to confirm this action. Click on **I'm sure** to proceed.

		![Rebase force push](./images/desktop/rebase-05-force-push.png " ")

	</if>

	<if type="gitbash">

	From Git Bash -

	1. Go to the clone directory.

	1.	```
		$ <copy>git fetch upstream</copy>
		```

	1.	```
		$ <copy>git checkout main</copy>
		```

		----
		## Result

		```
		Already on 'main'
		Your branch is up to date with 'origin/main'.
		```

	1.	```
		$ <copy>git reset --hard upstream/main</copy>
		```

		----
		## Result

		```
		Updating files: 100% (1126/1126), done.
		HEAD is now at e7edee3254 Update title (#4398)
		```

	1.	```
		$ <copy>git push --force</copy>
		```

		----
		## Result

		```
		Total 0 (delta 0), reused 0 (delta 0), pack-reused 0
		To https://github.com/manish-garodia/learning-library.git
		 + bf93e2e310...e7edee3254 main -> main (forced update)
		```

	1.	```
		$ <copy>git checkout main</copy>
		```

		----
		## Result

		```
		Already on 'main'
		Your branch is up to date with 'origin/main'.
		```

	1. 	```
		$ <copy>git rebase main</copy>
		```

		----
		## Result

		```
		Current branch main is up to date.
		```

	1. 	```
		$ <copy>git push -u origin main</copy>
		```

		----
		## Result

		```
		Everything up-to-date
		Branch 'main' set up to track remote branch 'main' from 'origin'.
		```

	</if>

		----
		## Need an explanation?

		Here, <if type="gitbash">*`git reset --hard upstream/main`*</if> <if type="gitdesktop">*Rebase current branch*</if> will `reset main HEAD` on the updated `upstream/main`, in order for `main` to reflect the exact same history as the one in the remote repo.

		But since some commits where previously done on main repo and pushed on the fork (`origin/main`), you would need to replace that history with the new main state. Hence, <if type="gitbash">*`git push --force`*</if> <if type="gitdesktop">*`force push origin`*</if>.

		Now, rebasing `mybranch` allows those current patches to be based on the most up-to-date commit in the remote repo.

	Refresh the browser page for the fork. You will see that the fork is now up to date with main repo.

	![Rebase successful, fork up-to-date](./images/desktop/rebase-06-fork-uptodate.png " ")

	----
	## GitHub pages: build i/o failure?

	**Problem statement**  
	You made changes to your clone and push them out to your fork. You wait for a while but github refuses to render the output. Github does not generate the IO pages and returns a `404`.

	![Github pages build I/O failure - 404](./images/github/gh-pages-01-build-io-failure.png " ")

	**What went wrong**  
	To render the IO pages, all jobs related to build and deployment must complete successfully. In this case, one or more critical jobs failed to complete.

	**What to do**  
	Debug the build workflow to narrow down the root cause, fix the issue, and build again.

	1. Log in to `github.com` in a web browser and go to the repo, which has the build problem.

	1. Click the **Actions** tab to view all workflows.

		![Action - All workflows](./images/github/gh-pages-02-action-all-workflows.jpg " ")

		The workflows page displays github pages build and deployment with icons to indicate the status.

		- A <font style="color:rgb(221,173,13);">**yellow circle**</font> indicates build in-progress
		- A <font style="color:rgb(64,191,78);">**green tick**</font> indicates success
		- A <font style="color:rgb(242,81,73);">**red cross**</font> indicates failure
		- A **transparent exclamation (`!`)** implies that the build did not complete or was cancelled

	1.	Identify the (latest) workflow that failed (with a red cross). Click *pages build and deployment* to view details of the build.

		![Failed workflow - pages build and deployment](./images/github/gh-pages-03-pages-build-and-deployment.jpg " ")

		A build workflow runs three primary jobs: *build* • *report-build-status* • *deploy*. Notice the icon next to each job. The job that failed shows a red cross.

	1. Depending on the issue, you can re-run only *failed jobs* or re-run *all jobs* and try to build again.

		<table class="table">			
			<tr align = "center" style="font-weight:bold">
				<td><img src="https://i.ibb.co/HCrGVzj/gh-pages-04-rerun-failed-jobs.jpg" alt="Re-run failed jobs"><p>Re-run failed jobs</p></td>
				<td><img src="https://i.ibb.co/jgCjJhn/gh-pages-05-rerun-all-jobs.jpg" alt="Re-run all jobs"><p>Re-run all jobs</p></td>
			</tr>
		</table>

	1. If the job fails again, then click the failed job (with the red cross) to find the root cause and debug the issue. In this example, the *`build`* job ran into issues.

		![Build job failed - debug](./images/github/gh-pages-06-build-job-failure-debug.jpg " ")

		Scroll down to parse through the job details. It highlights the issue and displays the file name with full path and line number.

	1. Fix the issue as applicable and `push` from clone to fork.

		You can wait for Github to build the I/O pages automatically or re-run the jobs manually as explained earlier.

		![Build job success](./images/github/gh-pages-07-build-job-success.jpg " ")

		On completion, all jobs in the build and deployment workflow displays green ticks indicating success.

	----
	## Rename objects in GitHub

	**Problem statement**  
	You want to rename files or folders in your repo, but GitHub does not reflect your changes.

	**What to do**  
	Applicable to both - <i>files</i> and <i>folders</i>.

	> **Tip**: When you create a new file or folder in your clone, before doing a *`push`*, you can rename it directly in Windows Explorer.   
	Renaming an existing file or folder does not work in Windows Explorer. Either use Git Bash or try the workarounds explained here.

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
		1. Go to the file and &gt; select **Edit file**.
		1. Place the cursor at the first character of the file name and hit backspace.

	- **Using Windows Explorer**
		1. Move the file to another location, outside the Clone.
		1. Right-click (F2) and rename.
		1. Copy the file back to the original location with the new name.

		> **Note**: Renaming a file or a folder at the same location in Windows Explorer does not help because the names are not case-sensitive.

	- **Final option**: if all the above failed, take the long route -
		1. Delete the file (or move it out to another location)
		1. Create a folder with the new name (or rename at another location and copy it back).
		1. Commit to main repo with the new name.

		Use this option as the last resort.


	----
	## Clone and fork out-of-sync - [push origin failed]

	**Problem statement**  
	You made changes in your clone and want to merge them with the fork. You did `commit to main` and then *`push origin`* to update the fork from the clone but it returns an error.

	<if type="gitdesktop">
	![Update fork from clone rejected](./images/desktop/clone-out-of-sync-01-push-failed.jpg " ")
	</if>

	<if type="gitbash">

	```
	$ <copy>git push origin main</copy>

	To https://github.com/[your-account]/[your-repo]
	 ! [rejected]        main -> main (non-fast-forward)
	error: failed to push some refs to 'https://github.com/[your-account]/[your-repo]'
	hint: Updates were rejected because the tip of your current branch is behind
	hint: its remote counterpart. Integrate the remote changes (e.g.
	hint: 'git pull ...') before pushing again.
	hint: See the 'Note about fast-forwards' in 'git push --help' for details.
	```

	![Update fork from clone rejected](./images/desktop/update-fork-from-clone-rejected.png " ")

	</if>

	**What happened**   
	You arrived at a conflict between the clone and the fork. The fork is already up-to-date with more recent commits that are not pulled to the clone. In short, you are modifying the clone while it is already behind the fork.

	**What to do**

	<ins>Option 1</ins> -

	1. Fetch the commits from fork.

	<if type="gitbash">

		```
		$ <copy>git fetch origin main</copy>
		```
	</if>

	1. Instead of `push origin`, run *`pull origin`* to update the clone.

	<if type="gitdesktop">

		![Pull origin](./images/desktop/clone-out-of-sync-02-pull-origin.jpg " ")

	</if>

	<if type="gitbash">

		```
		$ <copy>git pull origin main</copy>
		```

		If you still get a conflict, then try Option 2.

		```
		CONFLICT (modify/delete): readme.md deleted in 921c3ada40b3848f5c2b36c5af6123224cfcc3ca and modified in HEAD.  Version HEAD of readme.md left in tree.
		Automatic merge failed; fix conflicts and then commit the result.
		```

	</if>

	<if type="gitdesktop">

	1. Now *`push origin`* to merge the changes from clone (local) to fork (remote repo)

		![Push origin](./images/desktop/clone-out-of-sync-03-push-origin.jpg " ")

	</if>

	<ins>Option 2</ins> -

	Assuming the above fails, try these out.

	1. Discard the local changes in the clone.

	<if type="gitdesktop">
		![Discard changes](./images/desktop/discard-local-changes.png " ")
	</if>

	1. Update the clone from the fork.

	<if type="gitbash">

		```
		$ <copy>git fetch origin main</copy>
		```

		```
		$ <copy>git pull --all</copy>
		```

	</if>

	1. Redo the changes again locally and then try to merge/push to the fork.

	> **Tip**: For double-safety, keep backups of the local changes made in the clone.

	</if>

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

	> **Note**: Do this just after the `commit` command, before issuing a `push origin`.

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

	You did `commit to main` but did not `push origin` yet.

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

	 ![git rebase options](./images/gitbash/git-commit-rebase.png " ")

		 > **Note**: Press **i** to enter the **Edit** mode.

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

	> **Note**: Git returns an error if you have unstaged changed in your clone. Stage them first (`git add`) before issuing `git rebase -i`.

	![Git rebase unstaged files](./images/gitbash/rebase-error.png " ")

	**Scenario 2** - *After `push origin`*

	You did not only `commit to main` but also `push origin`. Can such commits be modified?

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
		 create mode 100644 Live/dba-essentials/em-dba/access-homepage/images/em-dbhome-001-expandall.png
		 create mode 100644 Live/dba-essentials/em-dba/access-homepage/images/em-dbhome-002-dblist.png
		 create mode 100644 Live/dba-essentials/em-dba/access-homepage/images/em-dbhome-003-instancehome.png
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

		----
		## Cite reference

		[Virtual geek on vcloud-lab](http://vcloud-lab.com/entries/devops/resolved-git-warning-lf-will-be-replaced-by-crlf-in-file)

	----
	## Move files/folders to another repo (with history)

	**Problem statement**  
	You got some files and folders in a repo, `source-repo`. You want to move them to another repo, `target-repo`, while preserving git history. That is, you not only transfer the files and folders to a different repo but also carry along the history of commits.

	Is it possible? Let's find out!

	**What to do**  

	1. Go to the source repo where the files/folders are located.

	1. Run this command to exclude all other commits in the source repo and keep only the folder that you want to move and its history.

		```
		$ <copy>git filter-branch --subdirectory-filter &lt;folder-to-move&gt; -- --all</copy>
		```

		Check the output (ignore the warnings)

		```
		WARNING: git-filter-branch has a glut of gotchas generating mangled history
				 rewrites.  Hit Ctrl-C before proceeding to abort, then use an
				 alternative filtering tool such as 'git filter-repo'
				 (https://github.com/newren/git-filter-repo/) instead.  See the
				 filter-branch manual page for more details; to squelch this warning,
				 set FILTER_BRANCH_SQUELCH_WARNING=1.
		Proceeding with filter-branch...

		Rewrite 8b09f9a3832ae6794bbefeb0e90a77ae1859aa76 (3/3) (1 seconds passed, remaining 0 predicted)
		Ref 'refs/heads/main' was rewritten
		Ref 'refs/remotes/origin/main' was rewritten
		WARNING: Ref 'refs/remotes/origin/main' is unchanged
		```

		It clears all the remaining folders and cleanses the clone. This is all about preparing your source repo.

	1. Go to the target repo, where you want to move the folder.

		```
		$ <copy>cd ../target-repo</copy>
		```

	1. Add the source repo as a local remote.

		```
		$ <copy>git remote add source-repo ../source-repo</copy>
		```

	1. Fetch the local remote (source-repo).

		```
		$ <copy>git fetch source-repo</copy>
		```

		```
		remote: Enumerating objects: 9, done.
		remote: Counting objects: 100% (9/9), done.
		remote: Compressing objects: 100% (3/3), done.
		remote: Total 9 (delta 0), reused 6 (delta 0), pack-reused 0
		Unpacking objects: 100% (9/9), 724 bytes | 2.00 KiB/s, done.
		From ../source-repo
		 * [new branch]      main       -> source-repo/main
		```

	1. Create a branch from the source's main.

		```
		$ <copy>git branch source-repo remotes/source-repo/main</copy>
		```

		```
		Branch 'source-repo' set up to track remote branch 'main' from 'source-repo'.
		```

	1. Merge the files in the target repo.

		```
		$ <copy>git merge source-repo --allow-unrelated-histories</copy>
		```

		This moves all your files in the filtered directory from your source repo.

		```
		Merge made by the 'ort' strategy.
		 test.txt | 3 +++
		 1 file changed, 3 insertions(+)
		 create mode 100644 test.txt
		```

	1. Clean up the target repo. Remove source repo from local remote.

		```
		$ <copy>git remote rm source-repo</copy>
		```

	1. Delete the branch of the source's main, created above.

		```
		$ <copy>git branch -d source-repo</copy>
		```

		```
		Deleted branch source-repo (was d84b88c).
		```

	1. Push the changes from the target repo to its fork.

		```
		$ <copy>git push</copy>
		```

		```
		Enumerating objects: 12, done.
		Counting objects: 100% (12/12), done.
		Delta compression using up to 8 threads
		Compressing objects: 100% (5/5), done.
		Writing objects: 100% (11/11), 1.01 KiB | 517.00 KiB/s, done.
		Total 11 (delta 1), reused 0 (delta 0), pack-reused 0
		remote: Resolving deltas: 100% (1/1), completed with 1 local object.
		To https://github.com/[your-account]/[target-repo]
		   a1802a0..6f953e3  main -> main
		```

		As your source repo has forgotten all other commits and apparently deleted the remaining files and folders locally, you might want to recover them back.

	1. Delete the entire clone of the source repo and clone it again with Git Desktop or Git Bash.

		> **Tip**: You have performed all these on your local clone for the source repo but its fork is all intact. As you clone the source repo again, you retrieve all your earlier files and folders unhurt.

		----
		## Example screenshot

		![Move folder across repos top](./images/gitbash/move-folder-across-repos-1.png " ")

		![Move folder across repos bottom](./images/gitbash/move-folder-across-repos-2.png " ")

		----
		**Cite**:

		- [johno - move-directory-between-repos](https://www.johno.com/move-directory-between-repos-with-git-history)
		- [trongthanh - move a folder from one repo to another](https://gist.github.com/trongthanh/2779392)

		----
		## undo filter branch to refresh clone

		You have run the `git filter-branch` command but want to undo it. Then, run the following command to refresh your clone to its previous state.

		```
		$ <copy>git fetch . +refs/original/*:*</copy>
		```

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
	![Proxy issue-VPN error](./images/desktop/proxy-error-mask.png " ")

	**What happened**   
	VPN is disconnected.

	**What to do**  
	1. Connect VPN and try again.
	1. If VPN is already connected, disconnect VPN and reconnect.

	VPN must be connected for the clone to talk to the fork repo.

	<if type="gitdesktop">

	----
	## Upstream main does not show up in GitHub Desktop?

	**Problem statement**  
	In GitHub Desktop, you click **Branch** then &gt; **Merge into current branch**. The merge into remote repo window does not show `upstream/master` under `Other branches`.

	**What to do**

	1. Open the remote upstream folder in this location.

		```
		$ <clone>\<local-repository>\.git\refs\remotes\upstream
		```

		**Example** -

		```
		D:\GitHub\learning-library\.git\refs\remotes\upstream
		```

	1. Delete the `main` file in the clone.

	1. Fetch again to get a new copy of the `main` file from the fork.

	Now, `upstream/main` will be displayed again in the merge window.

	----
	## Change the default External Editor from Notepad++ to Atom

	**Problem statement**  
	In GitHub Desktop, the default **External Editor** shows *Notepad++*.   
	You want to set the default editor to *Atom*.

	![Default External Editor Notepad++](./images/desktop/editor-01-default-notepad.png " ")

	**What to do**  
	1. Download the new [Atom app](https://atom.io/) (`v1.60.0`) and install afresh.

		 > **Note**: You may remove the older version of Atom manually using Window Explorer or CLI (git bash).

	1. Open GitHub Desktop and go to **File** &gt; **Options**.

	 ![Modify GitHub preferences](./images/desktop/editor-02-modify-options.png " ")

	1. In the **Integrations** tab, under **External Editor** select *Atom*.

	 ![External Editor Atom](./images/desktop/editor-03-select-external-editor.png " ")

	1. Click **Save** to set the new external editor.   
		The new default editor in GitHub Desktop is Atom.

	 ![New Default Editor Atom](./images/desktop/editor-04-new-default-editor-atom.png " ")

	</if>

	----
	## Notepad++: unable to install plugin

	**Problem statement**  
	You are installing a plugin, for example *`ComparePlugin`*, and Notepad++ restarts but the plugin does not install.

	**What to do**  

	<ins>Option 1</ins> - Run Notepad++ in Admin mode and then install the plugin.   
	<ins>Option 2</ins> - Install the plugin manually.

	----
	### Option 1

	Open Notepad++ in admin mode - *Run as administrator*.

	### Option 2

	**Plugins Manual Installation**

	1. Exit Notepad++, if it is already running.

	1. Download the [ComparePlugin](https://github.com/pnedev/compare-plugin/releases/download/v2.0.1/ComparePlugin_v2.0.1_X64.zip) zip file.

	1. Extract it to a folder named **ComparePlugin**.

	1. Place *ComparePlugin.dll* in the `Notepad++\plugins` folder.

		![Plugin structure](./images/editors/notepad-plugins-structure.png " ")

		> **Tip**: Ensure to match the folder name with the DLL name (excluding file extension).

		To find the `Notepad++\Plugins` folder, go to **Plugins** and select <i>Open Plugins Folder</i>, the last entry right below <i>Plugins Admin</i>.

	1. Start Notepad++ and check the **Plugins** menu.

		## Need further explanation ??

		By default, a windows installation places the plugins in this location -
		 - `C:\Program Files\Notepad++\plugins`

		If the zip file has associated files, then install them to appropriate locations. For `ComparePlugin`, place the *`sqlite3.dll`* and *`git2.dll`* files into the sub folder not the parent `ComparePlugin` folder -
		 - `C:\Program Files\Notepad++\plugins\ComparePlugin\ComparePlugin\`

		For example,   
		 `C:\Programs\Notepad++ 8.4.4\plugins\ComparePlugin\ComparePlugin`. Right, that’s two levels with the same name.

		![Plugins folder](./images/editors/notepad-plugins-folder.png " ")

		Have you got other files inside `ComparePlugin\` other than `ComparePlugin.dll` ?
		 - If yes, move them to `ComparePlugin\ComparePlugin\` and leave only `ComparePlugin.dll` in the first (main) `ComparePlugin\` folder.

		----
		### **Versions - Notepad++ and ComparePlugins**

		Depending on the Notepad++ version, install the corresponding `ComparePlugin`.

		| Notepad++                                      | ComparePlugin   |
		|------------------------------------------------|-----------------|
		| **v8.2.2** and newer (**v8.3**, **v8.4**, ...) | *v2.0.2*        |
		| **v7.7** thru **v8.2.1**                       | *v2.0.1*        |
		| **v7.7** or older                              | *v2.0.0*        |

		 - But update Notepad++ at the first possible opportunity

			## Cite reference

			 - [unable-to-install-compare-plugin 7](https://community.notepad-plus-plus.org/topic/18520/unable-to-install-compare-plugin/7)
			 - [unable-to-install-compare-plugin 6](https://community.notepad-plus-plus.org/topic/18520/unable-to-install-compare-plugin/6)
			 - [compare-plugin-not-working 3](https://community.notepad-plus-plus.org/topic/20123/compare-plugin-not-working/3)
			 - [compare-plugin-not-working 4](https://community.notepad-plus-plus.org/topic/20123/compare-plugin-not-working/4)
			 - [npp-compare bugs](https://sourceforge.net/p/npp-compare/bugs/39/)
			 - [cannot-install-notepad-plugins](https://www.winhelponline.com/blog/cannot-install-notepad-plugins-fix/)

	----
	## Unable to install plugin: `atom-live-server-####`

	**Problem statement**  
	You are trying to install atom-live-server-(any-version) but it returns the following error.

	```
	Installing “atom-live-server-plus@3.0.1” failed.Hide output…
	Request for package information failed: [object Object]

	npm ERR! code UNABLE_TO_VERIFY_LEAF_SIGNATURE
	npm ERR! errno UNABLE_TO_VERIFY_LEAF_SIGNATURE
	npm ERR! request to https://registry.npmjs.org/live-server failed, reason: unable to verify the first certificate

	npm ERR! A complete log of this run can be found in:
	npm ERR!     C:\Users\<user-profile>\.atom\.apm\_logs\2022-09-12T14_42_42_006Z-debug.log
	```

	**What to do**  
	 Add this line to the file `~/.atom./apm/.apmrc`.

	 ```
	 strict-ssl = false
	 ```

	 It will bypass the SSL certificate validation and install the live-server plugins.

	 > **Note**: Though the instructions in the `.apmrc` file says *... should not be edited ...*, ignore that and continue adding the above line.

	<if type="hidden">

	----
	## Crazy repo-names

	choco-bites  
	beautiful-chaos
	fluffy-cat  
	johnny-bravo  
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

## References

 - [gitkraken - How to download file from GitHub](https://www.gitkraken.com/learn/git/github-download#how-to-downlaod-a-file-from-github)

## Acknowledgements

 - **Author** - ♏🅰️♑❗💲♓ Team Database UAD
 - **Last Updated on** - March 12, (Sun) 2023
 - **Questions/Feedback?** - Blame [manish.garodia@oracle.com](./intro/files/email.md)
