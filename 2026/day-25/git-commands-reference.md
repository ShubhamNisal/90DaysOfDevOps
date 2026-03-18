# Git Commands Reference Guide

## 1. Setup & Config
* `git config --global user.name "Your Name"`      (set username globally)
* `git config --global user.email "your.email@example.com"`      (set email globally)
* `git config --list`      (show all Git configurations)
* `git init`      (initialize new repository)
* `git --version`      (check installed Git version)

---

## 2. Basic Workflow
* `git status`      (show working directory and staging area status)
* `git add <file>`      (stage specific file)
* `git add .`      (stage all changed files)
* `git commit -m "Message"`      (commit staged changes with message)
* `git commit -a -m "Message"`      (stage modified files and commit)
* `git log`      (show commit history)
* `git log --oneline`      (short commit history)
* `git log --oneline --graph`      (graph view of commits)
* `git log --oneline --graph --all`      (graph view of all branches)
* `git diff`      (show unstaged changes)
* `git diff --staged`      (show staged changes)

---

## 3. Branching
* `git branch <branch-name>`      (create branch)
* `git branch -d <branch-name>`      (delete branch)
* `git checkout <branch-name>`      (switch branch - old syntax)
* `git checkout -b <branch-name>`      (create & switch branch - old syntax)
* `git switch <branch-name>`      (switch branch - modern syntax)
* `git switch -c <branch-name>`      (create & switch branch - modern syntax)
* `git merge <branch-name>`      (merge branch into current branch)
* `git merge --squash <branch-name>`      (squash merge commits into one)

---

## 4. Remote
* `git clone <url>`      (clone repository)
* `git remote add origin <url>`      (add remote repository)
* `git remote -v`      (list remotes)
* `git push -u origin <branch>`      (push branch & set upstream)
* `git pull`      (fetch + merge changes from remote)
* `git fetch`      (download changes without merging)

---

## 5. Merging & Rebasing
* `git merge <branch>`      (merge branch into current branch)
* `git merge --squash <branch>`      (squash commits into one)
* `git rebase <branch>`      (reapply commits on top of another branch)

---

## 6. Stash & Cherry Pick
* `git stash`      (save uncommitted changes)
* `git stash list`      (list stashed changes)
* `git stash pop`      (restore and remove latest stash)
* `git stash apply stash@{n}`      (apply specific stash)
* `git stash push -m "Message"`      (stash with message)
* `git cherry-pick <commit-hash>`      (apply specific commit to current branch)

---

## 7. Reset & Revert (Undoing Changes)
* `git reset --soft <commit>`      (move HEAD back, keep changes staged)
* `git reset --mixed <commit>`      (move HEAD back, unstage changes - default)
* `git reset --hard <commit>`      (move HEAD back, discard changes - destructive)
* `git revert <commit-hash>`      (create new commit that undoes changes)
* `git reflog`      (show all HEAD movements, recover lost commits)
