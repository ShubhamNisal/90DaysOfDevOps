# Day 17 – Shell Scripting: Loops, Arguments & Error Handling

## Task
Level up your scripting — use loops, handle arguments, and deal with errors.

You will:
- Write **for** and **while** loops
- Use **command-line arguments** (`$1`, `$2`, `$#`, `$@`)
- Install packages via script
- Add basic **error handling**

---

## Challenge Tasks

### Task 1: For Loop
1. Create `for_loop.sh` that:
   - Loops through a list of 5 fruits and prints each one   
![practice](images/1.png)   
![practice](images/2.png)    

2. Create `count.sh` that:
   - Prints numbers 1 to 10 using a for loop   
![practice](images/3.png)     
![practice](images/4.png)    

---

### Task 2: While Loop
1. Create `countdown.sh` that:
   - Takes a number from the user
   - Counts down to 0 using a while loop
   - Prints "Done!" at the end   
![practice](images/5.png)      
![practice](images/6.png)     

---

### Task 3: Command-Line Arguments
1. Create `greet.sh` that:
   - Accepts a name as `$1`
   - Prints `Hello, <name>!`
   - If no argument is passed, prints "Usage: ./greet.sh <name>"   
![practice](images/7.png)   
![practice](images/8.png)   

2. Create `args_demo.sh` that:
   - Prints total number of arguments (`$#`)
   - Prints all arguments (`$@`)
   - Prints the script name (`$0`)   
![practice](images/9.png)   
![practice](images/10.png)   
---

### Task 4: Install Packages via Script
1. Create `install_packages.sh` that:
   - Defines a list of packages: `nginx`, `curl`, `wget`
   - Loops through the list
   - Checks if each package is installed (use `dpkg -s` or `rpm -q`)
   - Installs it if missing, skips if already present
   - Prints status for each package

> Run as root: `sudo -i` or `sudo su`   
![practice](images/11.png)   
![practice](images/12.png)   
---

### Task 5: Error Handling
1. Create `safe_script.sh` that:
   - Uses `set -e` at the top (exit on error)
   - Tries to create a directory `/tmp/devops-test`
   - Tries to navigate into it
   - Creates a file inside
   - Uses `||` operator to print an error if any step fails    

Example:
```bash
mkdir /tmp/devops-test || echo "Directory already exists"   
```
![practice](images/13.png)   
![practice](images/14.png)   

2. Modify your `install_packages.sh` to check if the script is being run as root — exit with a message if not.   
![practice](images/15.png)   
![practice](images/16.png)   

---

## Hints
- For loop: `for item in list; do ... done`
- While loop: `while [ condition ]; do ... done`
- Arguments: `$1` first arg, `$#` count, `$@` all args
- Check root: `if [ "$EUID" -ne 0 ]; then echo "Run as root"; exit 1; fi`
- Check package: `dpkg -s <pkg> &> /dev/null && echo "installed"`

---
