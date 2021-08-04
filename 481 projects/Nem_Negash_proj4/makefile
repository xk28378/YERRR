CXX = g++
CXXGDB = -g

proj4: Graph.h Graph.cpp main.cpp
	$(CXX) $(CXXGDB) Graph.h Graph.cpp main.cpp -o proj4
run:
	./proj4

run1: 
	valgrind --leak-check=full ./proj4

run2:
	gdb ./proj4