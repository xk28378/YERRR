CONTENTS OF THIS FILE
---------------------

 * Introduction
 * Execution
 * Restrictions
 
 
INTRODUCTION

---------------------

The program of is a student records manager using a linked list. A file student records file is taken in at the begining 
of the program to populate the linked list. The user can then add, update, read, search, and delete students through user
commands. When the user decides they are done making changes they can quit the program where their changes are saved to 
an output file with all the sudent records from the linked list saved in it.


EXECUTION

---------------------

Compiling:
    The program comes with a given make file which can be used to compile and run the program. To compile the program, use 
    the command "make" on the command line in the directory of which the program file and the make file are located.

Running:
    The make file has some given commands that use a specific input file called "input.txt". To run the program using this 
    file as the input file for the program use the command "make run". To run a valgrind check with the default file just 
    use the command "make run1". To run the program with the GDB Debugger with the default file use the command "make run2".
    To use a new input file the user must the command "./proj1 <newfilename>".

Program manual:
    The program starts out by taking in the records from the given input file. The user is then prompted to enter a command.
    These are the list of commands the user can use in the program:

        -Add/add <name> <id> <dept> <sub1> <sub2> <sub3> 
            *use to add a new student into the records

        -Update/update <id> <col_name> <new_value>
            *use to update a student record using their id(id value can not be updated)

        -Read/read <id> <col_name>; return <value>. 
            *use to print out a specific column of a student record using their id

        -Search/search <id>
            *use to print an entire student record using their id

        -Delete/delete <id>
            *use to delete a student record 

        -Print/print
            *use to print all student entries in the linked list

        -QUIT
            *use to exit program and save all student records into output file called "StudentData.txt"

    Each student record has specific field that are filled:
        -Name
        -ID
        -Department
        -Subject1
        -Subject2
        -Subject3
        -Score(this field can not be added or updated as it is the average of the three subjects but can be read)

  
RESTRICTIONS

---------------------

-Id has to be a numeric value
-First and last name required
-Subject scores have to be numeric values
-Department name has to be a single word(no spaces)
-Ids must be unique

