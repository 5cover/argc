PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin
MANDIR := $(PREFIX)/share/man/man1

CC := cc
CFLAGS := -O2 -Wall

BINARY := argc
SOURCE := argc.c
SOURCE_ASM := argc.asm

.PHONY: all hash clean install uninstall

all: $(BINARY)

hash: $(BINARY)
	sha256sum $(BINARY) > $(BINARY).sha256

$(BINARY): $(SOURCE)
	$(CC) $(CFLAGS) -o $@ $<

argcasm: $(SOURCE_ASM)
	nasm -f elf64 $< -o argc.o
	gcc -no-pie argc.o -o $@

clean:
	rm -f argc argc.o

install: $(BINARY) $(BINARY).1
	install -Dm755 argc $(BINDIR)/$(BINARY)
	install -Dm644 argc.1 $(MANDIR)/$(BINARY).1
	@echo "$(BINARY): installed to $(BINDIR), manpage to $(MANDIR)"

uninstall:
	rm -f $(BINDIR)/$(BINARY)
	rm -f $(MANDIR)/$(BINARY).1
	@echo "$(BINARY): uninstalled"

