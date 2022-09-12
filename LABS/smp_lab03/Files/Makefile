
# Define C compilation flags
CFLAGS=-c -g -Wall -ansi -pedantic
# -g -> include debug symbols (for GDB use)
# -Wall -> show all warnings
# -ansi -> turns off certain features of GCC that are incompatible with ANSI C
# -pedantic -> issue all the warnings demanded by strict ANSI C and ISO C++; reject all programs that use forbidden extensions.


# by default this rule is called (effectively building two programs)
all:	vector_test transforma


# Build "test" program
vector_test:	test.o vector.o
	gcc test.o vector.o -o vector_test

# Build "transforma" program
transforma:	transforma.o vector.o
	gcc transforma.o vector.o -o transforma


# Compile only test.c -> generating test.o
test.o:	test.c vector.h
	gcc $(CFLAGS) test.c -o test.o

# Compile only transforma.c -> generating transforma.o
transforma.o:	transforma.c vector.h
	gcc $(CFLAGS) transforma.c -o transforma.o

# Compile only vector.c -> generating vector.o
vector.o:	vector.c vector.h
	gcc $(CFLAGS) vector.c -o vector.o


# delete all object files and executables
clean: 
	rm *.o vector_test transforma
