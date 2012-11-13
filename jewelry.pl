#!/usr/bin/perl
# jewelry.pl
@matjewl=qw/Jade Ivory Silver Gold Topaz Amethyst Diamond Citrine Peridot Jasper Turquoise/;

$matcnt=int(rand($#matjewl+1)+0);

print "Gem: $matjewl[$matcnt]\n";


