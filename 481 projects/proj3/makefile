CXX = g++
CXXGDB = -g

proj3: main.cpp
	$(CXX) $(CXXGDB) main.cpp -o proj3
run:
	./proj3

run1: 
	valgrind --leak-check=full ./proj3

run2:
	gdb ./proj3