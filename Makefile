PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin
MANDIR := $(PREFIX)/share/man/man1

CC := cc
CFLAGS := -O2 -Wall

all: argc

argc: argc.c
	$(CC) $(CFLAGS) -o $@ $<

install: argc argc.1
	install -Dm755 argc $(BINDIR)/argc
	install -Dm644 argc.1 $(MANDIR)/argc.1
	@echo "argc: installed to $(BINDIR), manpage to $(MANDIR)"

uninstall:
	rm -f $(BINDIR)/argc
	rm -f $(MANDIR)/argc.1
	@echo "argc: ninstalled"

clean:
	rm -f argc

.PHONY: all install uninstall clean
