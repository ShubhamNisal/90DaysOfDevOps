# Day 28 – Revision Day: Everything from Day 1 to Day 27

## Task

You've covered a lot of ground in 27 days — DevOps fundamentals, Linux deep dives, Shell scripting, Python basics, Git & GitHub, and even your developer branding. Today, **stop and revise**. No new concepts. Just solidify what you've learned.

The goal is to identify gaps, revisit topics you struggled with, and make sure you can confidently explain and use everything covered so far.

---

## Covered So Far

| Days | Topic | Key Concepts |
|------|-------|-------------|
| 1 | DevOps & Cloud Intro | What is DevOps, SDLC, Cloud basics |
| 2–7 | Linux Fundamentals | Architecture, commands, processes, systemd, file system hierarchy, troubleshooting, text files |
| 8 | Cloud Server Setup | Docker, Nginx, web deployment |
| 9–11 | Users, Permissions & Ownership | User/group management, file permissions, chown/chgrp |
| 12 | Revision Day 1 | Days 1–11 recap |
| 13 | Volume Management | LVM — physical volumes, volume groups, logical volumes |
| 14–15 | Networking | Fundamentals, DNS, IP, subnets, ports, hands-on checks |
| 16–18 | Shell Scripting | Basics, loops, arguments, error handling, functions |
| 19–20 | Shell Scripting Projects | Log rotation, backup, crontab, log analyzer |
| 21 | Shell Scripting Cheat Sheet | Personal reference guide |
| 22–25 | Git & GitHub | Init, branching, merge, rebase, stash, cherry pick, reset, revert, branching strategies |
| 26 | GitHub CLI | Managing GitHub from the terminal |
| 27 | GitHub Profile | Profile README, repo organization, developer branding |

---

## Challenge Tasks

### Task 1: Self-Assessment Checklist
Go through the checklist below. For each item, mark yourself honestly:
- **Can do confidently**
- **Need to revisit**
- **Haven't done yet**

#### Linux
- [ ] Navigate the file system, create/move/delete files and directories
  - **Can do confidently**
- [ ] Manage processes — list, kill, background/foreground
  - **Can do confidently**  
- [ ] Work with systemd — start, stop, enable, check status of services
  - **Can do confidently**
- [ ] Read and edit text files using vi/vim or nano
  - **Can do confidently**
- [ ] Troubleshoot CPU, memory, and disk issues using top, free, df, du
  - **Can do confidently**
- [ ] Explain the Linux file system hierarchy (/, /etc, /var, /home, /tmp, etc.)
  - **Can do confidently**
- [ ] Create users and groups, manage passwords
  - **Can do confidently**
- [ ] Set file permissions using chmod (numeric and symbolic)
  - **Can do confidently**
- [ ] Change file ownership with chown and chgrp
  - **Can do confidently**
- [ ] Create and manage LVM volumes
  - **Need to revisit**
- [ ] Check network connectivity — ping, curl, netstat, ss, dig, nslookup
  - **Need to revisit**
- [ ] Explain DNS resolution, IP addressing, subnets, and common ports
  - **Need to revisit**

#### Shell Scripting
- [ ] Write a script with variables, arguments, and user input
  - **Can do confidently**
- [ ] Use if/elif/else and case statements
  - **Can do confidently**
- [ ] Write for, while, and until loops
  - **Can do confidently**
- [ ] Define and call functions with arguments and return values
  - **Can do confidently**
- [ ] Use grep, awk, sed, sort, uniq for text processing
  - **Need to revisit**
- [ ] Handle errors with set -e, set -u, set -o pipefail, trap
  - **Can do confidently**
- [ ] Schedule scripts with crontab
  - **Can do confidently**

#### Git & GitHub
- [ ] Initialize a repo, stage, commit, and view history
  - **Can do confidently**
- [ ] Create and switch branches
  - **Can do confidently**
- [ ] Push to and pull from GitHub
  - **Can do confidently**
- [ ] Explain clone vs fork
  - **Can do confidently**
- [ ] Merge branches — understand fast-forward vs merge commit
  - **Need to revisit**
- [ ] Rebase a branch and explain when to use it vs merge
  - **Can do confidently**
