#!/usr/bin/perl
# relitems.pl

@relitems=("two braziers","a candlestick","an idol","a vestry","some incense","a pulpit","some columns","a few lamps","a shrine","a candlestick","a few curtains","some robes","a candlestick","an unholy symbol","a shrine","a set of bells","a collection of vestments","a cassok","a lectern");

$relinum=int(rand($#relitems+1)+0);

print "Religions item: $relitems[$relinum]\n";


