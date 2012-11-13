#!/usr/bin/perl
# inndrink.pl
@adj = qw/Bee's Bawdy Happy Drunken Prancing Swimming Lusty Raunchy Sultry Singing Swaggering Double Screaming Triple Purring Stalking Windy Crawling Blubbering Thirsty Wizard's Magic Horny Laughing Yowling Lumbering Hot-headed Leaping Limping Hard-working Lazy Mischievous Playful Hidden Bouncing Sneaky Moaning Skipping One-eyed Drinking Long-necked Silver-tongued Bitchy Whiny Hot Tight Rhythmic Stinking Kicking Giant Sweet Sour Rum Chocolate Stiff Aching Bucket'O Barrel'O Stretchy Sticky Slippery Fuzzy Loud Quiet Call-the Steak-and Shout-to-the Raise-the Drop-the Red-Sailed Best Worst Hammered Hopping Climbing Falling One-legged Snapping Hungry Dragon's Fish's Bard's Poppy Winter's Summer's Elves Dwarven Kitchen Siren's/;
@noun = qw/Sting Trollop Harlot Dragon Pony Siren Wench Redhead Barmaid Sop Sap Parrot Sailor Sheets Snort Cat Watering-Hole Critter Bastard Tumbler Tower Unicorn Devil Feline Lupine Bitch Lizard Slut Fox Pirate Bard Ball-n-Chain Stepchild Ass Pussy Scorpion Bird Nipple Navel Wind Sail Sails Monring Evening Frog TurtleSink Forge Hammer Haven Healing Heat Frost Leaf Muse Lyre Hat Tail Flame Song Shake Wiggle Tart/;
# innname=innpre + adj + noun | adj + insuf
# drink = adj + noun
@innpre = ("Inn of the ","Lair of the ");
@insuf  = (" Place");
@matwpn = qw/Iron Iron Metal Bronze/;
@matbldg= qw/Wood Stone/;
@matwear= qw/Cloth Leather Mithril Wool/;
@matarmr=qw/Cloth Leather Scale-Mail Mithril Plate-Mail Half-Plate Bronze/;
@matjewl=qw/Jade Ivory Silver Gold Topaz Amethyst Diamond Citrine Peridot Jasper Turquoise/;
@texture=qw/Hard Soft/;

# from:  http://jtevans.kilnar.com/rpg/dnd/tools/dress.php?input=2
@airodor=("like rotting vegetation","like ozone","sulfurous","of manure","stale and fetid","like ozone","metallic","acrid","like urine","earthy","putrid"," dank and moldy","acrid","smoky","like ozone","acrid","like chlorine","smoky");

@dngdress=("a fireplace and wood","a hamper","a padded chair","a candelabra","a pedestal","a stand","a low table","a tapestry","a firkin","a trestle table","a chandelier","a wall basin and font","a cushion","a foot stool","a trunk","a large barrel","a screen","a mattreess","a low table","a desk");


@torchmb=("some clamps"," a pair of manicles","a pile of straw","a whip","a pair of pincers","a whip","a pile of straw","a rack","an iron maiden","a pair of tongs","a pair of manicles","a pillory","evil looking hooks","a couple of torches","a rack","a bastinadoes","a stool","a pair of manacles","metal cuffs"); 

@sounds=("boisterous laughter","buzzing","scuttling","rustling","bongs","howling","evil laughter","whistling","tapping","clicking","clashing","scuttling","scratching","bangs and slamming","drumming","hooting","squeaking","groaing","howling");

@relitems=("two braziers","a candlestick","an idol","a vestry","some incense","a pulpit","some columns","a few lamps","a shrine","a candlestick","a few curtains","some robes","a candlestick","an unholy symbol","a shrine","a set of bells","a collection of vestments","a cassok","a lectern");

$adjnum=int(rand($#adj)+0);
$nounnum=int(rand($#noun)+0);
$innttlpick=int(rand($#innpre + 1));
print "$innpre[$innttlpick] $adj[$adjnum] $noun[$nounnum] \n";

$adjnum=int(rand($#adj)+0);
$nounnum=int(rand($#noun)+0);
print "Specialty Drink:  $adj[$adjnum] $noun[$nounnum]\n";


