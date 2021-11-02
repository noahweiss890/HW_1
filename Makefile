
CC = gcc
FLAGS = -Wall -g
AR = ar

all: progmaind progmains

prog: main.o basicClassification.o
	$(CC) $(FLAGS) -o prog main.o basicClassification.o

progmaind: main.o libmylib.so
	$(CC) $(FLAGS) -o progmaind main.o ./libmylib.so 

progmains: main.o libmylib.a
	$(CC) $(FLAGS) -o progmains main.o libmylib.a

libmylib.a: mylib.o # how to make static library
	$(AR) -rcs libmylib.a mylib.o

libmylib.so: mylib.o # how to make shared library
	$(CC) -shared -o libmylib.so mylib.o

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c

.PHONY: clean all

clean:
	rm -f prog *.o
#	 rm -f progmains progmaind *.a *.so *.o