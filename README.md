# argc

argc - print the number of arguments passed. That's it. ~~Seriously, why doesn't this already exist?~~

## Synopsis

`argc ARGUMENT...`

## Description

Prints the number of command-line arguments passed to the program in base 10, followed by a newline.

The traditional `--help` and `--version` arguments aren't supported, in order to ensure seamless argument counting.

## To ignore the program name

By definition, `argc` includes the program name as the first argument (`argv[0]`).

If you prefer to count only the user-supplied arguments (excluding the program itself), you can easily adjust:

Using Bash arithmetic:

```sh
echo $(($(argc "$@") - 1))
```

Or with `bc`:

```sh
bc <<< "$(argc "$@")-1"
```

## Installation

To build and install `argc` manually:

### Prerequisites

You'll need:

- A C compiler (e.g. `gcc`, `clang`)
- `make`
- Basic POSIX tools (`install`, `rm`, etc.)

### Build and install

Clone the repository, then run:

```sh
make
sudo make install
```

This will:

- Compile the `argc` binary with optimization flags
- Install it to `/usr/local/bin/argc`
- Install the manpage to `/usr/local/share/man/man1/argc.1`

To remove it later:

```sh
sudo make uninstall
```

To clean up build artifacts:

```sh
make clean
```

## Running Tests

Before running the tests, make sure the `argc` binary exists by compiling it:

```sh
make
```

Then, run the tests with:

```sh
prove -v t/argc.t
prove -v t/zero.t
```

Or run them all at once:

```sh
prove -v t/
```

### Test scripts

#### `t/argc.t`

This is the main test suite. It checks:

- That `argc` is executable
- That it returns the correct number of arguments for:
  - No extra args
  - A few args
  - A lot of args (up to 100)

This test uses normal shell-style execution and reflects how `argc` behaves in the real world.

#### `t/zero.t`

This one’s&hellip; special.

It uses **low-level syscall magic** to launch `argc` with **literally zero arguments**&mdash;not even `argv[0]`. This is only possible by bypassing the shell and calling the `execve()` system call directly.

It's separated from the main suite because:

- It’s a rare, weird edge case
- Behavior is not guaranteed or portable
- It tells us something about how `argc` (and your OS) handles broken expectations

### Cleaning Up

After running tests, you can clean up the compiled binary like so:

```sh
make clean
```

These tests aren’t here because they’re strictly necessary.  
They’re here because **you deserve to know your 3-line program works with 100 arguments and 0 expectations.**

## Copyright

This is free and unencumbered software released into the public domain.

## Philosophy

- Even the smallest tool deserves to be well-made.  
- Even the most basic function can be shared with pride.  
- Even three lines of C can teach someone *how real software is built*.

## Contributing

No need.
