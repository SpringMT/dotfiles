#!/usr/bin/perl

use strict;
use warnings;

use Test::More;
use Test::Exception;

sub test_func {
    my %specs = @_;
    my ( $input, $expects, $desc ) = @specs{qw/ input expects desc /};

    subtest $desc => sub {

    };

}

test_func(
    input   => +{},
    expects => +{},
    desc    => "test1",
);

done_testing;
