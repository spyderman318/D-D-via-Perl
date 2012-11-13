#!/usr/bin/perl
# company.pl
@adj = qw/Secret Legion_of Silent Society Stinking Knights_of Band_of Drunken Prancing Swimming Lusty Raunchy Sultry Singing Swaggering Double Screaming Triple Purring Stalking Windy Crawling Blubbering Thirsty Wizard's Magic Horny Laughing Yowling Lumbering Hot-headed Leaping Limping Hard-working Lazy Mischievous Playful Hidden Bouncing Sneaky Moaning Skipping One-eyed Drinking Long-necked Silver-tongued Bitchy Whiny Rhythmic Stinking Kicking Sweet Sour Rum Chocolate Stiff Aching Sticky Slippery Fuzzy Loud Quiet Call-the Raise-the Drop-the Red-Sailed Best Worst Hammered Hopping Climbing Falling One-legged Snapping Hungry Dragon's Fish's Bard's Poppy Winter's Summer's Elves Dwarven Kitchen Siren's/;

@noun = qw/Roses of-the-Rose of-the-Valley Camelot Gentlemen Shadows Assassins Demons Cape Hoods Stingers Dragons Bitches of_the_Wind Sailors Orc-Killers Goblin-Killers Tarts/;

@colored = qw/Crimson Red Crimson Orange Yellow Green Blue Indigo Violet Purple Brown Black/;

@matwpn = qw/Iron Iron Metal Bronze/;
@matbldg= qw/Wood Stone/;
@matwear= qw/Cloth Leather Mithril Wool/;
@matarmr=qw/Cloth Leather Scale-Mail Mithril Plate-Mail Half-Plate Bronze/;
@matjewl=qw/Jade Ivory Silver Gold Topaz Amethyst Diamond Citrine Peridot Jasper Turquoise/;
@texture=qw/Hard Soft/;

@sounds=("Laughing","Buzzing","Scuttling","Rustling","Howling","Whistling","Tapping","Clicking","Clashing","Scratching","Drumming","Hooting","Squeaking","Groaning");

$adjnum=int(rand($#adj)+0);
$nounnum=int(rand($#noun)+0);
$colornum=int(rand($#colored)+0);
$soundnum=int(rand($#sounds)+0);

print "$adj[$adjnum] $colored[$colornum] $sounds[$soundnum] $noun[$nounnum] \n";

$adjnum=int(rand($#adj)+0);
$nounnum=int(rand($#noun)+0);


