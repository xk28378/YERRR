CXX = g++
CXXFLAGS = -Wall
CXXGDB = -g

proj1: EntryList.h EntryList.cpp driver.cpp
	$(CXX) $(CXXFLAGS) $(CXXGDB) EntryList.h EntryList.cpp driver.cpp -o proj1

run:
	./proj1 input.txt

run1: 
	valgrind --leak-check=full ./proj1 input.txt

run2:
	gdb ./proj1 input.txt