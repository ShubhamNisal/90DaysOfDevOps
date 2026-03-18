# Git Commands Reference

## Setup & Configuration

### git config
Used to configure Git user settings.

Example:
git config --global user.name "Shubham Nisal"
git config --global user.email "nisalshubham140@gmail.com"

### git --version
Displays the installed Git version.

Example:
git --version


## Basic Workflow

### git init
Initializes a new Git repository.

Example:
git init

### git add
Stages files for commit.

Example:
git add git-commands.md


### git commit
Saves staged changes into the repository.

Example:
git commit -m "Add git commands documentation"

Add & commmit:
git commit -a -m "Added modified files to the repo"

## Viewing Changes

### git status
Shows the state of the working directory and staging area.

Example:
git status


### git log
Shows commit history.

Example:
git log


### git log --oneline
Shows commit history in short format.

Example:
git log --oneline

### git diff
Shows differences between working directory and staging area.

Example:
git diff


### git add .
Stages all changed files.

Example:
git add .


### Day 23
```
git branch
git branch -d feature-2
git branch feature-1
git checkout -b feature-2
git checkout feature-1
git commit -m "Added new file: file1.txt"
git log
git log --oneline
git switch feature-1
git switch main
git switch master
git remote add origin https://github.com/ShubhamNisal/devops-git-practice.git
git remote -v
git push -u origin main
git push -u origin master
git push -u origin feature-1
git pull
```

### Day 23
```
git branch feature-login
git branch feature-signup
git cherry-pick bcfbb1d
git commit -a -m "Added demofile1.txt"
git commit -a -m "Added demofile2.txt"
git commit -a -m "Added profile changes"
git commit -a -m "Commit before Cherry Picking"
git commit -a -m "Dashboard commit 2"
git commit -a -m "Hotfix Commit 1"
git commit -a -m "Hotfix Commit 2"
git commit -a -m "Hotfix Commit 3"
git commit -a -m "Modified devops.txt"
git commit -a -m "Modiied readme1.md before rebase"
git commit -a -m "Profile commit 2"
git commit -a -m "Profile commit 4"
git commit -a -m "Settings commit 1"
git commit -a -m "Settings commit 2"
git commit -a -m "Settings commit 3"
git commit -m "Added readme1.md"
git commit -m "Added readme2.md"
git commit -m "Dashboard commit 1"
git commit -m "Dashboard commit 2"
git commit -m "Profile commit 1"
git commit -m "Profile commit 3"
git log --oneline
git log --oneline --graph
git log --oneline --graph --all
git merge --squash feature-profile
git merge feature-login
git merge feature-settings
git merge feature-signup
git rebase master
git stash
git stash apply stash@{0}
git stash list
git stash pop
git stash push -m "Change 2"
git stash push -m "work in progress"
git status
git switch -c feature-dashboard
git switch -c feature-hotfix
git switch -c feature-profile
git switch -c feature-settings
git switch feature login
git switch feature-dashboard
git switch feature-hotfix
git switch feature-login
git switch feature-settings
git switch feature-signup
git switch master
```

### Day 24

```
git branch feature-login
git branch feature-signup
git cherry-pick bcfbb1d
git log --oneline
git log --oneline --graph
git log --oneline --graph --all
git merge --squash feature-profile
git merge feature-login
git merge feature-settings
git merge feature-signup
git rebase master
git stash
git stash apply stash@{0}
git stash list
git stash pop
git stash push -m "Change 2"
git stash push -m "work in progress"
git status
git switch -c feature-dashboard
git switch -c feature-hotfix
git switch -c feature-profile
git switch -c feature-settings
git switch feature login
git switch feature-dashboard
git switch feature-hotfix
git switch feature-login
git switch feature-settings
git switch feature-signup
git switch master

```

### Day 25

```
git log --oneline -5
git reflog
git reset --hard HEAD~1
git reset --mixed HEAD~1
git reset --soft HEAD~1
git revert b26728e

```
