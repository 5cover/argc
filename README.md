# argc

argc - print the number of arguments passed. That's it. ~~Seriously, why doesn't this already exist?~~

## Installation

To build and install `argc` manually:

### 🛠 Prerequisites

You'll need:

- A C compiler (e.g. `gcc`, `clang`)
- `make`
- Basic POSIX tools (`install`, `rm`, etc.)

### 📦 Build and install

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

## Synopsis

`argc ARGUMENT...`

## Description

Print the number of arguments passed to the program in base 10, followed by a newline.

The traditional `--help` and `--version` arguments aren't supported, in order to ensure seamless argument counting.

## Author

Written by Scover.

## Reporting bugs

Github Repository: <https://github.com/5cover/argc>

## Copyright

This is free and unencumbered software released into the public domain.

## Contributing

No need.
