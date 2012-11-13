#!/usr/bin/perl
# torture.pl

# from:  http://jtevans.kilnar.com/rpg/dnd/tools/dress.php?input=2

@torchmb=("some clamps"," a pair of manicles","a pile of straw","a whip","a pair of pincers","a whip","a pile of straw","a rack","an iron maiden","a pair of tongs","a pair of manicles","a pillory","evil looking hooks","a couple of torches","a rack","a bastinadoes","a stool","a pair of manacles","metal cuffs"); 

$torcnbr=int(rand($#torchmb)+0);

print "Item: $torchmb[$torcnbr]\n";


