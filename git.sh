-----------------------------------------------------------------------
# CREATE A NEW BRANCH CALLED ABOUT
-----------------------------------------------------------------------
# checkout to about branch (all working tree state will be moved to it,
# i.e. all uncommited changes in the master branch)
git checkout -b about [master]

#create a second branch about2, but don’t switch to it:
git branch about2 about

-----------------------------------------------------------------------
# RESOLVING CONFLICTS
-----------------------------------------------------------------------
# add another language to your about.html file, and commit your change:
git commit -m "add Javascript to list" -a

# switch over to about2.
git checkout about2

# add another name to about.html on the same line where you added your last entry,
# but this time make it something different.
git commit -m "add EMCAScript to list" -a

# start by switching back to about, and then try merging about2 into it:
git checkout about

#Switched to branch "about"
git merge about2

#CONFLICT (content): Merge conflict in about.html
git mergetool
#Hit return to start merge resolution tool (opendiff):

-------------------------------------------------------
# BACKUP
-------------------------------------------------------
git init --bare share #on usb or backup drive
cd <origin>
git remote add backup /path/to/the/backup/dir
git push backup master

-------------------------------------------------------
# RETRIEVING BACKUP
-------------------------------------------------------
git pull backup master
-------------------------------------------------------

-------------------------------------------------------
# SEE RECENT HISTORY
-------------------------------------------------------
gitk <filename>
git log -p <filename>
git log --graph --pretty=oneline --abbrev-commit --decorate #short log output
git log --follow -p <filename>
git whatchanged -p <filename>

# see all branches, not just the current
git log --graph --all

-------------------------------------------------------
# UNDO COMMIT
-------------------------------------------------------
# the safest way is to rebase interactivelly
git rebase -i HEAD^^

# undo commit, but leave your files and your index
# (move HEAD ptr to the previous commit)
# all changes are still staged (still in index so if we do
# git commit again we will undo undo, return at the beginning)
git reset --soft HEAD~1

# undo the commit, but leave files in the working tree
# (unstages the changes and removes last commit)
git reset HEAD~1

# non reversible, deletes current commit and all changes
# in working tree sets current commit to the parent of the deleted one
git reset --hard HEAD~1
# or same
git reset --hard HEAD^

# revert commit, but add more commit messages to the history
git revert HEAD~3 #(HEAD~3 is the same as HEAD^^^)

-------------------------------------------------------
# VIEW DIFFS OF SAME FILE IN DIFFERENT COMMITS
-------------------------------------------------------
git diff HEAD:Git.txt HEAD^:Git.txt

# view diffs on stash
# ------------------------------------------
git stash show -p stash@{0}

-------------------------------------------------------
# UNDO COMMIT
-------------------------------------------------------
$ git commit -a
$ git revert 1b6d
#will undo just the commit with the given hash. The revert is recorded as a new commit, which you can confirm by running git log.

CHECKOUT by referencing commit with message
--------------------------------------------------------
$ git checkout :/"My first b"
#to jump to the commit that starts with a given message. You can also ask for the 5th-last saved state:
$ git checkout master~5

WHAT HAVE I DONE?
--------------------------------------------------------
$ git diff "@{yesterday}"
#Or between a particular version and 2 versions ago:
$ git diff 1b6d "master~2"
#In each case the output is a patch that can be applied with git apply. Try also:
$ git whatchanged --since="2 weeks ago"

#Let A, B, C, D be four successive commits where B is the same as A except some files have
#been removed. We want to add the files back at D. How can we do this?
#There are at least three solutions. Assuming we are at D:
#The difference between A and B are the removed files. We can create a patch representing this difference and apply it:
$ git diff B A | git apply
#Since we saved the files back at A, we can retrieve them:
$ git checkout A foo.c bar.h
#We can view going from A to B as a change we want to undo:
$ git revert B

#pull, clone git and linux
git pull/clone http://github.com/torvalds/linux.git #Linux
git pull/clone http://github.com/gitster/git.git #Git

#diff's between staged and commited
git diff --staged

#fork github
1. Fork the “Spoon-Knife ” repo

