CC=gcc
CFLAGS=-Wall -O3
SOURCES=./grain_sources

MAIN_OBJS=grain.o main.o
BIGTEST_OBJS=grain.o bigtest.o
TEST_VECTORS_OBJS=grain.o testvectors.o

MAIN_DEVELOPER_OBJS=$(patsubst %, $(SOURCES)/%, ecrypt-sync.o grain128.o main.o)
BIGTEST_DEVELOPER_OBJS=$(patsubst %, $(SOURCES)/%, ecrypt-sync.o grain128.o bigtest_2.o)

MAIN=main
BIGTEST=bigtest
TEST_VECTORS=testvectors

MAIN_DEVELOPER=$(SOURCES)/main
BIGTEST_DEVELOPER=$(SOURCES)/bigtest_2

all: $(MAIN) $(BIGTEST) $(MAIN_DEVELOPER) $(BIGTEST_DEVELOPER)

.c.o:
	$(CC) $(CFLAGS) -c $^ -o $@

$(MAIN): $(MAIN_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(BIGTEST): $(BIGTEST_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(TEST_VECTORS): $(TEST_VECTORS_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(MAIN_DEVELOPER): $(MAIN_DEVELOPER_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(BIGTEST_DEVELOPER): $(BIGTEST_DEVELOPER_OBJS)
	$(CC) $(CFLAGS) -o $@ $^
clean:
	rm -f *.o $(SOURCES)/*.o
	rm -f $(MAIN) $(BIGTEST) $(TEST_VECTORS) $(MAIN_DEVELOPER) $(BIGTEST_DEVELOPER)

.PHONY: test
test:
	bash test_grain.sh
