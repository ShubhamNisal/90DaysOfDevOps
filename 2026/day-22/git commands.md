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
