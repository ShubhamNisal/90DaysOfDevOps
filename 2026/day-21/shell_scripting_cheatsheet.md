# 🐚 Shell Scripting Cheat Sheet

A practical quick-reference guide for Bash scripting used in DevOps,
automation, and system administration.

------------------------------------------------------------------------

# Bash Scripting Quick Reference Table


| Topic              | Key Syntax / Example                  | Purpose / Explanation                                      |
|---------------------|---------------------------------------|------------------------------------------------------------|
| Shebang             | `#!/bin/bash`                         | Defines which shell interpreter runs the script            |
| Run Script          | `chmod +x script.sh` / `./script.sh`  | Makes script executable and runs it                        |
| Comment             | `# comment`                           | Adds explanation in code (ignored by shell)                |
| Multi-line Comment  | `: <<'COMMENT' ... COMMENT`           | Workaround for multi-line comments using here-doc          |
| Variable            | `VAR="value"` / `NAME="DevOps"`       | Stores values in script                                    |
| Command Substitution| `date=$(date)`                        | Stores output of a command inside a variable               |
| Print Variable      | `echo $VAR`                           | Displays variable value                                    |
| User Input          | `read VAR`                            | Reads input from user                                      |
| Script Arguments    | `$0 $1 $2 $# $@`                      | Access script name and command-line arguments              |
| Exit Code           | `echo $?`                             | Shows status of previous command                           |
| Exit Script         | `exit 0` / `exit 1`                   | Stop script execution (0=success, non-zero=error)          |
| Safe Script         | `set -euo pipefail`                   | Prevent hidden failures                                    |
| Debug Mode          | `set -x`                              | Show command execution                                     |
| Trap                | `trap cleanup EXIT`                   | Run cleanup on exit                                        |
| If Condition        | `if [ condition ]; then ... fi`       | Conditional execution                                      |
| String Compare      | `[ "$a" = "$b" ]`                     | Compare strings                                            |
| Integer Compare     | `[ $a -gt $b ]`                       | Compare numbers                                            |
| File Check          | `[ -f file ]` / `[ -d dir ]`          | Check file or directory                                    |
| Logical AND         | `cmd1 && cmd2`                        | Run cmd2 if cmd1 succeeds                                  |
| Logical OR          |  `cmd1 || cmd2`                       | Run cmd2 if cmd1 fails                                     |
| Case Statement      | `case ... esac`                       | Multiple condition branching                               |
| For Loop            | `for i in list; do ... done`          | Iterate over items                                         |
| C-style Loop        | `for ((i=0;i<n;i++))`                 | Numeric iteration                                          |
| While Loop          | `while [ condition ]; do ... done`    | Repeat while condition true                                |
| Until Loop          | `until [ condition ]; do ... done`    | Run until condition true                                   |
| Break               | `break`                               | Exit loop early                                            |
| Continue            | `continue`                            | Skip iteration                                             |
| Function            | `name() { ... }`                      | Reusable code block                                        |
| Function Argument   | `$1 $2`                               | Pass values to functions                                   |
| Local Variable      | `local VAR`                           | Limits variable scope                                      |
| Grep                | `grep pattern file`                   | Search text patterns                                       |
| Awk                 | `awk '{print $1}' file`               | Column-based text processing                               |
| Sed                 | `sed 's/foo/bar/g' file`              | Stream editor for text replacement                         |
| Cut                 | `cut -d: -f1 file`                    | Extract columns                                            |
| Sort                | `sort file.txt`                       | Sort lines                                                 |
| Uniq                | `uniq -c file.txt`                    | Remove duplicates                                          |
| tr                  | `tr 'a-z' 'A-Z'`                      | Transform characters                                       |
| wc                  | `wc -l file.txt`                      | Count lines                                                |
| Head                | `head -10 file.txt`                   | Show first lines                                           |
| Tail                | `tail -f app.log`                     | Monitor logs live                                          |
| Find                | `find /path -name "*.log"`            | Search files                                               |
| Cron Jobs           | `0 2 * * * script.sh`                 | Schedule scripts automatically                             |
| Tar & Compression   | `tar -czf backup.tar.gz dir/`         | Create compressed archives for backups                     |

                                                            
  ---------------------------------------------------------------------------------


# 1️⃣ Basics

## Shebang

``` bash
#!/bin/bash
```

**Explanation:**\
Defines which interpreter should run the script. Without it the system
might use a different shell.

------------------------------------------------------------------------

## Running a Script

``` bash
chmod +x script.sh
./script.sh
bash script.sh
```

**Explanation:**

-   `chmod +x` → makes the script executable\
-   `./script.sh` → runs script directly\
-   `bash script.sh` → runs script using bash interpreter

