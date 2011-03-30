CC=gcc
CFLAGS=-std=c99 -D_POSIX_C_SOURCE=200809L -O2 -Wall

all: ebeats

ebeats: ebeats.o
	$(CC) -o $@ $<

ebeats.o: ebeats.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f ebeats
	rm -f ebeats.o
