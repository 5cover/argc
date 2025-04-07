#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 4;

# Path to the compiled binary
my $argc = './argc';

# Check it runs at all
ok(-x $argc, 'argc binary is executable');

# Test with no arguments (should still return 1, for the program itself)
my $out0 = `$argc`;
is($out0, "1\n", 'argc with 0 extra arguments prints 1');

# Test with three arguments
my $out3 = `$argc foo bar baz`;
is($out3, "4\n", 'argc with 3 arguments prints 4');

# Test with a very large number of arguments
my @args = map { "arg$_" } 1..100;
my $out100 = `$argc @args`;
is($out100, "101\n", 'argc with 100 arguments prints 101');
