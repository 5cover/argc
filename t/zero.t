#!/usr/bin/env perl

# Standard C **doesn’t allow** `argc == 0`. But on POSIX systems, it’s *permitted* behavior.
# 
# So this test is technically:
# - Not portable
# - Not required to succeed

use strict;
use warnings;
use Test::More tests => 1;

# Load the POSIX syscall number for execve (59 on Linux x86_64)
use constant SYS_execve => 59;

my $path = "./argc";

# execve(path, argv = NULL, envp = NULL)
# In Perl, that's syscall(SYS_execve, $path, 0, 0)

# Fork to run separately
my $pid = fork();
if ($pid == 0) {
    # In child — replace process image with a truly arg-less one
    syscall(SYS_execve, $path, 0, 0);
    exit 1; # If exec fails, exit child
}

# In parent — read from child via pipe
waitpid($pid, 0);
my $status = $? >> 8;

ok($status == 0, 'argc with zero arguments');
