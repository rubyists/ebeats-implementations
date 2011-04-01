CC=gcc-4.2
CFLAGS=-Wall -g
LDFLAGS=-framework Foundation -lobjc

all: ebeats

ebeats: main.o Ebeat.o
	$(CC) $(LDFLAGS) -o $@ $^

main.o: main.m
	$(CC) $(CFLAGS) -c $<

Ebeat.o: Ebeat.m Ebeat.h
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f ebeats
	rm -f main.o Ebeat.o
