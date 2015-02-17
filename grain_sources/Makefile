CC=gcc
CFLAGS=-Wall -O3

MAIN_OBJS=ecrypt-sync.o grain128.o main.o
BIGTEST_OBJS=ecrypt-sync.o grain128.o bigtest_2.o

MAIN=main
BIGTEST=bigtest_2

all: $(MAIN) $(BIGTEST)

.c.o:
	$(CC) $(CFLAGS) -c $^ -o $@

$(MAIN): $(MAIN_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(BIGTEST): $(BIGTEST_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f *.o $(MAIN) $(BIGTEST)
