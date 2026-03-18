# Git Commands Reference

## Setup & Configuration

### git config
**Syntax:**
```bash
git config [--global] user.name "Name"
git config [--global] user.email "Email"
```
**Explanation:** Configure Git user settings globally or locally.  

**Example:**
```bash
git config --global user.name "Shubham Nisal"
git config --global user.email "nisalshubham140@gmail.com"
```

### git --version
**Syntax:**
```bash
git --version
```
**Explanation:** Displays the installed Git version.  


### git init
**Syntax:**
```bash
git init
```
**Explanation:** Initializes a new Git repository in the current directory.  

---

## Basic Workflow

### git add
**Syntax:**
```bash
git add <file>
git add .
```
**Explanation:** Stages files for commit.  

**Examples:**
```bash
git add git-commands.md
git add .
```

### git commit
**Syntax:**
```bash
git commit -m "message"
git commit -a -m "message"
```
**Explanation:** Saves staged changes into the repository. `-a` stages modified files automatically.  

**Examples:**
```bash
git commit -m "Add git commands documentation"
git commit -a -m "Added modified files to the repo"
```

### git status
**Syntax:**
```bash
git status
```
**Explanation:** Shows the state of the working directory and staging area.  

**Example:**
```bash
git status
```

### git log
**Syntax:**
```bash
git log
git log --oneline
git log --oneline --graph
git log --oneline --graph --all
```
**Explanation:** Shows commit history in different formats.  

**Examples:**
```bash
git log
git log --oneline
git log --oneline --graph --all
```

### git diff
**Syntax:**
```bash
git diff
```
**Explanation:** Shows differences between working directory and staging area.

**Example:**
```bash
git diff
```

---

## Branching

### git branch
**Syntax:**
```bash
git branch
git branch <branch-name>
git branch -d <branch-name>
```
**Explanation:** Create, list, or delete branches.  

**Examples:**
```bash
git branch
git branch feature-1
git branch -d feature-2
```

### git checkout
**Syntax:**
```bash
git checkout <branch-name>
git checkout -b <branch-name>
```
**Explanation:** Switch branches or create and switch in one step (older syntax).  

**Examples:**
```bash
git checkout feature-1
git checkout -b feature-2
```

### git switch
**Syntax:**
```bash
git switch <branch-name>
git switch -c <branch-name>
```
**Explanation:** Modern command to switch or create branches.  

**Examples:**
```bash
git switch feature-1
git switch -c feature-dashboard
```

---

## Remote

### git remote
**Syntax:**
```bash
git remote add origin <url>
git remote -v
```
**Explanation:** Manage remote repositories.  

**Examples:**
```bash
git remote add origin https://github.com/ShubhamNisal/devops-git-practice.git
git remote -v
```

### git push
**Syntax:**
```bash
git push -u origin <branch>
```
**Explanation:** Push changes to remote repository. `-u` sets upstream tracking.  

**Examples:**
```bash
git push -u origin main
git push -u origin feature-1
```

### git pull
**Syntax:**
```bash
git pull
```
**Explanation:** Fetch and merge changes from remote.  

**Example:**
```bash
git pull
```

### git fetch
**Syntax:**
```bash
git fetch
```
**Explanation:** Download changes without merging.  

**Example:**
```bash
git fetch
```

### git clone
**Syntax:**
```bash
git clone <url>
```
**Explanation:** Clone repository from remote.  

**Example:**
```bash
git clone https://github.com/ShubhamNisal/devops-git-practice.git
```

---

## Merging & Rebasing

### git merge
**Syntax:**
```bash
git merge <branch>
git merge --squash <branch>
```
**Explanation:** Merge branches into current branch. `--squash` combines commits.  

**Examples:**
```bash
git merge feature-login
git merge --squash feature-profile
```

### git rebase
**Syntax:**
```bash
git rebase <branch>
```
**Explanation:** Reapply commits on top of another branch.  

**Example:**
```bash
git rebase master
```

---

## Stash

### git stash
**Syntax:**
```bash
git stash
git stash list
git stash pop
git stash apply stash@{n}
git stash push -m "message"
```
**Explanation:** Save and restore uncommitted changes.  

**Examples:**
```bash
git stash
git stash list
git stash pop
git stash apply stash@{0}
git stash push -m "work in progress"
```

---

## Cherry Pick

### git cherry-pick
**Syntax:**
```bash
git cherry-pick <commit-hash>
```
**Explanation:** Apply a specific commit to current branch.  

**Example:**
```bash
git cherry-pick bcfbb1d
```

---

## Reset & Revert

### git reset
**Syntax:**
```bash
git reset --soft HEAD~1
git reset --mixed HEAD~1
git reset --hard HEAD~1
```
**Explanation:** Undo commits by moving HEAD.  
- `--soft`: Keep changes staged.  
- `--mixed`: Keep changes unstaged.  
- `--hard`: Discard changes (destructive).  

**Examples:**
```bash
git reset --soft HEAD~1
git reset --mixed HEAD~1
git reset --hard HEAD~1
```

### git revert
**Syntax:**
```bash
git revert <commit-hash>
```
**Explanation:** Create new commit that undoes changes without rewriting history.  

**Example:**
```bash
git revert b26728e
```

---

## Safety Nets

### git reflog
**Syntax:**
```bash
git reflog
```
**Explanation:** Show all HEAD movements (recover lost commits).  

**Example:**
```bash
git reflog
```

---
