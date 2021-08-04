CXX = g++
CXXGDB = -g

hammingcode: hammingcode.cpp
	$(CXX) $(CXXGDB) hammingcode.cpp -o hammingcode
run:
	./hammingcode

run1: 
	valgrind --leak-check=full ./hammingcode

run2:
	gdb ./hammingcode