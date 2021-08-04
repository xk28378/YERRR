CXX = g++
CXXGDB = -g

proj2: Graph.h Graph.cpp driver.cpp
	$(CXX) $(CXXGDB) Graph.h Graph.cpp driver.cpp -o proj2

run:
	./proj2

run1: 
	valgrind --leak-check=full ./proj2

run2:
	gdb ./proj2