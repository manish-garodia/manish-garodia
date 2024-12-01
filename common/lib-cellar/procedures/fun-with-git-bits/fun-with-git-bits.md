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

	Fork creates a copy of the entire main repository (remote or upstream, for example *oracle-livelabs*) into your GitHub account.

	Limitations:
	 - Cannot fork a single (or a specific) folder or file from the main repo (upstream). Github forks the entire main repo.
	 - Cannot create multiple forks of a main repo using the same github account.

	Creating a new fork (or origin) opens the existing repo from your github account, which is already forked.

	- **Head repository** - where to get data from
	- **Base repository** - where to push data to

	Merge pull request (PR) to update your fork (origin) with the latest changes from the main repo (upstream). Fetch origin from Git Desktop and bring your clone (local repo) up-to-date.

	You use a file in your lab from a location outside your workshop and the file gets modified. If it is a file from the common repo, then github updates that lab in your workshop automatically. No action required from your side. The turnaround time to approve PRs vary, maybe 2-3 days.

	If you submit a PR from your fork (origin) to the main repo (upstream), then the labs will not show up on LiveLabs immediately. One of the moderators (Livelabs reviewers) will review the submissions on the main repo, create the required pages, and finally make them available on the LiveLabs application.

	- All interactions between your clone (local repo) and fork (origin) can take place using anyone of these:
		- *GitHub Desktop*
		- *Git Bash*
		- *Git GUI*

	 For example, create a clone from your fork, update the clone from the fork, push your clone to fork, and so on.

	- All interactions between your fork (origin) and the main repo (upstream) takes places on the github page (through a web browser).

		> **Note**: To view the details of a file, such as date/time stamp or last modified by, use the github page.

	----
	### Preview a lab

	**A. View a lab or an entire workshop from your fork**

	```
	[your-account].github.io/[full-path-to-the-workshop-or-lab]/workshops/tenancy/index.html
	```

	----
	#### Prerequisites

	1. From the fork repo, go to **Settings** &gt; click **Pages** in the left pane.
	1. Under **Source**, select **Branch: main** &gt; */root*.   
		It may take ~5-30 mins or for your site/repo to build and render the html pages.

	**B. View html preview of a workshop in main repo**

	```
	oracle-livelabs.github.io/[main-repo]/[full-path-to-index.html]
	```

	----
	### Use case

	You have a team of people working on the same or different labs in a workshop, or each member working on individual workshops. 

	You have two options to achieve this setup:

	----
	#### Option A: Create a new repo

	1.  Create a new repo (main) in your github account: *project-repo*.
	1.  Add the team members to the repo as collaborators.

		 - Open your repo in github.com
		 - Go to **Settings** &gt; **Collaborators** &gt; **Add people**.

	1.  Each member creates a clone of this main repo and all members work independently.
	1.  When the workshop is ready, any one person creates a fork (origin), keeps all files at one place, and pushes the fork out to oracle-livelabs.

	> Ensure to pull from this main repo every time someone modifies any file to avoid conflicts.

	----
	#### Option B: Clone from a common fork

	1.  One person to create a fork (origin) of the main repo and add others as collaborators to that fork.
	1.  All team members create clones from the common fork.
	1.  Members work independently on their respective clones and push to the common fork.
	1.  The creator updates the fork and finally sends out PR from the fork to merge with the main repo (oracle-livelabs).

	----
	## Do's and Don'ts

	 Do not `pull origin` every day to update the fork.

	 If you submit PRs from your fork (origin) to the main repo every day, then the moderators/admins will reject.

	 Push to the main repo only on completion of a lab/md/file(s) or ready for release.

	----
	## A few good practices

	Remember to:

	1. Keep your fork (origin) and clone (local repo) updated with main repo (upstream), even if you do not actively work on your workshop or your workshop has no modifications.

	1. If you miss updating your clone and fork for a long time and the number of commit changes with the main repo (upstream) goes significantly high, then you may find conflicts while merging or in submitting a PR. In some extreme cases, you might have to delete your fork and clone, and re-create them.

		> Update the fork first before pushing the changes from clone to fork and then submit PR from fork to the main repo. This step ensures other people's changes are merged into your fork.   
		*Github does not consider PRs, which contains conflicts*.

	1. Update the fork if someone modifies a file in-progress.

	1. If more than one person is working on the same lab, they must keep their fork updated to avoid conflicts.

	1. If your fork repo (origin) is <ins>old</ins> (not updated), and the clone (local repo) is <ins>in sync</ins> (up-to-date) with the fork, then `merge upstream/main` will not show any changes. If you try to merge with `upstream/main`, it will show that - <i>your branch is up-to-date</i>. In reality, both clone and fork are <ins>behind</ins> the main repo (upstream).

		> **Tip**: Always `fetch upstream` to update the fork from `upstream/main` and then try to `merge upstream`.

	1. If you modify an older version of a file, github returns a conflict error on submitting a PR. In such case, update the fork and clone, make changes your file, and submit the PR again.

	1. When you submit a PR to the main repo, any further merging from your Github account is blocked. Until a moderator reviews and approves the PR, you cannot submit another PR in parallel.  

		> **Note**: After submitting the PR if you make changes to any files, you can still commit to main and submit a *merge request* instead.

	1. Create a fork (origin) of the github main repo (upstream) and create a clone (local repo) of the fork using Git Desktop or Git Bash. If it takes longer, then disconnect VPN and try creating the clone again.

	1. Always use your fork for any reviews, never share the main repo (oracle-livelabs) links for reviews. 

	1. When you edit the contents of a markdown file or add/modify/remove files from the lab folders, the live-server plug-in reloads the entire page immediately even for minor changes. It jumps to the top of the page and you have to scroll down again to the edited section.

		> **Tip**: To update the html output instantenously keeping the focus on the section being edited, click the *Heading level 2* (task URLs) in the left navigation pane. The page will reload but will display the edited section instead of showing the top of the page.

	1. Keep your clone up-to-date before making any changes locally.

	1. Resolve conflicts in your clone first before doing a merge or push.

	</if>

	<if type="gitdesktop">

	----
	## Sync between clone, fork, and main repo

	Go to **File** &gt; **Options**, keyboard shortcut **Ctrl**+**,** (comma). The **Accounts** tab shows that you are logged in to your GitHub account.

	![User logged in](./images/desktop/accounts-logged-in.png " ")

	Now, to update your fork (origin) and clone (local repo), you have:
	- <font style="color:rgb(112,173,71);">**Option 1** - from **Fork**, *fetch* main repo (upstream) and then in Github Desktop *pull origin* to **Clone**</font>
	- <font style="color:rgb(91,155,213);">**Option 2** - from **Clone**, *merge* with main repo in GitHub Desktop and then *push origin* to **Fork**</font>

		![Update fork and clone](./images/desktop/update-fork-clone-grey.png " ")

	</if>

	<if type="gitbash">

	----
	## **Upstream** and **Origin**: what are these?

	 You will come across these terms *upstream* and *origin* while working with git. Though both are repos but indicate different locations.

	 - *upstream* - is the main repo (remote). For example, `oracle-livelabs/database`, `em-omc`, `common`, and so on
	 - *origin* - is the fork repo in your account. For example, `manish-garodia/database`

	 When you run a `fetch` or `merge` on `upstream`, you are talking to the `main` repo. But if you point to `origin`, then your communication is with your fork.

	----
	## **Fetch** vs **Pull**

	The `fetch` command and the `pull` command looks similar but they perform different functions and serve different purposes.

	| git fetch | git pull |
	|-----------|----------|
	| Tells your clone to get the metadata information from the main repo (upstream). It checks if any updates are available but does not do any file transfer. |  Not only does a check for updates but also brings down all changes from the main repo (upstream) to the clone (local repo). |

	In short, the *git pull* command does a *git fetch* followed by a *git merge*.

	</if>

	----
	## Github pages

	You can apply Jekyll themes to your Github pages.

	1. Keep this configuration file under the root folder of your repo.

		- [`_config.yml`](https://github.com/manish-garodia/mg-playground/blob/main/_config.yml)

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
		 - [Cayman](https://jasonlong.github.io/cayman-theme/)
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

	In this method, you update your fork (origin) first and then pull origin to clone (local repo).

	1. Update your fork from the main repo (upstream) using a **browser** - *fetch and merge*
	1. Update your clone from fork (origin) using **Github Desktop** - *pull origin*

		----
		## 1. To update fork from main repo (browser)

		1. Log in to your Github account in a browser.

		1. Go to your fork repo `[your-account]/[your-repo]`.   
		   The **Code** tab displays a message.

			```
			This branch is xx commits behind [main-repo].
			```

		1. Click **Sync fork** &gt; **Update branch** to update your fork (origin) from the main repo (upstream).

			![Update fork from main repo](./images/desktop/fork-update-branch-from-main.png " ")

		   Verify that you have <i>Successfully fetched and fast-forwarded from main-repo (upstream)</i>.

			```
			This branch is up to date with [main-repo].
			```

		The fork (origin) is now updated.

		----
		## 2. To update clone from fork (GitHub Desktop)

		1. Open **GitHub Desktop** and check the **Current repository**.

			```
			Last fetched xx time ago.
			```

		1. Click **Fetch origin** to sync the commit history between the fork and clone. It displays an arrow with the number of commits the clone is behind fork.

		    ```
		    Pull xx commits from the origin remote.
		    ```

		1. Click **Pull origin** (either one) to merge the changes from the fork to the clone.

			```
			Last fetch just now.
			```

		The clone is now updated.

	----
	## Option 2: Update clone &gt; push to fork (GitHub Desktop)

	Update both clone (local repo) and fork (origin) together using GitHub Desktop.

	1. Open **GitHub Desktop**.

	1. From **Branch** &gt; select **Merge into current branch** to open the merge into main window.

	1. The default branch selected is *main*.   
	   Under Other branches, select *upstream/main*. It displays a message.

		```
		This will merge xx commits from upstream/main into main
		```

	1. Click **Create a merge commit**. It displays a message.

	    ```
	    Successfully merged upstream/main into main
	    ```

	   This step updates the clone (local repo) from the main repo (upstream).

	5. Click **Push origin**.   
		This step send the updates from the clone (local repo) to the fork (origin).

		From **Repository** &gt; select **View on GitHub** to open the main repo (upstream) in a web browser. Go to your fork repo and verify that the fork is updated.

		```
		This branch is up to date with [main-repo]:main.
		```

		----
		## Cite
		[Video by Tom McGinn](https://otube.oracle.com/media/t/1_bxj0cfqf) on 30 July, 2020   
		In this video, I'll show you how to:  
		- Merge the production repo files with your fork and local clone, to ensure you have the latest/greatest files  
		- Commit changes you've made to your fork and review the changes  
		- Make a pull request

	----
	## Commit to main - from clone to fork

	To push changes from the clone (local repo) to the fork (origin):

	1. Open **GitHub Desktop**.

	1. Add a *Summary* and a brief *Description*.

	1. Under **Changes**, verify that the impacted files are selected.

	1. Click **Commit to master** to stage the modified file for commit.

	1. Click **Push origin** to merge the changes from the clone to the fork.

	The changes from the clone (local repo) are pushed to the fork (origin).

	> **Note**: It may take a few minutes for your fork to build and deploy Github pages.

	----
	## Create a new clone from fork

	After you create a fork (origin) of the main repo (upstream), you can create a clone (local repo) of the fork on your system.

	1. Go to **File** &gt; **Clone repository** (keyboard shortcut **Ctrl**+**Shift**+**O**).

		![Clone menu item 1](./images/desktop/clone-01-menu-item1.png " ")

		Alternatively, click the arrow next to **Current repository** &gt; **Add** &gt; **Clone repository**.

		![Clone menu item 2](./images/desktop/clone-02-menu-item2.png " ")

	1.	If you are logged in to Github, then the desktop app displays all repos associated with your account under **Your repositories**.

		![Select local path and create clone repo](./images/desktop/clone-03-select-repo-local-path.png " ")

		Select the repo that you want to clone, for example *database*, and click **Clone**.

		> **Note**: Check if the **Local path** is correct, or **Choose** a different path for the clone directory.

	1. Github Desktop wants to know how you plan to use this fork.   
		Select *To contribute to the parent project* &gt; **Continue**.

		![Contribute to the parent project](./images/desktop/clone-04-contribute-to-parent-project.png " ")

		> **Tip**: Don't be alarm if you select the wrong option in this window. You can always fix it later. From the **Repository** menu &gt; go to **Repository settings** &gt; **Fork behavior**, and select the purpose of this fork.

		![Repository - Fork behavior](./images/desktop/clone-05-repo-fork-behavior.png " ")

		After adding the new repo to GitHub Desktop, you publish the branch for first time.

		![Publish branch](./images/desktop/clone-06-new-repo-publish-branch.png " ")

	----
	## Add existing clone to GitHub Desktop

	If you create a new clone using GitHub Desktop, then the window displays the repo under the account name. But if you have an existing clone or create a clone using Git Bash or other sources, then it will be not listed in GitHub Desktop automatically.

	However, you can add such existing clone repos to your GitHub Desktop application.

	1. From the **File** menu, select **Add local repository** (keyboard shortcut **Ctrl**+**O**).

		![Add local repo menu item 1](./images/desktop/clone-07-add-local-repo-menu-item1.png " ")

		Alternatively, click the arrow next to **Current repository** &gt; **Add** &gt; **Add existing repository**.

		![Add local repo menu item 2](./images/desktop/clone-08-add-local-repo-item2.png " ")

	1. **Choose** the **Local path** of the clone repo folder.

		![Select local path](./images/desktop/clone-09-local-path.png " ")

	1. Select the clone repo folder in the browser window.

		![Select folder](./images/desktop/clone-10-select-folder.png " ")

		The Add local repository window displays the folder you selected.

	1. Click **Add repository** to add the clone repo to GitHub Desktop.

		![Add clone repo](./images/desktop/clone-11-add-clone-repo.png " ")

		GitHub Desktop displays the repos under the associated account name.

		![All repos](./images/desktop/clone-12-all-repos.png " ")

		Similarly, you can remove clone repos from GitHub Desktop.

	----
	## Remove a clone and clone again

	If you do not want to manage a repo, then you can remove it from GitHub Desktop. While removing a repo, you may keep the files and folders on your system or delete them along.

	1. Right-click the repo, which you want to remove, and select **Remove**.

		![Remove option](./images/desktop/clone-13-remove-option.png " ")

		It displays a confirmation window.

	1. Click **Remove** again to remove the clone repo from GitHub Desktop.

		![Remove repo](./images/desktop/clone-14-remove-repo.png " ")

		 > **Note**: To physically remove files and folders of the repo from your system, select the option **Also move this repository to Recycle Bin** in the Remove repository window. Optionally, this step may display a window for folder access permissions.   
		 Click **Continue** to delete the files and folders of the repo.

		 > ![Folder permission](./images/desktop/clone-15-folder-permission.png " ")

		If GitHub Desktop is unable to remove the clone repo, then it displays an error message.

		![Error removing repo](./images/desktop/clone-16-remove-repo-error.png " ")

	Alternatively, you can delete the clone directory from Windows Explorer or command line and then remove it from GitHub Desktop.

	1. Right-click the repo and select **Remove**.

		> **Tip**: Notice the exclamation sign within a triangle indicating that something is not right with the repo.

		![Remove option](./images/desktop/clone-17-remove-repo-option.png " ")

	1.	The desktop app says that it cannot find the selected repo because it is either moved or deleted. You can either locate the repo on your system or create a clone again. However, for this task, remove the repo altogether.

		![Remove repo](./images/desktop/clone-18-remove-repo-deleted.png " ")

		Click **Remove** again to remove the clone repo from GitHub Desktop.

		Other options -  

		- **Locate**: If the clone is moved to another location, then you can locate your clone to add it again.
		- **Clone Again**: If you want to re-create the clone from your fork, then click this option.

	----
	## Pull error - **Stash changes**

	You do a *pull origin* to update your clone but a message appears stating that some files will be overwritten.

	![Pull origin error - stash changes](./images/desktop/pull-error-01-stash.jpg " ")

	If you want to continue `pull origin` without losing the local changes, then click **Stash changes and continue**. Your files remain unhurt, though they do not appear in the changes list anymore.

	> It is similar to storing in a recycle bin temporarily.

	If you do not want to keep the changes and throw them away, then click **Discard** to forget the changes permanently.

	Alternatively, you can click **Restore** to get the local changes back in the changes list after the pull is complete.

	![Restore changes from stash](./images/desktop/pull-error-02-restore-stash.jpg " ")

	You can then continue from the same point where you stashed.

</if>

<if type="gitconcepts">

## Pull Requests (PRs) to push changes

- Submit PRs on main repo (upstream) and approve PRs

	----
	## About PRs

	Want to merge your updated fork repo (origin) with the main repo (upstream)? *submit a PR*.   
	After committing your changes to `main`, go to your fork repo and *create a PR*.

	As a moderator (administrator), you can perform tasks, such as review PRs, add comments, approve PRs and merge changes with the main repo or even request the contributor for further changes.

	> **Tip**: A moderator can approve PRs from other users, but not their own.


	### PR history and total count

	You can use rest APIs to get information about PRs from your Github account, such as history of all PRs, total count of PRs, and so on.

	Open a web browser and run the following search query.

	**Syntax**

	```
	https://api.github.com/search/issues?q=org:[organization]%20author:[your-account]%20type:pr%20is:merged
	```

	For example, view all PRs from the account *manish-garodia* for the organization *oracle-livelabs* that *is merged*.

	```
	<copy> https://api.github.com/search/issues?q=org:oracle-livelabs%20author:manish-garodia%20type:pr%20is:merged</copy>
	```

	Alternatively, log in to github in a browser and use your user name to view PR history.

	**Syntax**

	```
	<copy>https://github.com/pulls?page=1&q=is%3Apr+author%3A<GIT-USER-NAME>+archived%3Afalse+is%3Aclosed</copy>
	```

	Example

	```
	<copy>https://github.com/pulls?q=is%3Apr+author%3Amanish-garodia+archived%3Afalse+is%3Aclosed</copy>
	```

	----
	## Access your fork repo (origin)

	- **Option A: using a browser**

		1. Log on to your GitHub account in a browser.

		1. Go to your fork repo `[your-account]/[your-fork]`.

	- **Option B: using GitHub Desktop**

		1. Open GitHub Desktop.

		1. From **Branch** &gt; select **Create pull request**.  
			It opens main repo in a browser.

		1. Go to your fork repo `[your-account]/[your-fork]`.

	----
	## Submit a PR - <i>contributor</i>

	When you commit (push) your changes from the clone, using either git Desktop or git Bash, the fork displays the message.

	```
	This branch is 1 commit ahead of [head:repo]
	```

	![1 commit ahead](./images/github/fork-ahead-of-main.png " ")

	Submit a PR to merge your changes with the main repo.

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

	That's it. Your PR is submitted for review. Github may send notification mails depending on your configuration. Next, one of the moderators (administrators) will review the PR and respond.

	> **Did you know..?**   
	When a user (contributor) submits a PR and it is under review (waiting for approval), Github blocks further merging for the user. This means until a moderator (administrator) approves and merges (or rejects) your PR, the user cannot create another PR in parallel on the same repo.

	![PR submitted - merging blocked](./images/github/pr-submitted-merging-blocked.png " ")

	## Resolve conflicts in PR

	A moderator approves your PR and merges the changes only if the PR is error-free. If the PR has any issues or conflicts, you can do the following:

	 - **Submit a merge request** 

		Do not create another PR but submit a merge request instead. 

		1. Fix the issues in your clone (main repo). This overwrites your previous changes.
		1. Commit to main, that is, push origin from your clone to your fork. 

		All these changes are included in the same PR.

	 - **Withdraw a PR altogether** 

		You may want to withdraw a PR and resubmit a new one for various reasons, for example, a conflict in the PR is quite complicated and might take longer to resolve, or you found some mistakes in the PR, etc. 

		1. Go to your repository on Github. 
		1. Click **Pull requests** and open your PR. 
		1. Select *Close pull request*.

		You can now submit a new PR. 

	----
	## Approve a PR - <i>moderator</i>

	Approving a PR involves two major steps: *approve* and *merge*

	- **approve PR** - to accept the change request
	- **merge PR** - to integrate the modified files with the main repo (upstream)

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

		It opens the **Conversation** tab and displays commit description, if any. It also shows how many commits requested and the number of files changed.

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


		> **Note**: Approving a PR means the change request is accepted. However, the changes are not reflected on the main repo (upstream) until the files are merged.

	1. Select **Merge pull request** to proceed with merging.

		![Merge PR](./images/github/approve-pr-06-merge-pr.jpg " ")

		Click **Confirm merge** to start the merge and to close the PR.   
		It integrates the changes from the contributor's fork (origin) and updates the files on the main repo (upstream).

		![Confirm merge](./images/github/approve-pr-07-confirm-merge.jpg " ")

		Optionally, you may add comments in the box and click **Comment**.

	You have approved PR the and merged the changes. Github may send notification mails depending on your configuration. The changes will be available on the main repo (upstream) after the build and deployment workflow completes.

</if>

<if type="gitbash">

## Take a plunge into *Git Bash*

 - Learn about stage, commit, push, pull, fetch, git configurations, and other commonly used commands

	----
	## Git version/upgrade

	Check the current version of git installed on your Windows system.

	```
	$ <copy>git --version</copy>
	```

	```
	git version 2.37.1.windows.1
	```

	****

	For upgrading git to the latest version, you have some scenarios:

	 - Your Git version is *2.14.1* or older. Then, uninstall Git and download the latest setup from their site - [Git Downloads](https://git-scm.com/downloads).

	 - For versions between 2.14.2 and 2.16.1, use this command to upgrade Git:

		```
		$ <copy>git update</copy>
		```

	 - For Git 2.16.2 or later, use this command:

		```
		$ <copy>git update-git-for-Windows</copy>
		```

		```
		Warning! `git update` has been deprecated;
		Please use `git update-git-for-windows` instead.
		Using proxy server http://username%40org.com:org.com@proxy:port detected from git http.proxy
		Git for Windows 2.37.1.windows.1 (64-bit)
		Update 2.41.0.windows.1 is available
		Download and install Git for Windows v2.41.0.windows.1 [N/y]?
		```

		> **Tip**: If you use `git update` on the newer versions, then Git reminds that the old command is deprecated and suggests using the new command instead.  

	----
	## All about commit

	The main steps for pushing the changes from the clone (local repo) to the fork (origin) -

	1. Display local changes
	1. Stage files for committing
	1. Commit to main
	1. Push from clone to fork

		----
		## 1. Display local changes

		 - View the staged/unstaged files in the clone

			----
			## Display modified files in clone

			View the files that are modified, moved, added, or deleted in the clone. It displays only the files and not the content changes within the files.

			```
			$ <copy>git status</copy>
			```

			> **Tip**: It is a good practice to view git status at the beginning and also in between or at the end before commit, to ensure that the commit includes correct files.

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
			## Display content changes in clone

			Compare the clone (local repo) with the fork (origin). View the content changes line-by-line within the modified files in the clone.

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
			$ git add [full-path-of-the-file-or-folder]
			```

			Example

			```
			$ git add common/intro/readme.md
			```

			----
			## More staging options

			1. 	Use wildcards in file or folder name.

				```
				$ git add [*file-name*]
				```

				Example

				```
				$ <copy>git add *install-em*</copy>
				```

			1. 	Stage a specific file type, for example `*.png`.

				```
				$ git add [file.extension]
				```

				Example

				```
				$ <copy>git add *.png</copy>
				```

			----
			## Stage all files together

			Use any one -

			<!--1. This command works from the root directory only.-->

			-	```
				$ <copy>git add .</copy>

				```

			<!--1. These commands work from any location in the clone (local repo).-->

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

			**Use case**: You modified some files in the clone (local repo) and staged them but not yet committed to the main repo (upstream). You want to bring the staged files back and make further changes before doing a commit.

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
				Your files move back to unstaged condition and the local changes are also intact.

			**See also** *Discard local changes*

			----
			## Discard local changes

			**Use case**: The changes in the clone (local repo) are incorrect and you want to revert back to the main repo (upstream).

			> **Caution**: <i>DO NOT</i> use these, unless you want to discard all changes in the clone and revert back the main repo.

			```
			$ git restore [file-name]...
			$ git restore *.*
			$ git restore .
			```

			> ***Warning***: All local changes will be **lost forever**.

			The `git restore` command without the *--staged* flag will forget all local changes. This command is irreversible, you cannot retrieve the discarded changes ever again.

			> **Note**: If you stage some files followed by `git restore`, then all unstaged files (local changes) will be lost but the files that are already staged will remain intact, ready for commit.

			**See also** *Undo (Rollback) staging*

		----
		## 3. Commit to main

		1. Start the commit (without any flags).  

			```
			$ <copy>git commit</copy>
			```

			This command opens the commit message in an editor where you can enter the details, including the <i>summary</i> and <i>description</i>.

			> **Note**: The first line is the <i>summary</i> and remaining portion is the <i>description</i>. Leave a blank line between the summary and description.

		1. Save the file for commit, *:wq*.

			Another option is, quit without saving, *:q!*. This will cancel the commit and go back to staging.

			**Scenario**  
			Suppose, you forgot to stage some files, or want to unstage a wrong file, then you can quit without saving and cancel the commit.

			> **Note**: Git Bash does not commit without a message (summary and description).

			----
			## Still hungry for more?

			 - Sometimes, you may want to stage and commit together in a single command.

				----
				## Stage and commit along

				To stage your modified files and also commit them together in a single step -

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

		After you commit the files to main, do `push origin` from clone (local repo) to fork (origin).

		```
		$ <copy>git push origin main</copy>
		```

		This merges the changes from the clone and updates the fork.

	----
	## Update fork and clone :: fetch and merge ::

	- You have multiple ways to update the clone (local repo) and the fork (origin).

		----
		## Option 1: Update clone &gt; push to fork

		Update the clone from the main repo (upstream) and then push the changes from clone (local repo) to fork (origin).

		1.  ```
			$ <copy>git checkout main</copy>
			```

		1. 	```
			$ <copy>git fetch upstream main</copy>
			```

		1. 	```
			$ <copy>git merge upstream/main</copy>
			```

			It merges the changes from the main repo (upstream) to the clone (local repo).

		1. 	```
			$ <copy>git push origin main</copy>
			```

			The updates in the clone (local repo) are pushed to the fork (origin). Now, both clone and fork are in sync with the main repo.

		- <ins>Combined commands</ins>

			```
			$ <copy>git checkout main && git fetch upstream main && git merge upstream/main && git push origin main</copy>
			```

		----
		## Option 2: Update fork &gt; pull to clone

		Update the fork (origin) from the main repo (upstream) and then pull the changes from fork to the clone (local repo).

		Use these commands to find the difference between the clone and your fork.  

		- 	```
			$ <copy>git fetch</copy>
			```

		- 	```
			$ <copy>git fetch origin main</copy>
			```

			It does not update the clone.

		Update your fork from the main repo in a web browser using **Sync fork** &gt; **Update branch**. Now it is time to update the clone. Next, merge the changes from your fork to your clone.

		- 	```
			$ <copy>git pull --all</copy>
			```

			Brings the clone (local repo) up-to-date with the changes in the fork (origin).

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
		http://username@org.com:org.com@proxy:port
		```

	1.	Syntax

		```
		$ git config --global http.proxy http[s]://userName:password@proxyaddress.com:port
		```

		> **Note**: Encode `@` in user name with `%40`.

		- <ins>Combined commands</ins>

			```
			$ <copy>git config --global --unset http.proxy && git config --global --get http.proxy && git config --global http.proxy http://username%40org.com:org.com@proxy:port</copy>
			```

	----
	## Start a new repo

	Open Git Bash and go to the directory where you want to create the repo. Create a new repo, for example *musical-lamp*, from the command line.

	1. 	Create a file `readme.md` and add a title to the lab.

		```
		$ <copy>echo "# musical-lamp" >> readme.md</copy>
		```

	1. 	Initialize the (new) local repo.
		```
		$ <copy>git init</copy>
		```

	1. 	Stage the `readme.md` file for commit.

		```
		$ <copy>git add readme.md</copy>
		```

	1. 	Commit the file to main repo with a message, <i>first commit</i>.

		```
		$ <copy>git commit -m "first commit"</copy>
		```

	- <ins>Combined commands</ins>

		```
		$ <copy>echo "# musical-lamp" >> readme.md && git init && git add readme.md && git commit -m "first commit"</copy>
		```

	----
	Push the new repo from the command line.

	1. 	Add a new main repo (upstream).

		```
		$ <copy>git remote add origin https://github.com/bg-manish/musical-lamp.git</copy>
		```

		To change the url of an existing main repo:

		```
		$ git remote set-url origin git@github.com:[your-account]/[your-repo].git
		```

	1. 	Set up a branch, *main*, for the repo.

		```
		$ <copy>git branch -M main</copy>
		```

	1. 	Push the changes from clone (local) to the main repo (upstream).

		```
		$ <copy>git push -u origin main</copy>
		```

		- Atter you use `git push -u origin main`, from next time you can use only `git push` without any flags.
		- If you do only `git push` (without -u), then next time you use `git pull`, you must enter the main repo url when git pulling.

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
		  Fetch URL: https://github.com/[your-account]/[your-repo].git
		  Push  URL: https://github.com/[your-account]/[your-repo].git
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
				url = https://github.com/[your-account]/[your-repo].git
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
	## Create a new clone from fork

	To clone a fork (origin):

	1. Go to the GitHub directory on your local system.

	1. Create a new folder for the clone.

		```
		$ <copy>mkdir [dir-name]</copy>
		```
	1. Change directory to the new folder.

		```
		$ <copy>cd [dir-name]</copy>
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
	$ git clone url [folder-name]
	```

	**Example**

	```
	$ <copy>git clone https://github.com/bg-manish/northern-lights northern-lights</copy>
	```

	> **Note**: This command will create a folder *`northern-lights`* and clone the repo from the given URL.

	----
	## Common `git` commands

	| Command                                       | Usage                                     |
	|-----------------------------------------------|-------------------------------------------|
	| `cd /d/GitHub`                                | change drives                             |
	| `cd [folder-name]`                            | navigate between folders                  |
	| `tree.com //a`                                | view directory tree structure             |
	| `git log`                                     | display log                               |
	| **Configuration**                             |											|
	| `~/.gitconfig`                                | git config location                       |
	| `cat ~/.gitconfig`<br>`more ~/.gitconfig`     | display contents of the config file       |
	| `vi ~/.gitconfig`                             | modify the config file                    |
	| `git config --list`                           | display configuration settings            |
	| `git config --list --show-origin`             | view all variables in the config file     |
	| `git config user.name`                        | display git user name                     |
	| `git config --global user.name "FIRST-NAME LAST-NAME"` | set git user name                |
	| `git config --global user.email "MY-NAME@example.com"` | set git email address            |
	| `git remote add origin repository-URL`        | add repository URL                        |
	| **Branch**                                    |											|
	| `git branch`                                  | display branches in repo                  |
	| `git branch [branch-name]`                    | create a new branch                       |
	| `git branch -d [branch-name]`                 | remove a branch - <i>**safe** delete</i>  |
	|`git branch -D [branch-name]`                  | remove a branch - <i>**force** delete</i> |
	| 												| 											|
	| `git rm` | If you use only `rm`, then you must follow it with `git add [fileRemoved]`. Whereas `git rm` does this in one step (both file removal and staging for deletion on the next commit). It keeps a copy in the local file system until commit. |
	| `git --version`                               | current version of git                    |

	----
	### Yet to be tested (not verified)

	- `git revert`   
	create a new commit with the changes that are rolled back.

</if>

## Code editors and plug-ins

 - Install plug-ins for code editors

	----
	## Know your plug-ins

	***Live Server plug-in***    
	Plug-ins are extensions of a code editor. For a workshop to run locally from the clone, it requires a <i>Live Server plug-in</i> for the code editor.  

	Depending on the code editor, **Visual Studio Code** or **Atom**, install the corresponding live server plug-in.

	| Code Editor        | Live Server Plug-in     | Version       | Credits            |
	|--------------------|-------------------------|:-------------:|--------------------|
	| Visual Studio Code | `Live Server`           | 5.7.9         | <i>Ritwick Dey</i> |
	| Atom               | `atom-live-server`      | 2.3.0         | <i>jas-chen</i>    |
	| Atom               | `atom-live-server-plus` | 3.0.1         | <i>richiksc</i>    |

	Other VS Code plug-ins -

	 - `Trailing Spaces` v0.4.1 - <i>Shardul Mahadik</i>
	 - `Path IntelliSense` v2.8.3 - <i>Christian Kohler</i>
	 - `Code Spell Checker` v2.11.1 - <i>Street Code Software</i>
	 - `markdownlint` v0.48.1 - <i>David Anson</i>

	<!--

	### **Other VS Code plug-ins**

	| VS Code Plug-in              | Version       | Credits                      |
	|-----------------------------|:-------------:|------------------------------|
	| `Trailing Spaces`           | 0.4.1         | <i>Shardul Mahadik</i>       |
	| `Path Intellisense`         | 2.8.3         | <i>Christian Kohler</i>      |
	| `Code Spell Checker`        | 2.11.1        | <i>Street Code Software</i>  |
	| `markdownlint`              | 0.48.1        | <i>David Anson</i>           |

	-->

	![VS Code Plug-ins](./images/editors/vscode-plugins-all.png " ")

	> **Note**: Install the editor first, followed by the plug-in.

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

	If you already have VS Code, then skip this and jump to the plug-ins section.

	> **Did you know..?**   
	You do not require VS Code editor installed on your system. Open a `markdown.md` file in *`github.dev`* and it opens the file in VS Code editor in a web browser (online).

	----
	## Live Server plug-in for VS Code

	### *Install Live Server*

	1. Open the VS Code editor and click the **Extensions** icon in the left menu to open the plug-ins manager.

		![VS Code - Extensions](./images/editors/vscode-plugin-live-server-install1.png " ")

	1. Search for *Live Server*. Under Live Server, click **Install** to start installing live server.

		![Install Live Server plug-in](./images/editors/vscode-plugin-live-server-install2.png " ")

	1.	On completion, click **Live Server** to verify that the plug-in is installed.

		![Live Server installed](./images/editors/vscode-plugin-live-server-install3.png " ")

		You can now run the Live Server plug-in from VS Code.

	### *Run Live Server*

	To run Live Server, you must have a folder in your VS Code workspace.

	1. Click **File** &gt; **Open Folder**.

		![Open folder in workspace](./images/editors/vscode-workspace-open-folder.png " ")

		Browse for the project folder (clone directory) and add it to your workshop.   
		Alternatively, you can right-click the explorer and **Add Folder to Workspace**.

		![Add folder to workspace](./images/editors/vscode-workspace-add-folder.png " ")

		> **Tip**: Adding folders to workspace is a one-time activity. If you have added one or more folders to your workspace already, next time onwards you can directly run the live server.

	1. Click **Go Live** at the bottom-right corner to run the live server.

		![Run Live Server](./images/editors/vscode-run-live-server.png " ")

		It opens the Live Server page (clone directory) in your default browser with the URL  `http://127.0.0.1:5500/`.

		> **Tip**: You can change the Live Server plug-in default port.    
		Open **Extension Settings** and go to <i>Live Server Config</i> &gt; <i>Edit in settings.json</i>.

		 ```
		 <copy>"liveServer.settings.port": 3000</copy>
		 ```

		> **Tip**: Unlike Atom, keep the VS Code window open (or minimized) while working on your clone. If you close the VS Code window, Live Server stops and you cannot view the pages anymore.

		If you have more than one folder in your VS Code workspace, while you run the live server it may ask which folder to select for the live server.

		> **Did you know..?**   
		For Live Server to render output, your system must be connected to the internet.

	### *Close Live Server*

	 - Click *Port : 5500* at the bottom-right corner of VS Code window to stop Live Server.

		![Close Live Server](./images/editors/vscode-close-live-server.png " ")

		> Another option is to install the Live Server plug-in from [here](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer).

		----
		## Cite reference

		 - [Visual Studio Code for Markdown Development](https://confluence.oraclecorp.com/confluence/display/DBIDDP/Visual+Studio+Code+for+Markdown+Development)

		----
		## Other plug-ins for VS Code

		Additional plug-ins to install for VS Code -

		 - **Trailing Spaces**   
			Highlight trailing spaces and remove them

			![VS Code - Trailing Spaces plug-in](./images/editors/vscode-plugin-trailing-spaces.png " ")

		 - **Path Intellisense**   
			Browse and select files and folders in `manifest.json`

			![VS Code - Path Intellisense plug-in](./images/editors/vscode-plugin-path-intellisense.png " ")

		 - **Code Spell Checker**   
			Check spellings in the files

			![VS Code - Code Spell Checker plug-in](./images/editors/vscode-plugin-code-spell-checker.png " ")

		 - **markdownlint**   
			Styling and lint checker for labs

			![VS Code - markdownlint plug-in](./images/editors/vscode-plugin-md-lint.png " ")

	----
	## Live Server plug-ins for Atom

	 Install as required

	![Atom live server plug-ins](./images/editors/atom-live-server-plugins.png " ")

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

	1. Modify **Start in** and point to the desired location, preferably the directory where your clone resides.   
	   Remove `--cd-to-home`.

		Change to -

		- **Target** - *"C:\Program Files\Git\git-bash.exe"*   
		- **Start in** - `[desired-location]` for example *D:\GitHub*

		> **Note**: Do not forget to delete `--cd to home` from **Target**, otherwise the **Start in** value gets overridden.

		----
		## Okay, show screenshot &gt;&gt;

		![Git Bash start in](./images/gitbash/gitbash-startin.jpg " ")

	</if>

	----
	## Fork is ahead of main repo?

	**Problem statement**  
	Your fork says -

	```
	Your branch is X commits ahead
	```

	![Fork ahead of main](./images/desktop/rebase-01-fork-ahead.png " ")

	You do a `fetch origin`, `merge upstream/main`, and `push origin`. This updates both clone (local repo) and fork (origin) with main repo (upstream). However, you get a *commits mismatch* message on your fork.

	This means that your fork is not fully synced with main repo. If you get this message on your fork, how to clean this up without submitting a PR to main repo?

	**What to do**  
	- Bring your fork repo in sync with main repo (fully up-to-date). Use GitHub Desktop or GitBash commands to get this resolved. 

		> ***Caution***: Fixing this might discard your changes in the clone repo. It is advisable to take backups before performing these.

	<if type="gitdesktop">

	In GitHub Desktop -

	1. Select the repo that you want to bring up-to-date.

	1. Go to **Branch** &gt; **Rebase current branch**.

		![Rebase branch menu](./images/desktop/rebase-02-rebase-menu.png " ")

	1. In the Rebase main window, select the branch *upstream/main* &gt; click **Rebase**.

		![Select branch](./images/desktop/rebase-03-select-branch.png " ") TBD - ***Replace figure*** (shows old repo)

		GitHub Desktop starts the rebase and displays the commits.

		![Rebase in progress](./images/desktop/rebase-04-rebase-progress.png " ")

		GitHub Desktop gives an option to force push with all ahead and behind commits.

	1. Click **Force push origin** to rewrite history on `origin/main`.   
		The window displays a message to confirm this action. Click **I'm sure** to proceed.

		![Rebase force push](./images/desktop/rebase-05-force-push.png " ") TBD - ***Replace figure*** (shows old repo)

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
		To https://github.com/[your-account]/[your-repo].git
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

	- <ins>Combined commands</ins>

		```
		$ <copy>git fetch upstream && git checkout main && git reset --hard upstream/main && git push --force && git checkout main && git rebase main && git push -u origin main</copy>
		```

		----
		## Result

		```
		Already on 'main'
		Your branch is up to date with 'origin/main'.
		HEAD is now at 861e662 [latest-PR]
		Total 0 (delta 0), reused 0 (delta 0), pack-reused 0
		To https://github.com/[your-account]/[your-repo]
		 + e636c29...861e662 main -> main (forced update)
		Already on 'main'
		Your branch is up to date with 'origin/main'.
		Current branch main is up to date.
		Everything up-to-date
		branch 'main' set up to track 'origin/main'.
		```

	</if>

		----
		## Need more explanation?

		Here, <if type="gitbash">*`git reset --hard upstream/main`*</if> <if type="gitdesktop">*Rebase current branch*</if> will `reset main HEAD` on the updated `upstream/main`, in order for `main` to reflect the exact same history as the one in the main repo.

		But since some commits where previously merged with the main repo and pushed to fork (`origin/main`), you must replace that history with the new main state. Hence, <if type="gitbash">*`git push --force`*</if> <if type="gitdesktop">*`force push origin`*</if>.

		Now, the rebase `mybranch` command ensures that the current patches are according to the latest commit in the main repo.

	Refresh the browser page for the fork. You will see that the fork is now up-to-date with main repo.

	![Rebase successful, fork up-to-date](./images/desktop/rebase-06-fork-uptodate.png " ")

	----
	## GitHub pages: build I/O failure?

	**Problem statement**  
	You made changes to your clone and push them out to your fork. You wait for a while but github refuses to render the output. Github does not generate the IO pages and returns a `404`.

	![Github pages build I/O failure - 404](./images/github/gh-pages-01-build-io-failure.png " ")

	**What went wrong**  
	To render the I/O pages, all jobs related to build and deployment must complete successfully. In this case, one or more critical jobs failed to complete.

	**What to do**  
	Debug the build workflow to narrow down the root cause, fix the issue, and build again.

	1. Log in to `github.com` in a web browser and go to the repo, which has the build problem.

	1. Click the **Actions** tab to view all workflows.

		![Action - All workflows](./images/github/gh-pages-02-action-all-workflows.jpg " ")

		The workflows page displays github pages build and deployment with icons to indicate the status.

		- A <font style="color:rgb(221,173,13);">**yellow circle**</font> indicates build in-progress
		- A <font style="color:rgb(64,191,78);">**green tick**</font> indicates success
		- A <font style="color:rgb(242,81,73);">**red cross**</font> indicates failure
		- A **transparent exclamation (`!`)** implies that the build did not complete or was canceled

	1.	Identify the (latest) workflow that failed (with a red cross). Click *pages build and deployment* to view details of the build.

		![Failed workflow - pages build and deployment](./images/github/gh-pages-03-pages-build-and-deployment.jpg " ")

		A build workflow runs three primary jobs: *build* • *report-build-status* • *deploy*. Notice the icon next to each job. The job that failed shows a red cross.

	1. Depending on the issue, you can rerun only *failed jobs* or rerun *all jobs* and try to build again.

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

		You can wait for Github to build the I/O pages automatically or rerun the jobs manually as explained earlier.

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
			$ <copy>mv [old-name] [new-name]</copy>
			```
	</if>

	- **Modify directly on GitHub**
		1. Log in to `github.com` in a browser and go to the repo.
		1. Go to the file and select **Edit file**.
		1. Place the cursor at the first character of the file name and press **Backspace**.

	- **Using Windows Explorer**
		1. Move the file to another location, outside the clone.
		1. Right-click and rename (F2).
		1. Copy the file back to the original location with the new name.

		> **Note**: Renaming a file or a folder at the same location in Windows Explorer does not help because the names are not case-sensitive.

	- **Final option**: if all the attempts failed, then eventually the long route -
		1. Delete the file (or move it out to another location)
		1. Create a file with the new name (or rename at another location and copy it back).
		1. Commit to main repo with the new name.

		Use this option as the last resort.


	----
	## Clone and fork out-of-sync - [push origin failed]

	**Problem statement**  
	You made changes to your clone (main repo) and want to merge them with the fork (origin). You did `commit to main` and then *`push origin`* to update the fork from the clone but it returned an error.

	<if type="gitdesktop">
	![Update fork from clone rejected](./images/desktop/clone-out-of-sync-01-push-failed.jpg " ")
	</if>

	<if type="gitbash">

	```
	$ <copy>git push origin main</copy>
	```

	Error 1

	```
	To https://github.com/[your-account]/[your-repo].git
	 ! [rejected]        main -> main (non-fast-forward)
	error: failed to push some refs to 'https://github.com/[your-account]/[your-repo].git'
	hint: Updates were rejected because the tip of your current branch is behind
	hint: its remote counterpart. Integrate the remote changes (e.g.
	hint: 'git pull ...') before pushing again.
	hint: See the 'Note about fast-forwards' in 'git push --help' for details.
	```

	Error 2

	```
	To https://github.com/[your-account]/[your-repo].git
	 ! [rejected]        main -> main (fetch first)
	error: failed to push some refs to 'https://github.com/[your-account]/[your-repo].git'
	hint: Updates were rejected because the remote contains work that you do not
	hint: have locally. This is usually caused by another repository pushing to
	hint: the same ref. If you want to integrate the remote changes, use
	hint: 'git pull' before pushing again.
	hint: See the 'Note about fast-forwards' in 'git push --help' for details.
	```

	![Update fork from clone rejected](./images/desktop/update-fork-from-clone-rejected.png " ")

	</if>

	**What happened**   
	You arrived at a conflict where the clone (main repo) is behind the fork (origin). The fork contains more recent commits that are not pulled to the clone. In short, you have modified an older clone and trying to update your fork which contains more changes.

	**What to do**

	<ins>Option 1</ins> -

	1. Fetch the latest commits from your fork.

	<if type="gitbash">

		```
		$ <copy>git fetch origin main</copy>
		```
	</if>

	1. Instead of `push origin`, do *`pull origin`* to update the clone.

	<if type="gitdesktop">

		![Pull origin](./images/desktop/clone-out-of-sync-02-pull-origin.jpg " ")

	</if>

	<if type="gitbash">

		```
		$ <copy>git pull origin main</copy>
		```

		It opens an editor where you can optionally enter a commit message. 
		
	1. Save and close the editor with **Esc + :wq**.

		```
		remote: Enumerating objects: 5, done.
		remote: Counting objects: 100% (5/5), done.
		remote: Compressing objects: 100% (3/3), done.
		remote: Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
		Unpacking objects: 100% (3/3), 963 bytes | 120.00 KiB/s, done.
		From https://github.com/[your-account]/[your-repo].git
		   dd7146f..dcd05ea  main       -> origin/main
		Merge made by the 'ort' strategy.
		 404.md | 1 +
		 1 file changed, 1 insertion(+)
		```

		Your clone is now updated from the fork and also contains your recent changes. 

	1. Push all changes from your clone to the fork. 

		```
		$ <copy>git push origin main</copy>
		```

		```
		Enumerating objects: 9, done.
		Counting objects: 100% (8/8), done.
		Delta compression using up to 20 threads
		Compressing objects: 100% (5/5), done.
		Writing objects: 100% (5/5), 1.04 KiB | 1.04 MiB/s, done.
		Total 5 (delta 4), reused 0 (delta 0), pack-reused 0 (from 0)
		remote: Resolving deltas: 100% (4/4), completed with 2 local objects.
		To https://github.com/[your-account]/[your-repo].git
		   dcd05ea..9431b34  main -> main
		```

	Both your clone and the fork are now up-to-date.

	However, if you get a conflict when you `pull origin`, then try Option 2.

	```
	CONFLICT (modify/delete): readme.md deleted in 921c3ada40b3848f5c2b36c5af6123224cfcc3ca and modified in HEAD.  Version HEAD of readme.md left in tree.
	Automatic merge failed; fix conflicts and then commit the result.
	```

	</if>

	<if type="gitdesktop">

	1. Now *`push origin`* to merge the changes from clone (local repo) to fork (origin).

		![Push origin](./images/desktop/clone-out-of-sync-03-push-origin.jpg " ")

	</if>

	<ins>Option 2</ins> -

	Assuming the previous option fails, then try these out.

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

	> **Caution**: For double-safety, keep backups of the local changes made in the clone.

	<if type="gitbash">

	----
	## Change the last commit

	**Problem statement**

	You entered a wrong message in the log, or forgot to add some files to stage.

	**What to do**

	You can amend your last commit (right before `push origin`). Thus, instead of doing a new commit, you combine the staged changes with your previous commit.

	To modify the commit message:

	```
	$ <copy>git commit --amend</copy>
	```

	> **Note**: Do this right after the `commit` command, before doing a `push origin`.

	To add more files for staging to the previous commit:

	1. Add the missed file or files.

		```
		$ git add full-path-to-the-file
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

	Do these before `push origin`.

	1. Perform an interactive rebase and squash your commits.

		Full syntax

		```
		$ git rebase --interactive HEAD~n
		```

		Short-form

		```
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

	Not only you did `commit to main` but also `push origin`. Can such commits be modified?

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
		 Author: manish-garodia <email@example.com>
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
	In UNIX systems, the end of a line is represented with a line feed (LF). In Windows, a line is represented with a carriage return (CR) and a line feed (LF), thus (CRLF).

	When you get code from git that was uploaded from a UNIX system, they will only have an LF.

	**What to do**

	- If you are a single developer working on a Windows system, then you can turn this warning off from the command line.

		```
		$ <copy>git config core.autocrlf true</copy>
		```

	- You can also stop this feature from your git core config.

		```
		$ <copy>git config --global core.autocrlf false</copy>
		```

	- But maybe you want to remove the warnings altogether.

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
		$ <copy>git filter-branch --subdirectory-filter [folder-to-move] -- --all</copy>
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
		$ <copy>cd ../[target-repo]</copy>
		```

	1. Add the source repo as a local remote.

		```
		$ <copy>git remote add [source-repo] ../[source-repo]</copy>
		```

	1. Fetch the local remote (source-repo).

		```
		$ <copy>git fetch [source-repo]</copy>
		```

		```
		remote: Enumerating objects: 9, done.
		remote: Counting objects: 100% (9/9), done.
		remote: Compressing objects: 100% (3/3), done.
		remote: Total 9 (delta 0), reused 6 (delta 0), pack-reused 0
		Unpacking objects: 100% (9/9), 724 bytes | 2.00 KiB/s, done.
		From ../[source-repo]
		 * [new branch]      main       -> [source-repo]/main
		```

	1. Create a branch from the source's main.

		```
		$ <copy>git branch [source-repo] remotes/[source-repo]/main</copy>
		```

		```
		Branch '[source-repo]' set up to track remote branch 'main' from '[source-repo]'.
		```

	1. Merge the files in the target repo.

		```
		$ <copy>git merge [source-repo] --allow-unrelated-histories</copy>
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
		$ <copy>git remote rm [source-repo]</copy>
		```

	1. Delete the branch of the source's main, created earlier.

		```
		$ <copy>git branch -d [source-repo]</copy>
		```

		```
		Deleted branch [source-repo] (was d84b88c).
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
	You do a `git push origin`, ` git pull origin`, or `git fetch` from Git Bash or Github Desktop and get the following message.

	```
	fatal: unable to access   
	'https://github.com/[your-account]/[your-repo].git/':   
	Recv failure: Connection was reset
	```

	```
	fatal: unable to access 'https://github.com/[your-account]/[your-repo].git/': Failed to connect to github.com port 443 after 21232 ms: Couldn't connect to server
	```

	**What happened**  

	The clone (local repo) could not talk to the fork (origin) or the main repo (upstream) because of any one of these -
	- Port 80 might be blocked
	- Have you set proxy configuration?
	- Are you still connected to the internet?

	**What to do**  

	1. Check your internet connection.
	1. Check the proxy configuration for git. <if type="hidden">See [Set up proxy config](https://manish-garodia.github.io/mg-playground/z-sandbox/?lab=fun-with-git-bits&type=gitbash#TakeaplungeintoGitBash)</if>
	1. For the clone to talk to the fork.

		- If you have set proxy, then VPN must be connected. Disconnect VPN and reconnect, if required.
		- If your account does not have a proxy, then disconnect VPN and try again without VPN. 

	----
	## Could not resolve proxy: [proxy-URL]

	**Problem statement**  
	You run a git command and get the following message.

	<if type="gitbash">
	Error in Git Bash -
	```
	fatal: unable to access 'https://github.com/[your-account]/[your-repo].git/':
	Could not resolve proxy: [proxy-url]
	```
	</if>

	<if type="gitdesktop">
	Error in Git Desktop -

	![Proxy issue-VPN error](./images/desktop/proxy-error-mask.png " ")
	</if>

	**What happened**   
	VPN is disconnected.

	**What to do**  
	1. Connect VPN and try again.
	1. If VPN is already connected, disconnect VPN and reconnect.

	> **Tip**: VPN must be connected for the clone (local repo) to talk to the fork (origin) or the main repo (upstream).

	<if type="gitdesktop">

	----
	## Upstream main does not show up in GitHub Desktop?

	**Problem statement**  
	In GitHub Desktop, you click **Branch** then &gt; **Merge into current branch**. The merge into main repo window does not show `upstream/main` under `Other branches`.

	**What to do**

	1. Open the remote upstream folder from this location.

		```
		$ <clone>\<local-repository>\.git\refs\remotes\upstream
		```

		**Example** -

		```
		D:\git\GitHub\database-livelabs\.git\refs\remotes\upstream
		```

	1. Delete the `main` file in the clone.

	1. Fetch again to get a new copy of the `main` file from the fork.

	Now, `upstream/main` will be displayed again in the merge window.

	----
	## Change default External Editor

	**Problem statement**  
	The default **External Editor** in GitHub Desktop shows, let's say, *Notepad++*.   
	You want to set the default editor to *Visual Studio Code*.

	![Default External Editor Notepad++](./images/desktop/editor-01-default-notepad.png " ")

	**What to do**  

	<!--

	1. Download the new [Atom app](https://atom.io/) (`v1.60.0`) and install afresh.

		 > **Note**: You may remove the older version of Atom manually using Window Explorer or CLI (git Bash).

	-->

	1. Open GitHub Desktop and go to **File** &gt; **Options**.

	 ![Modify GitHub preferences](./images/desktop/editor-02-modify-options.png " ")

	1. In the **Integrations** tab, under **External Editor** select the editor you want, for example *Visual Studio Code*.

	 ![Select External Editor](./images/desktop/editor-03-select-external-editor.png " ")

	1. Click **Save** to set the new external editor.

	 ![New Default Editor](./images/desktop/editor-04-new-default-editor.png " ")

		GitHub Desktop displays the new default editor.
	</if>

	----
	## Notepad++: unable to install plug-in

	**Problem statement**  
	You are installing a plug-in, for example *`ComparePlugin`*, and Notepad++ restarts but the plug-in does not install.

	**What to do**  

	<ins>Option 1</ins> - Run Notepad++ in administrative mode and then install the plug-in.   
	<ins>Option 2</ins> - Install the plug-in manually.

	----
	### Option 1

	Open Notepad++ in administrative mode - *Run as administrator*.

	### Option 2

	**Plug-ins Manual Installation**

	1. Exit Notepad++, if it is already running.

	1. Download the [ComparePlugin](https://github.com/pnedev/compare-plugin/releases/download/v2.0.1/ComparePlugin_v2.0.1_X64.zip) zip file.

	1. Extract it to a folder named **ComparePlugin**.

	1. Place *ComparePlugin.dll* in the `Notepad++\plugins` folder.

		![Plug-in structure](./images/editors/notepad-plugins-structure.png " ")

		> **Tip**: Ensure to match the folder name with the DLL name (excluding file extension).

		To find the `Notepad++\Plugins` folder, go to **Plugins** and select <i>Open Plugins Folder</i>, the last entry right below <i>Plugins Admin</i>.

	1. Start Notepad++ and check the **Plugins** menu.

		## Need further explanation ??

		By default, a windows installation places the plug-ins in this location -
		 - `C:\Program Files\Notepad++\plugins`

		If the zip file has associated files, then install them to appropriate locations. For `ComparePlugin`, place the *`sqlite3.dll`* and *`git2.dll`* files into the subfolder not the parent `ComparePlugin` folder -
		 - `C:\Program Files\Notepad++\plugins\ComparePlugin\ComparePlugin\`

		For example,   
		 `C:\Programs\Notepad++ 8.4.4\plugins\ComparePlugin\ComparePlugin`. Right, that’s two levels with the same name.

		![Plugins folder](./images/editors/notepad-plugins-folder.png " ")

		Have you got other files inside `ComparePlugin\` other than `ComparePlugin.dll` ?
		 - If yes, move them to `ComparePlugin\ComparePlugin\` and leave only `ComparePlugin.dll` in the first (main) `ComparePlugin\` folder.

		----
		### **Versions - Notepad++ and ComparePlug-ins**

		Depending on the Notepad++ version, install the corresponding `ComparePlugin`.

		| Notepad++                                      | ComparePlug-in   |
		|------------------------------------------------|-----------------|
		| **v8.2.2** and newer (**v8.3**, **v8.4**, ...) | *v2.0.2*        |
		| **v7.7** thru **v8.2.1**                       | *v2.0.1*        |
		| **v7.7** or older                              | *v2.0.0*        |

		 - Update Notepad++ at the first possible opportunity

			## Cite reference

			 - [unable-to-install-compare-plugin 7](https://community.notepad-plus-plus.org/topic/18520/unable-to-install-compare-plugin/7)
			 - [unable-to-install-compare-plugin 6](https://community.notepad-plus-plus.org/topic/18520/unable-to-install-compare-plugin/6)
			 - [compare-plugin-not-working 3](https://community.notepad-plus-plus.org/topic/20123/compare-plugin-not-working/3)
			 - [compare-plugin-not-working 4](https://community.notepad-plus-plus.org/topic/20123/compare-plugin-not-working/4)
			 - [npp-compare bugs](https://sourceforge.net/p/npp-compare/bugs/39/)
			 - [cannot-install-notepad-plugins](https://www.winhelponline.com/blog/cannot-install-notepad-plugins-fix/)

	----
	## Unable to install plug-in: `atom-live-server-####`

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

	**What happened**  
	 SSL certificate validation was not successful.

	**What to do**  
	 Add this line to the file `~/.atom./apm/.apmrc`.

	 ```
	 strict-ssl = false
	 ```

	 It will bypass the SSL certificate validation and install the live-server plug-ins.

	 > **Note**: Though the instructions in the `.apmrc` file says *... should not be edited ...*, ignore that and continue adding the given line.

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

 - [git docs](https://git-scm.com/docs/)

 - [How to download file from GitHub - gitkraken](https://www.gitkraken.com/learn/git/github-download#how-to-downlaod-a-file-from-github)

 - [How to Create a Multi-page Website using Github Pages - phuston](https://phuston.github.io/patrickandfrantonarethebestninjas/howto)

## Acknowledgments

 - **Author** - [](include:author)
 - **Created on** - February 5, (Sat) 2022
 - **Last Updated on** - December 1, (Sun) 2024
 - **Questions/Feedback?** - Blame [](include:profile)

<!--


Check for disallowed words :: *Wordlist Check* ::

To check for disallowed words and incorrect usage, download this tool, if not already downloaded, and run it on your contents.

 - [wordlist.sh](https://bit.ly/wordlist-mg)
 - [wordlist.sh](https://bit.ly/3ZgJ4aj)
 - [wordlist.zip](https://bit.ly/wordlist_mg)
 - [wordlist.sh](https://objectstorage.ap-seoul-1.oraclecloud.com/p/nYgbWDImBDQAqUfiRNFXaA9UueC3w1ZpuEi7YviCUhYptHuY49WDy0eKBQ4G3DFN/n/cnmyhyct1k43/b/mg-store/o/wordlist.sh)

 - [wordlist.zip](https://bit.ly/wordlist_mg)

	From the compressed file, extract the tool *`wordlist-check.sh`* and store it on your system, for example the `Downloads` folder.

	Glance a piece of code inside the tool -

	```
	$ <copy>grep -wrEniTaH -B 0 --color=always 'above|accessable|ad.hoc|ada.compliant|adaptor|adhoc|admin|advisor|afterwards|aggre-gator|air.bill|alive|allow|allow.list|allowed|allows|alphabetical|alphanumerical|alright|amongst|analogue|and/or|anti|as.per|as-of date|associate to|associate. to|auto|back.plane|back.slash|back.space|backend|back-order|backwardly|backwards|band.width|be escaped|be sure|being that|below|bi|bitvector|bit-vector|black.hat|bogus|boiler-plate|bold.face|boot|bottom up|bottom.most|bottomup|break.point|built in|builtin|bulletted|busy.bar|busy.box|byte.code|can not|cancell|cancellable|cancelled|cancelling|cancells|case-insensitive|cashe|cautionlist|caution-list|centigrade|change-able|check.list|check.lists|checkin|checkins|children elements|c-language|classpath|class-path|cleans-up|clean-up|click on|click.jack|clicked on|clicks on|client-server|clientside|clip.board|cloud-native|clusterwide|cluster-wide|co|code-base|commandline|comment out|commented out|comments out|context sensitive|copy protected|copyprotected|crash|c-shell|cut-off|cuts-off|data.base|dataguide|data-guide|datamart|data-mart|datasource|data-source|datawarehouse|data-warehouse|datum|de|dead|demo|dependant|depress|descripter|dezoom|dial into|dials into|dialsup|dialup|disabled|done|double.click on|double.clicked on|double.clicks on|doublesided|down.time|drilldown|dropdown|dumb|dynamic link library|easier|easy|else|end.line|end.user|end.users|enterprise-wide|equi-join|failed-over|fat|fatal|fault tolerant|feed-back|fingerprint-reader|firm.ware|flow.chart|flow.charts|foo|formatable|formated|forwards|freeform|frontend|geo-code|geo-fence|geo-location|geo-spatial|gray.list|gray.scale|grayed-out|graylist|gray-out|grey|hand-held|hard.code|hard.coded|hard.copy|hard.copies|hard-ware|he|her|hex|hexa-decimal|high level|high-availability|higher|him|hit|homepage|home-page|hot.fix|hot.keys|hyper.text|illegal|in.line|indicative|indices|info|information on|instal|inter|intra|irrecoverable|issue|italicise|joy.stick|judgement|just|keep in mind|key.store|key.stores|key.word|key.words|lady|landscape-mode|left.hand|legal|licence|life-cycle|like|linearise|list.box|live|log into|logged into|logging into|logoff|logout|logs into|loop.back|lowcost|lower|lower.case|lowlevel|machine-learning|mail.box|mailstop|mail-stop|main.frame|main.frames|make-file|man|man-in-the-middle|mash-up|master|mathematic|matrices|men|menu.option|meta.data|mice|mono.space|moveable|multi|name.space|name.spaces|navigation-tree|need.to|needs.to|new-line|newsfeed|news-feed|non|numerical|object oriented|obsolete |off site|off.line|off.load|off.premises|offsite|okay|on.board|on.premise|once|one time|on-line|on-screen|on-site|onwards|openended|opensource|open-source|oracle corporation|oracle data.server|oracle database.server|outdent|out-of-the-box|outwards|over.all|over.estimate|over.ride|page-able|pageout|per.cent|pick-up|picks-up|please|portrait-mode|possesses|post.installation|post.processor|postal.code|postman|poweroff|power-off|poweron|power-on|pre|prepend|preventative|private-cloud|progress-indicator|pseudo|public-private|pull.down|punch-out|punched-out|push.button|push.buttons|queriable|queueing|quickstart|quote.marks|quotes|random-access|readonly|readout|read-write|realtime|rearchive|record oriented|record-length|record-mark|record-size|remote.host|removeable|replace-mode|re-rout|re-run|re-usable|right.hand|right.most|roll-up|run.time|run-out|s/he|salable|salesman|saleswoman|scaleable|screen-reader|scroll.arrow|scroll.bar|scroll.box|scrolling.list|section.508|selfchecking|selfdefining|selfinitializing|selfloading|selfrelocating|semi.annual|semi.monthly|semi.weekly|server side|serverside|setid|set-id|shareable|she|short term|shortcut.keys|shortcut.menu|should|shut-down|shut-off|shuts-off|sign.on|sign-in|signout|silent.installation|simple|simply|singlesided|sizeable|slider|smart.card|smart.phone|soft.copy|soft.copies|space-bar|stand.alone|start-up|statusbar|status-bar|sub|super.set|super.user|supply-chain|surviving|survivor|swapin|swapout|synch|system-wide|table.space|table.spaces|tap on|taps on|tape-mark|tar|task.bar|task.flow|thinclient|thin-client|tick.mark|tick.marks|time share|time.line|time.lines|timeframe|time-frame|time-out|time-series|timeslice|time-slice|timestamp|to-do|tool.bar|tool.bars|tool.set|tool.sets|tool.tip|tool.tips|top.most|topdown|touch sensitive|touchscreen|touchsensitive|towards|track.ball|trouble.free|trust-keystore|turn.around|type.bar|type.case|type.face|typeahead|ultra|un|under-estimate|unzoom|upper.case|up-time|upwards|useable|userdefined|userID|user-ID|username|useroriented|userspecified|usersupplied|userwritten|vendee|via|victim|voice frequency|voice grade|warmup|web.site|web.sites|webagent|web-agent|webform|web-form|webmaster|web-master|webpage|webpages|web-page|web-pages|webportal|web-portal|webserver|webservers|web-server|web-servers|webservice|webservices|web-service|web-services|whitehat|white.hat|whitelist|whitelists|white.list|white.lists|whitepaper|whitepapers|white.paper|white.papers|wild.card|wild.cards|wish|woman|women|word-length|world-wide|wrap-around|writeback|writeenable|writeup|[cw]ould|zero suppression|zoom-in|zoom-out|zip|zipped|zips|zipping' --exclude={\*index\*,\*initialize-environment\*,\*ISHCONDITION\*,\*manifest\*,\*ocw-livelabs-rat-overview\*,\*prepare-setup\*,\*.gitignore\*,\*git-filter-repo\*,\*wordlist-check\*,\*.css,\*.dsnb,\*.dva,\*.gif,\*.\*ish\*,\*.jpg,\*.JPG,\*.jpeg,\*.js,\*.json,\*.log,\*.map,\*.old,\*.png,\*.PNG,\*.py,\*.rsp,\*.sql,\*.tmpl,\*.tiff,\*.yaml,\*.yml} --exclude-dir={\*.git\*,\*lintchecker\*,\*learning-library\*,\*sample-tutorial\*,\*tutorial_creator\*,\*vale\*}</copy>
	```

	### Qualifiers

	*grep* (Global Regular Expression Print)

	- **`'text1|text2|textn'`** - separate different words with pipes to search for multiple patterns (or words) together
	- **`w`**, *`--word-regexp`* - match only whole words
	- **`r`**, *`--recursive`* - include subdirectories
	- **`E`**, *`--extended-regexp`* - extended regular expression
	- **`n`**, *`--line-number`* - prints line number
	- **`i`**, *`--ignore-case`* - for case independent
	- **`T`**, *`--initial-tab`* - shows tab spacing
	- **`a`**, *`--text`* - equivalent to --binary-files=text
	- **`H`**, *`--with-filename`* - prints file name
	- **`B 0`**, *`--before-context=x`* - prints `x` lines before the context; keep `0` to exclude extra lines
	- **`color=always`**, *`--colour[=WHEN]`* - use color markers to highlight;	other options are  `never` and `auto`
	- **`--exclude=FILE_PATTERN`** - skips the file or directory matching this pattern
	- **`--exclude={\*.png,\*.jpg}`** - skips multiple files together; use backslash  `\` to escape characters
	- **`--exclude-dir=PATTERN`** - skip the directory matching this pattern
	- **`--exclude-dir={\*PATTERN1\*,\*PATTERN2\*}`** - skips multiple directories together; use backslash  `\` to escape characters

	More qualifiers -

	- `c`, `--count` - shows count of words
	- `h`, `--no-filename` - hides the file names
	- `l`, `--files-with-matches` - displays only file names containing matches
	- `L`, `--files-without-matches` - displays only file names without matches
	- `o`, `--only-matching` - shows only matching part
	- `R`, `--dereference-recursive` - recursive and also follow symbolic links
	- `v`, `--invert-match` - invert match; displays all but matched words
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


<if type="hidden">
</if>

 - [wordlist.sh](https://bit.ly/wordlist-mg)
 - [wordlist.sh](https://bit.ly/3ZgJ4aj)
 - [wordlist.zip](https://bit.ly/wordlist_mg)
 - [wordlist.sh](https://objectstorage.ap-seoul-1.oraclecloud.com/p/nYgbWDImBDQAqUfiRNFXaA9UueC3w1ZpuEi7YviCUhYptHuY49WDy0eKBQ4G3DFN/n/cnmyhyct1k43/b/mg-store/o/wordlist.sh)


-->
