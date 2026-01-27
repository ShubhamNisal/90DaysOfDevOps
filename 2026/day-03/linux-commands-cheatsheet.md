# Day03 - 90DaysOfDevOps

### Process Management

- **ps aux** - Display all running processes on your system

- **ps -ef | grep "PATTERN"** - Display all the running processes matching with "PATTERN"

- **kill <process_id>** - terminate/kill the process by process id, you can kill multiple processes using multiple P_id's in the same command

- **kill -9 <process_id>** - force kill a process by its process id, you can kill multiple processes using multiple P_id's in the same command

- **top** - get the list of all the running processes on your Linux machine

- **htop** - An enhanced, interactive version of top with a more user-friendly interface and color-coded bars.(requires installation)

- **nohup script.sh &** - run a program in background & keep it running even after you close the shell session



### File system

- **ls** - lists the contents of a directory

- **mkdir <directory_name>** - creates a directory

- **cp <file> <destination>** - copy a file to a destination 

- **mv** - Rename or move files or directories

- **rm <filename>** - remove a file

- **rm -r <directory>** - remove a directory

- **chmod** - modify file or directory permissions

- **chown** - change ownership of a file or directory

- **cat file_name** - displays the content of a file

- **head -n 10 file.txt** - shows the first 10 lines of a file

- **tail -n 50 file.txt** - shows the last 50 lines of a file


### Networking troubleshooting

- **ping google.com** - test reachability and measure latency to a host

- **curl -I https://example.com** - fetch data from a URL, useful for testing APIs or websites

- **traceroute <host>** - show the path packets take to reach a destination

- **lsof -i :80** - find which process is listening on a specific port (e.g., port 80)

- **ifconfig** - configure or view network interfaces

- **dig <domain>** - query DNS records for a domain

- **ip addr show** - display IP addresses assigned to interfaces
