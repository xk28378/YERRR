CONTENTS OF THIS FILE
---------------------

 * Introduction
 * Execution
 * Restrictions
 
 
INTRODUCTION

---------------------

This program takes a source node, a list of nodes, and a list of edges from the user and creates a graph. Form there the 
program applies Dijkstra’s algorithm on the graph and outputs the shortest path from teh source node to each node and 
the forwarding table.


EXECUTION

---------------------

Compiling:
    The program comes with a given make file which can be used to compile and run the program. To compile the program, use 
    the command "make" on the command line in the directory of which the program file and the make file are located.

Running:
    The make file has some given commands that can be used to the run the program. Use the 'make run' command to run the 
    programs normally in termial. To run a valgrind check just use the command "make run1". To run the program with the 
    GDB Debugger use the command "make run2".

RESTRICTIONS

---------------------

Restrictions for source node:
    -Integer values only
    -NO SPACES
Restrictions for list of nodes:
    -Input format: {0,1,2,3}
    -Node names must be integer values only
    -Source node MUST be listed again
    -No repeating Nodes
    -NO SPACES 
Restrictions for list of edges:
    -Input format: {(node,node,cost),(node,node,cost)}
    -No repeating Edges
    -NO SPACES