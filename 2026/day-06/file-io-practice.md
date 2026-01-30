# Day 06 – Linux Fundamentals: Read and Write Text Files

## File Creation

``` touch notes.txt ```
#### What it does:
- Creates an empty file named notes.txt

## Writing to a File

``` echo "Line 1" > notes.txt ```

#### What it does:
- Writes the first line to the file
- Overwrites existing content (if any)

## Appending to a File

```` echo "Line 2: appended using >>" >> notes.txt ````

#### What it does:
- Appends a new line without overwriting existing data

## Writing & Displaying Using tee

````echo "Line 3: Printing & appending to file" | tee -a notes.txt````

#### What it does:

- Displays the line on terminal
- Appends it to the file at the same time
- -a appends the file, tee without -a overwrites the file

## Reading the File

````cat notes.txt````

#### What it does:
- Displays the full contents of the file

## Reading Partial Content

````head -n 2 notes.txt````
````tail -n 2 notes.txt````

#### What it does

- head shows the first 2 lines
- tail shows the last 2 lines

## Key Learnings

- ">" overwrites files, ">>" appends safely

- tee is useful for logging and debugging

- File handling is foundational for logs, configs, and scripts

## Screenshots of Practice

![practice](images/6.png)
