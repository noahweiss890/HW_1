CC = gcc
FLAGS = -Wall -g
AR = ar
OBJECTS_MAIN = main.o
OBJECTS_LOOP = basicClassification.o advancedClassificationLoop.o
OBJECTS_REC = basicClassification.o advancedClassificationRecursion.o

all: loops recursives recursived loopd mains maindloop maindrec

loops: libclassloops.a

recursives: libclassrec.a

recursived: libclassrec.so

loopd: libclassloops.so

mains: $(OBJECTS_MAIN) libclassrec.a
	$(CC) $(FLAGS) -o mains $(OBJECTS_MAIN) libclassrec.a

maindloop: $(OBJECTS_MAIN)
	$(CC) $(FLAGS) -o maindloop $(OBJECTS_MAIN) ./libclassloops.so

maindrec: $(OBJECTS_MAIN)
	$(CC) $(FLAGS) -o maindrec $(OBJECTS_MAIN) ./libclassrec.so

libclassloops.a: $(OBJECTS_LOOP)
	$(AR) -rcs libclassloops.a $(OBJECTS_LOOP)

libclassrec.a: $(OBJECTS_REC)
	$(AR) -rcs libclassrec.a $(OBJECTS_REC)

libclassrec.so: $(OBJECTS_REC)
	$(CC) -shared -o libclassrec.so $(OBJECTS_REC)

libclassloops.so: $(OBJECTS_LOOP)
	$(CC) -shared -o libclassloops.so $(OBJECTS_LOOP)

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c

.PHONY: clean all loops recursives recursived loopd

clean:
	rm -f mains maindloop maindrec *.a *.so *.o
