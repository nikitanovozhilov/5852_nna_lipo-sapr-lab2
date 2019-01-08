# Compiler
CC=g++
# Flags to compile an object file from source file
CFLAGS=-c
# Flags to compile an executed file from object file
OFLAG=-o
# CppUnit library flags
CPPUNIT_FLAGS=-I$CPPUNIT_HOME/include -L$CPPUNIT_HOME/lib -lcppunit
# PCRE library flag
PCRE_FLAG=-lpcrecpp
# Object files folder
OBJ=obj
# Test files folder
TEST=test
# Source files folder
SRC=src
# Output executed file name
OFILE=MacrosFinder
# Test output file
TEST_OFILE=MacrosFinderTests
# Test file
TEST_FILE=test1
# Temporary files folder
TEMP=temp

all: $(OFILE)

test: $(TEST_OFILE)

$(OFILE): $(OBJ)/main.o $(OBJ)/MacrosFinder.o 
	$(CC) $(OBJ)/main.o $(OBJ)/MacrosFinder.o $(PCRE_FLAG) $(CPPUNIT_FLAGS) $(CPPFLAGS) $(OFLAG) $(OFILE)
	
$(TEST_OFILE): $(OBJ)/MacrosFinder.o $(OBJ)/tests.o
	$(CC) $(OBJ)/MacrosFinder.o $(OBJ)/tests.o $(PCRE_FLAG) $(CPPUNIT_FLAGS) $(CPPFLAGS) $(OFLAG) $(TEST_OFILE)
	
$(OBJ)/main.o: $(SRC)/main.cpp
	$(CC) $(CFLAGS) $(SRC)/main.cpp $(CPPFLAGS) $(OFLAG) $(OBJ)/main.o
	
$(OBJ)/MacrosFinder.o: $(SRC)/MacrosFinder.cpp
	$(CC) $(CFLAGS) $(SRC)/MacrosFinder.cpp $(CPPFLAGS) $(OFLAG) $(OBJ)/MacrosFinder.o
	
$(OBJ)/tests.o: $(TEST)/main.cpp
	$(CC) $(CFLAGS) $(TEST)/main.cpp $(CPPFLAGS) $(OFLAG) $(OBJ)/tests.o
	
compare: $(OFILE)
	./main.sh < $(TEST)/$(TEST_FILE) > $(TEMP)/scriptout
	./$(OFILE) < $(TEST)/$(TEST_FILE) | sort > $(TEMP)/cppout
	diff $(TEMP)/cppout $(TEMP)/scriptout

clean:
	rm -rf $(OFILE) $(TEST_OFILE) $(OBJ)/* $(TEMP)/*