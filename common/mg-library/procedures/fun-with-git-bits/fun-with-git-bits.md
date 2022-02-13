# Fun with Git-Bits

## Introduction

The lab contains basic concepts and commands of github, git desktop, and gitbash ![git](./../../../images/git-black-small.png).

## Basic concepts

The fork creates a copy of the entire Oracle learning-library (OLL) master repository into our GitHub (GH) account. 
 - Cannot fork a single (or a specific) folder from OLL. In GH, it works as a repository.
 - Cannot create multiple forks from OLL. 

Creating a new fork opens the existing repository from our GH account which is already forked.

- **Head repository** - where to get data from
- **Base repository** - where to push data to

Merge pull request to update the fork from the latest changes in OLL. Fetch origin from Git Desktop and bring the clone up-to-date.

If we use a file from another location outside the workshop and the file gets modified, for example a lab from the common library, GH automatically updates that file in our workshop. No action required from our side. The turnaround time to approve pull requests may vary, from 2 days to a week or more. 

If you submit a pull request from the fork to OLL, the labs will not show up on LiveLabs immediately. The admin (Livelabs reviewers) will review the submissions on OLL, creates the required pages, and finally makes them available on the LiveLabs application.

- All interactions between the clone and the fork can take place using either one of these.
	- *GitHub Desktop*
	- *Git GUI* 
	- *GitBash*

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

	## Best practices

	You must keep your fork and clone updated with Oracle learning-library, even though you are not actively working on your workshop or your workshop has no modifications. 

	If you do not update your clone and fork for a long time and the number of commit changes with OLL master is significantly high, you may find conflicts while merging or submitting a pull request. Then you may need to delete your fork and your clone, and then redo like afresh. 

	> Update the fork first before pushing the changes from clone to fork and then pull request from fork to OLL. This step ensures other person's changes are also merged.   
	*GH does not allow such pull requests which creates conflicts*.

	If you modify an older version of a file, GH returns a conflict error on pull request. In such case, update the fork and clone, make changes your file, and submit the pull request again.

	Update the fork if a file in-progress is modified by someone else.

	If more than one person is working on the same lab, they must keep their fork updated to avoid conflicts.

	If a lab is in development and a writer wants to initiate a review, do it from the fork, not from OLL. 

	Create a fork from the GH page and create a clone of fork from Git Desktop. If it takes longer, disconnect VPN and try creating the clone again.

	## Do's and Don'ts

	 Do not do 'pull origin' to update the fork every day.

	 Do not submit pull requests from fork to OLL every day, else the moderators/admins would reject.

	 Push to OLL only on completion of a lab/md/file(s) or ready for release.

	## Advanced concepts

	TBD

## Secret tips and tricks

Glad for your enthusiasm, but it is on its way... 

coming soon... stay tuned  ![git](./../../../images/git-black-small.png) 

![Work-in-progress](./../../../images/maintenance-work-in-progress.jpg " ")**Caption:** Work-in-progress

## Acknowledgements

 - **Author** - Manish Garodia, Team Database UAD
 - **Last Updated on** - February 13, (Sun) 2022
 - **Questions/Feedback?** - Blame [manish.garodia@oracle.com](./../../../intro/files/email.md)
