#!/usr/bin/perl
# sounds.pl

# from:  http://jtevans.kilnar.com/rpg/dnd/tools/dress.php?input=2

@sounddist=("far away","through the wall","in the same room","close");
@soundloc=("north","northeast","northwest","south","southeast","southwest","east","west");



@sounds=("boisterous laughter","muffled","silence","chanting","buzzing","scuttling","rustling","bongs","evil laughter","metallic grinding","low hollow thumping","whistling","tapping","clicking","clashing","scuttling","scratching","bangs and slamming","drumming","hooting","squeaking","groaing","howling");

$sdnum=int(rand($#sounddist + 1)+0);
$slnum=int(rand($#soundloc + 1)+0);
$soundnum=int(rand($#sounds + 1)+0);

print "There is a $sounds[$soundnum] that is $sounddist[$sdnum] coming from the $soundloc[$slnum] direction\n";


