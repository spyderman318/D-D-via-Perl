#!/usr/bin/perl
# airquality.pl
#
@aq=qw/clear dusty foggy-near-ceiling foggy-near-floor hazy misty oxygen-poor smoky steamy steamy-near-celing steamy-near-floor/;

$aqcnt=int(rand($#aq +1));

print "it is $aq[$aqcnt] \n";