------------------------------------------------------------------------

## Comments

``` bash
# This is a comment
echo "Hello" # inline comment
```
```bash
<<COMMENT
This entire section is considered a
multi-line comment and will be ignored
by the shell interpreter.
COMMENT

<<INFO
this is
also
a multi line
comment
INFO
```

**Explanation:**\
Comments are ignored by the shell and help explain the script logic.

------------------------------------------------------------------------

## Variables

``` bash
NAME="DevOps"
echo $NAME
echo "$NAME"
echo '$NAME'
```

**Explanation:**

-   Variables store values.
-   `$NAME` accesses the variable.
-   `" "` allows variable expansion.
-   `' '` prevents expansion.

------------------------------------------------------------------------

## Reading User Input

``` bash
read USERNAME
echo "Hello $USERNAME"
```

Prompt example:

``` bash
read -p "Enter your name: " NAME
```

**Explanation:**\
`read` takes input from the user and stores it in a variable.

------------------------------------------------------------------------

## Command-line Arguments

| Variable | Meaning                          |
|----------|----------------------------------|
| `$0`     | Script name                      |
| `$1`     | First argument                   |
| `$2`     | Second argument                  |
| `$#`     | Number of arguments              |
| `$@`     | All arguments                    |
| `$?`     | Exit code of previous command    |

Example:

``` bash
echo "Script name: $0"
echo "First argument: $1"
```

**Explanation:**\
These allow scripts to receive parameters dynamically.

------------------------------------------------------------------------

# 2️⃣ Operators and Conditionals

## String Comparisons

``` bash
[ "$a" = "$b" ]
[ "$a" != "$b" ]
[ -z "$a" ]
[ -n "$a" ]
```

**Explanation:**

-   `=` → equal strings\
-   `!=` → not equal\
-   `-z` → string empty\
-   `-n` → string not empty

------------------------------------------------------------------------

## Integer Comparisons

``` bash
[ $a -eq $b ]
[ $a -ne $b ]
[ $a -lt $b ]
[ $a -gt $b ]
[ $a -le $b ]
[ $a -ge $b ]
```

**Explanation:**\
Used to compare numeric values inside conditions.

------------------------------------------------------------------------

## File Test Operators

| Operator | Meaning             |
|----------|---------------------|
| `-f`     | File exists         |
| `-d`     | Directory exists    |
| `-e`     | Path exists         |
| `-r`     | File readable       |
| `-w`     | File writable       |
| `-x`     | File executable     |
| `-s`     | File not empty      |

Example:

``` bash
if [ -f file.txt ]; then
  echo "File exists"
fi
```

**Explanation:**\
Helps scripts verify files before performing operations.

------------------------------------------------------------------------

## If / Elif / Else

``` bash
if [ condition ]; then
  echo "True"
elif [ condition ]; then
  echo "Another condition"
else
  echo "False"
fi
```

**Explanation:**\
Controls decision-making logic inside scripts.

------------------------------------------------------------------------

## Logical Operators

``` bash
[ condition1 ] && echo "True"
[ condition1 ] || echo "False"
[ ! -f file.txt ]
```

**Explanation:**

-   `&&` → AND operator\
-   `||` → OR operator\
-   `!` → NOT operator

------------------------------------------------------------------------

## Case Statement

``` bash
case $variable in
    pattern1)
        # commands
        ;;
    pattern2)
        # commands
        ;;
    *)
        # default case (optional)
        ;;
esac
```
- `case` starts the block, `esac` ends it (reverse spelling).
- Each `pattern)` defines a branch.
- `;;` marks the end of commands for that branch.
- `*` acts as a default (matches anything not covered above).

**Explanation:**\
It works like a `switch` statement in other languages, making scripts cleaner than multiple `if-elif` conditions.

### Example: Menu-driven Script
```bash
#!/bin/bash

echo "Enter a choice: start, stop, restart"
read action

case $action in
    start)
        echo "Starting the service..."
        ;;
    stop)
        echo "Stopping the service..."
        ;;
    restart)
        echo "Restarting the service..."
        ;;
    *)
        echo "Invalid option!"
        ;;
esac
```

------------------------------------------------------------------------

# 3️⃣ Loops

## For Loop

``` bash
for i in 1 2 3
do
echo $i
done
```

**Explanation:**\
Iterates through a list of values.

C-style loop:

``` bash
for ((i=1;i<=5;i++))
do
echo $i
done
```

Used when counting iterations.

------------------------------------------------------------------------

## While Loop

``` bash
count=1
while [ $count -le 5 ]
do
echo $count
((count++))
done
```

**Explanation:**\
Runs repeatedly while the condition remains true.

------------------------------------------------------------------------

## Until Loop

