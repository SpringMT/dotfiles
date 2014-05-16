#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

my @methods = qw/new/;

for my $method (@methods) {
    can_ok('', $method);
}

done_testing;
