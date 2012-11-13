#!/usr/bin/perl
# dngdress.pl

# from:  http://jtevans.kilnar.com/rpg/dnd/tools/dress.php?input=2

@dngdress=("a fireplace and wood","a hamper","a padded chair","a candelabra","a pedestal","a stand","a low table","a tapestry","a firkin","a trestle table","a chandelier","a wall basin and font","a cushion","a foot stool","a trunk","a large barrel","a screen","a mattress","a low table","a desk");

$dressnum=int(rand($#dngdress)+0);

print "Inside is: $dngdress[$dressnum]\n";