``` bash
count=1
until [ $count -gt 5 ]
do
echo $count
((count++))
done
```

**Explanation:**\
Runs until a condition becomes true.

------------------------------------------------------------------------

## Loop Control

``` bash
break
continue
```

**Explanation:**

-   `break` stops the loop immediately.
-   `continue` skips to the next iteration.

------------------------------------------------------------------------

## Loop Over Files

``` bash
for file in *.log
do
echo $file
done
```

**Explanation:**\
Processes multiple files automatically.

------------------------------------------------------------------------

## Loop Over Command Output

``` bash
cat file.txt | while read line
do
echo $line
done
```

**Explanation:**\
Processes command output line by line.

------------------------------------------------------------------------

# 4️⃣ Functions

## Define Function

``` bash
greet() {
echo "Hello DevOps"
}
```

**Explanation:**\
Functions group reusable logic inside scripts.

------------------------------------------------------------------------

## Call Function

``` bash
greet
```

Runs the function.

------------------------------------------------------------------------

## Passing Arguments

``` bash
greet() {
echo "Hello $1"
}

greet "Shubham"
```

**Explanation:**\
Functions can accept parameters similar to scripts.

------------------------------------------------------------------------

## Local Variables

``` bash
my_function() {
local VAR="value"
}
```

**Explanation:**\
`local` restricts variable scope to the function.

------------------------------------------------------------------------

# 5️⃣ Text Processing Commands

## grep

``` bash
grep -i "error" log.txt
grep -r "error" /var/log
grep -c "error" log.txt
```
### Common `grep` Flags

| Flag | Meaning              |
|------|----------------------|
| `-i` | Ignore case          |
| `-r` | Recursive            |
| `-c` | Count matches        |
| `-n` | Show line numbers    |
| `-v` | Invert match         |
| `-E` | Extended regex       |


**Explanation:**\
Searches for patterns in files or command output.

------------------------------------------------------------------------

## awk

``` bash
awk '{print $1}' file.txt
awk -F: '{print $1}' /etc/passwd
```

**Explanation:**\
Powerful tool for column-based text processing.

------------------------------------------------------------------------

## sed

``` bash
sed 's/old/new/g' file.txt
sed -i 's/foo/bar/g' config.txt
```

**Explanation:**\
Edits and transforms text streams.

------------------------------------------------------------------------

## cut

``` bash
cut -d: -f1 /etc/passwd
```

**Explanation:**\
Extracts specific columns from structured text.

------------------------------------------------------------------------

## sort

``` bash
sort file.txt
sort -n file.txt
sort -r file.txt
```

**Explanation:**\
Sorts lines alphabetically or numerically.

------------------------------------------------------------------------

## uniq

``` bash
uniq file.txt
uniq -c file.txt
```

**Explanation:**\
Removes duplicate lines from sorted input.

------------------------------------------------------------------------

## tr

``` bash
tr 'a-z' 'A-Z'
tr -d '\r'
```

**Explanation:**\
Transforms or deletes characters.

------------------------------------------------------------------------

## wc

``` bash
wc -l file.txt
wc -w file.txt
wc -c file.txt
```

**Explanation:**\
Counts lines, words, or characters.

------------------------------------------------------------------------

## head / tail

``` bash
head -10 file.txt
tail -10 file.txt
tail -f app.log
```

**Explanation:**\
Displays the beginning or end of files. `tail -f` monitors logs in real
time.

------------------------------------------------------------------------

# 6️⃣ Useful One-Liners

Delete files older than 7 days:

``` bash
find /var/log -name "*.log" -mtime +7 -delete
```

Check if service is running:

``` bash
systemctl is-active nginx
```

Monitor disk usage:

``` bash
df -h
```

Replace text in multiple files:

``` bash
sed -i 's/old/new/g' *.conf
```

Monitor logs for errors:

``` bash
tail -f app.log | grep ERROR
```

------------------------------------------------------------------------

# 7️⃣ Error Handling and Debugging

Check exit code:

``` bash
echo $?
```

Exit script:

``` bash
exit 1
```

Stop script on error:

``` bash
set -e
```

Treat unset variables as errors:

``` bash
set -u
```

Detect pipe failures:

``` bash
set -o pipefail
```

Debug execution:

``` bash
set -x
```

Trap example:

``` bash
cleanup() {
echo "Cleaning resources"
}
trap cleanup EXIT
```

**Explanation:**\
These options make scripts safer and easier to debug.

------------------------------------------------------------------------

# 🎯 Key Takeaways

1.  Bash enables automation of repetitive DevOps tasks.
2.  Linux text processing tools are extremely powerful when combined.
3.  Writing modular scripts with functions and error handling makes
    automation reliable.
