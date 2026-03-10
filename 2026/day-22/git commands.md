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