- [ ] Use git stash and git stash pop
  - **Can do confidently**
- [ ] Cherry-pick a commit from another branch
  - **Can do confidently**
- [ ] Explain squash merge vs regular merge
  - **Can do confidently**
- [ ] Use git reset (soft, mixed, hard) and git revert
  - **Can do confidently**
- [ ] Explain GitFlow, GitHub Flow, and Trunk-Based Development
  - **Need to revisit**
- [ ] Use GitHub CLI to create repos, PRs, and issues
  - **Can do confidently**

---

### Task 2: Revisit Your Weak Spots
1. Pick **3 topics** from the checklist where you marked "Need to revisit"
2. Go back to that day's challenge and redo the hands-on tasks
3. Document what you re-learned in `day-28-notes.md`
```
Topic 1: Networking Basics
Revisited DNS resolution and common networking tools.  
Understood how commands like ping, curl, and ss help in diagnosing connectivity and service issues.

Topic 2: Topic 2: Text Processing (grep, awk, sed)
Revisited grep, awk, and sed for searching, filtering, and modifying text.  
These tools are essential for log analysis and automation tasks in DevOps.

Topic 3: Git Merge, Fastforward & Workflows
Revisited different merge strategies and branching workflows.  
Understood when to use fast-forward vs merge commits and how workflows impact team collaboration.
```

---

### Task 3: Quick-Fire Questions
Answer these from memory (no Googling). Then verify your answers:

1. What does `chmod 755 script.sh` do?
```
  Gives below access -
  Owner : read, write, execute (7)
  Group : read, execute (5)
  Others : read, execute (5)
```  
2. What is the difference between a process and a service?
```
Process: Running instance of a program
Service: Background process managed by system
```
3. How do you find which process is using port 8080?
```
lsof -i :8080
or
ss -lntp | grep 8080
```
4. What does `set -euo pipefail` do in a shell script?
```
Makes the script safe for execution
-e : exit on error
-u : error on undefined variables
-o pipefail : fail if any command in pipeline fails
```
5. What is the difference between `git reset --hard` and `git revert`?
```
git reset --hard permanently deletes the commit history
git revert adds an additional commit with the channges reverted to the mentioned commit, it does not delete the commit history
```
6. What branching strategy would you recommend for a team of 5 developers shipping weekly?
```
Trunk based or Github flow
- small team, frequent changes, short-lived branches
```
7. What does `git stash` do and when would you use it?
```
Temporarily saves uncommitted changes without committing.

Used when:
Switching branches quickly
Work not ready to commit
```
8. How do you schedule a script to run every day at 3 AM?
```
crontab -e
0 3 * * * /path/script.sh
```
9. What is the difference between `git fetch` and `git pull`?
```
fetch → download changes only
pull → fetch + merge
```
10. What is LVM and why would you use it instead of regular partitions?
```
Logical Volume Manager

Allows:
Resize disks dynamically
Combine multiple disks
Better storage flexibility
```

---

### Task 4: Organize Your Work
1. Make sure all your daily submissions (day-1 through day-27) are committed and pushed
  - Checked✅
2. Check that your `git-commands.md` is up to date
  - Checked✅
3. Check that your shell scripting cheat sheet is complete
  - Checked✅
4. Verify your GitHub profile and repos are clean (from Day 27)
  - Checked✅

---

### Task 5: Teach It Back
Pick **one topic** you've learned and write a short explanation (5-10 lines) as if you're teaching it to someone who has never heard of it. Add it to your `day-28-notes.md`.
Teaching is the best test of understanding.

```
Git Branching Strategy

A Git branching strategy defines how a team organizes and manages branches while developing and releasing code.
Instead of everyone working on the same branch, developers create separate branches for features, bug fixes, or releases. This helps avoid conflicts and keeps the main code stable.
For small teams or fast-moving projects, GitHub Flow or Trunk-Based Development is commonly used. Developers create short-lived branches, raise pull requests, and merge changes frequently into the main branch.
For larger or more structured projects, GitFlow can be used, which includes dedicated branches like develop, feature, release, and hotfix.
The goal of any branching strategy is to enable smooth collaboration, maintain code quality, and support reliable and frequent releases.
```

---