2. $ git clone git@github.com:username/Spoon-Knife.git (Clone the “Spoon-Knife” project my fork)

3. When a repo is cloned, it has a default remote called origin that points to your fork on GitHub,
   not the original repo it was forked from. To keep track of the original repo,
   you need to add another remote named upstream:

   $ git remote add upstream git://github.com/octocat/Spoon-Knife.git
   $ git fetch upstream

4. Pull commits
   $ git merge upstream/master

SANBOXING STRATEGY
---------------------------------------------------------------------------------------------
git checkout master
# update master branch from the origin (last commit: a7578e95cbdbb47e)
git fetch upstream
git merge upstream/master
# play/work in sanbox
git checkout sanbox # (local sanbox branch)
# work here and commit all changes than rebase
# commited changes to the new updates from the origin
git commit -a -m "some changes"
git rebase a7578e95cbdbb47e
--------------------------------------------------------------------------------------------
gitignore files
--------------------------------------------------------------------------------------------
There is one gotcha. If you commit files and then add them to the .gitignore file,
"git status" will show these ignored files in your untracked files ready for a commit.

In order to get around this, you have to remove the files from the git index with
"git rm -cached " This will take it out of the "git status" command. Warning if you
just run "git rm ," it will delete the file, which may not be what you want to do.
The "cached" is important.

There is an alternative way to do this, if the rm command makes you uncomfortable,
that is, using the "git-update-index --remove " command to modify the current working
index and directory cache. Both of these methods will clear previously committed,
but now ignored files, out of your git status, and have them ignored in your repository.
--------------------------------------------------------------------------------------------
git diff branches
--------------------------------------------------------------------------------------------
git diff master..branch2
--------------------------------------------------------------------------------------------
# Clone pull from remote repo, then to view all available branches locally:
git branch -a
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/develop
  remotes/origin/master
  remotes/origin/ruport-old-0.1
# Just want to take a quick peek at an upstream branch? check it out directly:
git checkout origin/develop
# You want to work on that branch? you'll need to create a local tracking branch:
git checkout -b develop origin/develop
----------------------------------------------------------------------------------------
# copying content of a file at the particular branch
# into your current working dir w/o swhitching branches
git checkout <BRANCH> --path/to/file.rb
# stage line by line
git add -p
# search commit message w/ 'stupid' word)
git show :/stupid
# same as > cd -
git checkout -
# which branches are merged with current branch
git branch --merged
git branch --not-merged
# which branch contains particular sha1
git branch --contains <sha1>
# show commits in A, not in B
git log branchA ^branchB
# if you delete smth recover it
git fsck --lost-found
# show stats
git diff HEAD^ --stat
# if text moves between B A
# it will blame original commit not when
# the line was moved to different file
git blame -M
git blame -C
git blame -CC
git blame -CCC
# multi remote fetches (fetch from group of remote repos)
git config remotes.mygroup 'remote1 remote2'
git fetch mygroup
# directly what we want
git status -sb
# diffs by word not by line
git diff HEAD^ --word-diff
# retains commit as staged
git reset --soft HEAD^
# who works on this project
git shortlog -sn
# I want this guy to get credit for this commit
# with this script in credit file
# git commit --amend -author "$1 <$2>" -C HEAD
# sets comments author as sameone else
git credit "Linus Torvald" torvalds@linux.com
------------------------------------------------------------------------
# Cherry-pick commit from remote repository
# First we need to fetch remote repo
git fetch <remote_repo_name>

# then we cherry pick by commit sha1
git cherry-pick <sha1>

# cherry pick just parts of a particular commit: -n = --no-commit
# option says pick this <sha1> but don't commit to the current branch
git cherry-pick -n <sha1>
git reset    # unstage changes from <sha1> commit
git add -p   # make choice what to add to the commit
git commit   # commit

------------------------------------------------------------------------
# Edit last incorrect commit message
git commit --amend -m "New commit message"

# this is equivalent to :
git reset --soft HEAD^

# ... do something else to come up with the right tree ...
git commit -c ORIG_HEAD

