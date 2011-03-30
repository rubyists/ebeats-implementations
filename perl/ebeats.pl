#!/usr/bin/env perl
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = gmtime(time);
print ((1000/24 * $hour) + (1000/24/60 * $min) + (1000/24/60/60 * $sec));
