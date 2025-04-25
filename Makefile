# Simple Makefile for the project

CC = gcc
TARGET = my_app

# Check if RELEASE is set to true, otherwise use default flags
ifeq ($(RELEASE), true)
    CFLAGS = -O2 -DRELEASE_BUILD
else
    CFLAGS = -g
endif

.PHONY: all clean

all: $(TARGET)

$(TARGET): main.o
	$(CC) $(CFLAGS) main.o -o $(TARGET)

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

clean:
	rm -f $(TARGET) *.o