# Amend last commit: we accidentally left something out of our
# last commit (a file or a change to a file that is just committed)
# stage the extra changes like for a normal commit and then commit
# with the --amend argument:
git add .
git commit --amend
# if we don't specify a commit message with -m we will be prompted
# with the previous commit message as a default.
------------------------------------------------------------------------
# reset --hard w/ keeping the unstaged changes (keep the working code):
git stash
git reset --hard 0d1d7fc32
git stash pop
# This saves the modifications, then reapplies that patch after resetting.
# You could get merge conflicts, if you've modified things which were
# changed since the commit you reset to
-------------------------------------------------------------------------
# 12 curated tips and workflows from the trenhces
-------------------------------------------------------------------------
# making git diff wrap long lines: just type -S while viewing the diff
git config core.pager 'less -r'          # sets pager for current project
git config --global core.pager 'less -r' # sets pager globally for all projects

# set global proxy
git config --global https.proxy https://user:password@address:port

# sometimes you want to clone just one branch,
# to clone a branch w/o fetching other branches:
mkdir $BRANCH
cd $BRANCH
git init
git remote add -t $BRANCH -f origin $REMOTE_REPO  # where $REMOTE_REPO is host:/dir.git
git checkout $BRANCH

# diff file against remote branch
git diff localbranch remotebranch filepath

--------------------------------------------------------------------------
# list all deleted files in the repository
git log --dif-filter=D --summary

# Restore a deleted file in a Git repo
# * When I know when that file was deleted:
git checkout HEAD^ foo.bar

# * When I don't know when the file was deleted:
#   1. find the commit that deleted the given file
#      find the last commit that affected the given
#      path (-n 1 outputs only last commit):
git rev-list -n 1 HEAD -- <file_path>

#   2. get that file back into the working copy
#      (checkout the version at the commit before):
git checkout <deleting_commit>^ -- <file_path>

--------------------------------------------------------------------------
# search through the entire git diff history for a string
# you know it is somewhere but don't know where
git rev-list --all | (
    while read revision; do
        git grep -F 'Your search string' $revision
    done
)

# making a more recent(better) branch the new master
git checkout better_branch
git merge --strategy=ours master
git checkout master
git merge better_branch

# If you want your history to be a little clearer, you can customize the commit message.
# You can change the second step to:
git merge --strategy=ours --no-commit master
git commit # here add your custom message to the commit template

#--------------------------------------------------------------------------
# break line long messages
#--------------------------------------------------------------------------
git commit -m $'very very\nvery long\nmessage.'

#--------------------------------------------------------------------------
# push new branch to remote git repository
#--------------------------------------------------------------------------
# Let's say a new branch is called plugin and remote repo is called origin
# If origin does not have a plugin branch, it is created on the fly
git push -u origin plugin

# Say a friend wants to access the new branch on the GitHub.
git fetch origin                    # updates his repo with the changes from the remote.
git checkout --track origin/plugin  # creates a local branch named plugin that matches
                                    # the origin/plugin branch and tells git that he wants to
                                    # be able to easily push and pull from the branch on GitHub.

#--------------------------------------------------------------------------
# Rebase
#--------------------------------------------------------------------------
# we have 2 branches: 'master' and 'bugfix'
# we checkout 'master', and we want to rebase 'bugfix' on to 'master'
#
#         D --- E <- bugfix
#        /
# A --- B ----- C <- master*
#
git checkout bugfix
git rebase master
# or
git rebase master bugfix
# A --- B --- C --- D --- E <- bugfix*
#             ^
#             master
#
git branch -f master bugfix
# A --- B --- C --- D --- E <- bugfix*
#                              master
git checkout master
# A --- B --- C --- D --- E <- master*
#                              bugfix
git branch -d bugfix
# A --- B --- C --- D --- E <- master*
#
#--------------------------------------------------------------------------
# remove files from index w/o removing it from working tree
#--------------------------------------------------------------------------
git rm --cached <file>

# reset hard remote git repo
#-------------------------------
git reset --hard <commit>  # on local machine
git push --force origin <branch> # to remote git repo
