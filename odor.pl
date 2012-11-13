#!/usr/bin/perl
# odor.pl
@matwpn = qw/Iron Iron Metal Bronze/;
@matbldg= qw/Wood Stone/;
@matwear= qw/Cloth Leather Mithril Wool/;
@matarmr=qw/Cloth Leather Scale-Mail Mithril Plate-Mail Half-Plate Bronze/;
@matjewl=qw/Jade Ivory Silver Gold Topaz Amethyst Diamond Citrine Peridot Jasper Turquoise/;
@texture=qw/Hard Soft/;

# from:  http://jtevans.kilnar.com/rpg/dnd/tools/dress.php?input=2
@airodor=("like rotting vegetation","normal","like ozone","sulfurous","of manure","stale and fetid","normal","like ozone","metallic","acrid","like urine","earthy","putrid"," dank and moldy","sweaty","chemical","freshly killed animal","like ozone","acrid","like chlorine","smoky");

@dngdress=("a fireplace and wood","a hamper","a padded chair","a candelabra","a pedestal","a stand","a low table","a tapestry","a firkin","a trestle table","a chandelier","a wall basin and font","a cushion","a foot stool","a trunk","a large barrel","a screen","a mattreess","a low table","a desk");


@torchmb=("some clamps"," a pair of manicles","a pile of straw","a whip","a pair of pincers","a whip","a pile of straw","a rack","an iron maiden","a pair of tongs","a pair of manicles","a pillory","evil looking hooks","a couple of torches","a rack","a bastinadoes","a stool","a pair of manacles","metal cuffs"); 

@sounds=("boisterous laughter","buzzing","scuttling","rustling","bongs","howling","evil laughter","whistling","tapping","clicking","clashing","scuttling","scratching","bangs and slamming","drumming","hooting","squeaking","groaing","howling");

@relitems=("two braziers","a candlestick","an idol","a vestry","some incense","a pulpit","some columns","a few lamps","a shrine","a candlestick","a few curtains","some robes","a candlestick","an unholy symbol","a shrine","a set of bells","a collection of vestments","a cassok","a lectern");

$odornum=int(rand($#airodor)+0);

print "Smell: $airodor[$odornum]\n";


