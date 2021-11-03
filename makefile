
CC = gcc
FLAGS = -Wall -g
AR = ar

all: mains maindloop maindrec

mains: main.o libclassrec.a
	$(CC) $(FLAGS) -o mains main.o libclassrec.a

maindloop: main.o libclassloops.so
	$(CC) $(FLAGS) -o maindloop main.o ./libclassloops.so

maindrec: main.o libclassrec.so
	$(CC) $(FLAGS) -o maindrec main.o ./libclassrec.so

# prog: main.o basicClassification.o advancedClassificationLoop.o
# 	$(CC) $(FLAGS) -o prog main.o basicClassification.o advancedClassificationLoop.o

# progmaind: main.o libmylib.so # how to make program that uses a shared library
# 	$(CC) $(FLAGS) -o progmaind main.o ./libmylib.so 

# progmains: main.o libmylib.a # how to make program that uses a static library
# 	$(CC) $(FLAGS) -o progmains main.o libmylib.a

loops: libclassloops.a

recursives: libclassrec.a

recursived: ibclassrec.so

loopd: libclassloops.so

# libmylib.a: mylib.o # how to make static library
# 	$(AR) -rcs libmylib.a mylib.o

# libmylib.so: mylib.o # how to make shared library
# 	$(CC) -shared -o libmylib.so mylib.o

libclassloops.a: basicClassification.o advancedClassificationLoop.o
	$(AR) -rcs libclassloops.a basicClassification.o advancedClassificationLoop.o

libclassrec.a: basicClassification.o advancedClassificationRecursion.o
	$(AR) -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o

libclassrec.so: basicClassification.o advancedClassificationRecursion.o
	$(CC) -shared -o libclassrec.so basicClassification.o advancedClassificationRecursion.o

libclassloops.so: basicClassification.o advancedClassificationLoop.o
	$(CC) -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c

.PHONY: clean all loops recursives recursived loopd mains maindloop maindrec

clean:
	rm -f  mains maindloop maindrec *.a *.so *.o
