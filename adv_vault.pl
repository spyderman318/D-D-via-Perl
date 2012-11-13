#!/usr/bin/perl
# this routine accepts as input
# class, level, magic or normal, k=kit
# find npc items based on level chart in old dmg
#
#  if individual items wanted then:  armor, weapons,holy symbols
# orbs, rods, staffs, wands, arms slot items, companion slot items, 
# mount slot items, feet slot items, hands slot items, head slot items, 
# neck slot items, rings, waist slot items, wondrous items, consumables
@mw_armor_cloth_light=(" ","Githweave","Mindweave","Efreetweave","Mindpatterned");
#  Armor Bonus,Minimum Enhancement Bonus, Check, Speed, Price, Weight, Special, Will, Reflex, Fortitude, Resistance all
@githweave=(0,3,"-","-","Special",2,"+1 Will",1,0,0,0);
@mindweave=(0,4,"-","-","Special",2,"+2 Will",2,0,0,0);
@efreetweave=(1,5,"-","-","Special",2,"+1 Will",1,0,0,0);
@mindpatterned=(1,6,"-","-","Special",2,"+2 Will",2,0,0,0);

@mw_leather_light=(" ","Drowmesh","Snakeskin","Anathema","Swordwing");
@drowmesh=(2,3,"-","-","Special",10,"+1 Reflex",0,1,0,0);
@snakesskin=(2,4,"-","-","Special",10,"+2 Reflex",0,2,0,0);
@anathema=(3,5,"-","-","Special",10,"+1 Reflex",0,1,0,0);
@swordwing=(3,6,"-","-","Special",10,"+2 Reflex",0,2,0,0);

@mw_hide_light=(" ","Earthhide","Feyhide","Stalkerhide","Voidhide");
@earthhide=(3,3,-1,"-","Special",25,"+1 Fortitude",0,0,1,0);
@feyhide=(3,4,-1,"-","Special",25,"+2 Fortitude",0,0,2,0);
@stalkerhide=(4,5,-1,"-","Special",25,"+1 Fortitude",0,0,1,0);
@voidhide=(4,6,-1,"-","Special",25,"+2 Fortitude",0,0,2,0);

@mw_chainmail_heavy=(" ","Finemail","Braidmail",Crysteel","Weavemail","Pitmail");
@finemail=(7,2,-1,-1,"Special",40,"-",0,0,0,0);
@braidmail=(8,3,-1,-1,"Special",40,"-",0,0,0,0);
@crysteel=(8,4,-1,-1,"Special",40,"+2 Will",2,0,0,0);
@weavemail=(10,5,-1,-1,"Special",40,"+1 Will",1,0,0,0);
@pitmail=(11,6,-1,-1,"Special",40,"+2 Will",2,0,0,0);

@mw_scale_heavy=(" ","Drakescale",Wyvernscale","Stormscale","Nagascale","Titanscale");
@drakescale=(8,2,"-",-1,"special",45,"-",0,0,0,0);
@wyvernscale=(9,3,"-",-1,"special",45,"-",0,0,0,0);
@stormscale=(9,4,"-",-1,"special",45,"+2 Fortitude",0,0,2,0);
@nagascale=(11,5,"-",-1,"special",45,"+1 Fortitude",0,0,1,0);

@mw_plate_heavy=(" ","Rimefire plate","Layered plate","Gith Plate","Specter plate","Legion plate","Tarrasque plate");
@rimefireplate=(8,2,-2,-1,"Special",50,"Resist 1 all",0,0,0,1);
@layeredplate=(9,2,-2,-1,"Special",50,"Resist 1 all",0,0,0,1);
@githplate=(10,3,-2,-1,"Special",50,"-",0,0,0,0);
@specterplate=(10,4,-2,-1,"Special",50,"Resist 2 all",0,0,0,2);
@legionplate=(12,5,-2,-1,"Special",50,"-",0,0,0,0);
@tarrasqueplate=(12,6,-2,-1,"Special",50,"Resist 5 all",0,0,0,5);

#wpn type,weapon,1h or 2h,prof,damage die,range,price,weight,group,properties
simple melee weapons,spiked gauntlet,1,2,6,"-",5,1,"unarmed","Off-hand"
military melee weapons,broadsword,1,2,10,"-",20,5,"Heavy Blade","Versatile"
military melee weapons,Khopesh,1,2,8,"-",10,8,"Axe, heavy blade","Brutal 1, versatile
military melee weapons,light war pick,1,2,6,"-",10,4,Pick,"High crit,Off-hand"
military melee weapons,scourge,1,2,8,-,3,2,Flail,"Off-hand"
military melee weapons,trident,1,2,8,3/6,10,4,spear,"Heavy thrown, versatile"
military melee weapons,heavy war pick,2,2,12,-,20,8,pick,high crit
superior melee weapons,craghammer,1,2,10,-,20,6,hammer,"brutal 2 versatile"
superior melee weapons,kukri,1,2,6,-,10,2,light blade,"brutal 1,off-hand"
superior melee weapons,parrying dagger,1,2,4,-,5,1,Light blade,"Defensive, off-hand"
superior melee weapons,spiked shield,1,2,6,-,10,7,light blade,"Off-hand"
superior melee weapons,tratnyr,1,2,8,10/20,10,5,spear,"Heavy thrown,versatile"
superior melee weapons,triple-headed flail,1,3,10,-,15,6,flail,versatile
superior melee weapons,waraxe,1,2,12,-,30,10,axe,versatile
superior melee weapons,execution axe,2,2,12,-,30,14,axe,"Brutal 2, high crit"
superior melee weapons,fullblade,2,3,12,-,30,10,heavy blade,high crit
superior melee weapons,greatspear,2,3,10,-,25,8,"Polearm/spear","Reach"
superior melee weapons,mordenkrad,2,2,2d6,-,30,12,hammer,"Brutal 1"
superior melee weapons - double weapons,double axe,1,2,d10/d10,-,40,15,axe,"defensive,off-hand"
superior melee weapons - double weapons,double flail,1,2,d10/d10,-,30,11,flail,"defensive, off-hand"
superior melee weapons - double sword,1,3,d8/d8,-,40,9,"Heavy blade, Light blade","Defensive, off-hand"
superior melee weapons - Urgrosh, 1,2,d12/d8,-,30,12,"Axe,spear","Defensive,off-hand"
simple ranged weapons,repeating crossbow,2,2,8,10/20,35,6,crossbow,load free
simple ranged weapons,ammunition,magazine,-,-,-,-,1,1,-,-
superior ranged weapons,greatbow,2,2,12,25/50,30,5,bow,load free
superior ranged weapons,superior crossbow,2,3,10,20/40,30,6,crossbow,load minor

mounts
mount,price(gp),speed,per hour,per day,normal (lb.),heavy (lb.), push/drag (lb.)
blade spider,12000,6,3,30,250,500,1250
camel,75,9,4.5,45,237,475,1187
dire boar,1800,8,4,40,237,475,1187
elephant,3400,8,4,40,312,625,1562
giant ant,1800,9,4.5,45,237,475,1187
giant lizard - draft,200,7,3.5,35,237,475,1187
giant lizard - riding,1800,9,4.5,45,250,500,1250
griffon,9000,fly 10,5,50,250,500,1250
griffon - rimefire,525000,fly 10,5,50,300,600,1500
hippogriff,4200,fly 10,5,50,237,475,1187
hippogriff dreadmount,4200,fly 10,5,50,262,525,1312
horse - celestial charger,13000,8,4,40,287,575,1437
horse - riding,75,8,4,40,237,475,1187
horse - sea,1800, swim 10,5,50,225,450,1125
horse - skeletal, 17000,10,5,50,250,500,1250
horse - warhorse, 200,8,4,40,262,525,1312
manticore,45000,fly 8,4,40,262,525,1312
nightmare,25000,fly 10,5,50,287,575,1437
rage drake, 2600,8,4,40,237,475,1187
rhinoceros,2600,6,3,30,262,525,1312
shark - dire,21000, swim 11,5.5,55,210,420,1050
shark - riding, 3400, swim 11,5.5,55,190,380,950
trihorn behemoth,21000,6,3,30,325,650,1625
wolf - dire, 1000, 8,4,40,237,475,1187
wyvern,21000,fly 8,4,40,300,600,1500

camel,level 1 brute,xp 100,large natural beast,initiative +1,senses perception +1,hp 38,bloodied 19,ac 13,fortitude 13, reflex 10, will 9, speed 9,kick (standard; at-will), +4 vs AC; 1d10 + 4 damage, AL - unaligned, languages -, skills Endurance +9, st 19 (+4) in 2 (-4) wi 11 (+0) dx 13 (+1) co 18 (+4) ch 8 (-1)

trihorn behemoth, level 12 soldier,xp 700,huge natural beast (mount), initiative +12,senses Perception +7, hp 127, bloodied 63,ac 28, fortitude 30, reflex 26, will 23, speed 6, gore (standard; at-will), +17 vs AC; 2d8 + 8 damage, Protective crest (while mounted by a friendly rider of 12 level or higher; atwill),
The trihorn behemoth's rider gains a +1 shield bonus to AC and Reflex defense, Alignment Unaligned, Languages - ,st 26 (+8) in 14 (+2) wi 13 (+1) dx 18 (+4) co 23 (+6) ch 15 (+2)

Element 115 - used to power flying saucers

item,slot,lvl,cost,categories,info location 
belt of resilience,	waist,		1,cost,categories,av164 
distance + 1,		weapon,		1,cost,categories,av68
restful bedroll,	Wondrous Item,	1,cost,categories,av176

robe of eyes +1, 	armor,		2,cost,categories,av50
shield of the guardian,	arms,		2,cost,categories,av120
staff of missle mastery,staff,		2,cost,categories,av106
silent tool,		wondrous item,	2,av177
shroud of protection,	wondrous item,	2,av177

floating lantern,	wondrous item,	3,av171
brooch of shielding +1,	neck,		3,cost,categories,av149
flame wand +1,		wand,		3,cost,categories,av109
horseshoes of speed,	mount item,	3,av123
orb of far seeing +1,	orb,		3,av93
rod of blasting +1	rod,		3,av99
stonemeal biscuit,	consumable,	3,av192
symbol of divine reach +1,holy symbol,	3,av88

potion of resistance,	consumable,	4,av188
mithral +1,		armor,		4,av48

companion's defender,	companion item,	5,av122
surefoot boots,		feet,		5,av130

breaching gauntlets,	hands,		6,av132
Imposter's +2,		armor,		6,av46
orb of impenetrable escape +2,orb,	6,av94
orb of mental dominion +2,orb,		6,av95
helm of vigilant awareness,head,	6,av143

bloodclaw +2,		weapon,		7,av65
fireflower pendant +2,	neck,		7,av152
elixir of dragon breath,consumable,	7,av193
potion of lifeshield,	consumable,	7,av188
quickcurse rod +2,	rod,		7,av99
rope of slave fighting,	waist,		7,av166
staff of elemental prowess,staff,	7,av105
trauma bracers,		arms,		7,av121
wildleaf +2,		armor,		7,av55
enshrouding candle,	wondrous item,	7,av171 

death rattle,		wondrous item,	8,av169
adamantine +2,		weapon,		8,av63
armor of exploits +2,	armor,		8,av41
black feather of the raven queen +2,holy symbol,8,av85
dust of arcane insight,	wondrous item,	8,av170
evil eye fetish +2,	neck,		8,av152
gloves of the bounty hunter,hands,	8,av134
mithral shield,		arms,		8,av118
peacemaker's periapt +2,neck,		8,av153
rod of the hidden star +2, rod, 	8,av101
stone of avandra +2,	holy symbol,	8,av87
sash of ensnarment,	waist,		8,av166
staff of ultimate defense +2,staff,	8,av107
star of corellon +2,	holy symbol,	8,av86
steadfast saddle,	mount item,	8,av124
swimtide harness,	waist,		8,av167
wand of psychic ravaging,wand,		8,av111
vanguard +2,		weapon, 	8,av81
waterbane +2,		weapon,		8,av82
whiteflame +2,		armor,		8,av55
wyrmguard shield,	arms,		8,av122

cloak of distortion +2,	neck,		9,av151
collar of recovedry +2,	neck,		9,av151
crown of infernal legacy,head,		9,av140
crusader's +2,		weapon,		9,av66
endless canteen,	wondrous item,	9,av171
endless quiver,		wondrous item,	9,av171
feyswarm staff +2, 	staff,		9,av104
gloves of storing, 	hands, 		9,av134
goggles of the bone collector,head,	9,av142
spell anchors,		hands, 		9,av136
sure shot gloves, 	hands, 		9,av137
survivor's +2,		armor,		9,av54
symbol of astral might +2, holy symbol,	9,av87
thoughtstealer +2,	weapon,		9,av80
vampiric +2,		weapon,		9,av81

architect's staff +2,	staff,		10,av103
cap of water breathing,	head,		10,av138
chime of warding,	wondrous item,	10,av169
crystal ball of spying,	wondrous item,	10,av169
footpad's friend +2,	weapon,		10,av69
hat of disguise,	head,		10,av142
skeleton key,		wondrous item,	10,av177
spymaster's quill,	wondrous item,	10,av178
staff of unparalleled vision +2,staff, 10,av107
------------11-----------------------------------   
assassin's slippers,	feet,	 	11,av125
rogue's belt,		waist,		11,av166
unfettered thieve's tools,wondrous item,11,av178
unguent of darkvision,	consumable,	11,av192
warlock's bracers,	arms,		11,av121
-------------12---------------------------------
blade of night +3, 	weapon, 	12,av65
rod of feythorns +3,	rod,		12,av100
------------------13----------------------------
boots of stealth,	feet,		13,av126
bracers of wound closure,arms,		13,av116
cog of erathis +3,	holy symbol,	13,av85
dragonscale of bahamut +3,holy symbol,	13,av85
mask of melora +3,	holy symbol,	13,av86
paired +3,		weapon,		13,av74
moradin's indestructible anvil +3,holy symbol,13,av86
necrotic +3,		weapon, 	13,av73
scalebane +3,		weapon,		13,av77
stoneskin robes +3,	armor,		13,av53
strongheart +3,		weapon,		13,av79
sun disk of pelor +3,	holy symbol,	13,av87
swiftshot +3,		weapon,		13,av79
tigerclaw gauntlets +3,	weapon,		13,av80
wand of cold +3,	wand,		13,av111
wand of swarming force +3,wand,		13,av112
withering +3,		weapon,		13,av82
---------------14---------------------------------
acidic +3,		weapon,		14,av62
amulet of elusive prey +3,neck,		14,av148
assured wand of howl of doom +3,wand,	14,av109
bracers of iron arcana,	arms,		14,av115
chaos weave +3,		armor,		14,av43
bloodthirst bracers,	arms,		14,av114
armor of night +3,	armor,		14,av41
bonegrim +3,		armor,		14,av42
cloak of the walking wounded +3,neck,14,av151
displacer +3,		armor,		14,av44
demonbane +3,		weapon, 	14,av67
gloves of dimensional repulsion,hands,14,av134
lifesapper rod +3,	rod,		14,av99
magician's ring,	ring,		14,av157
ring of feather fall,	ring,		14,av158
robe of contingency +3,	armor,		14,av49
rod of the dragonborn +3,rod,		14,av101
rod of the shadow walker +3,rod,	14,av101
sail of winds,		wondrous item,	14,av176
spellshield,		arms,		14,av120
symbol of vengeance +3,	holy symbol,	14,av91
thunderhead +3,		armor,		14,av54
transposing +3,		weapon,		14,av81
vampiric +3,		weapon,		14,av81
verve +3,		armor,		14,av54
voidcrystal +3,		weapon,		14,av82
voidcrystal +3,		armor,		14,av55
wounding +3,		weapon,		14,av82
----------15--------------------------------------
amulet of aranea +3,	neck,		15,av148
armor of negation +3,	armor,		15,av41
armor of sacrifice +3,	armor,		15,av41
cape of the mountebank +3,neck,		15,av149
dread nightshade,	consumable,	15,av194
necklace of fireballs +3,neck,		15,av153
premonition ring,	ring,		15,av157
reality cord,		waist,		15,av166
ring of shadow travel,	ring,		15,av159
rod of mindbending +3,	rod,		15,av100
spiritlink +3,		armor,		15,av53
staff of gathering +3,	staff,		15,av105
thieving +3,		weapon,		15,av80
-----------------16------------------------------
chameleon ring,		ring,		16,av156
-------------------17----------------------------
orb of augmented stasis +4,orb,		17,av92
orb of spatial contortion +4,orb,	17,av95
robe of bloodwalking +4,armor,		17,av49
ring of arcane information,ring,	17,av157
ring of retreat,	ring,		17,av159
staff of missle master +4,staff,	17,av106
wildleaf +4,		armor,		17,av55
----------------18-------------------------------
dark clover,		consumable,	18,av193
fist of Kord +4,	holy symbol,	18,av86
helm of swift punishment,head,		18,av143
master's wand of eldritch blast +4,wand,18,av110
moon disk of sehanine +4,holy symbol,18,av86
orb of karmic resonance +4,orb,		18,av95
orb of sweet sanctuary +4,orb,	18,av96
rat form +4, 		armor,		18,av48
sandals of arcane transposition,feet,	18,av130
stalker's +4,		armor,		18,av53
sniper's +4,		weapon,		18,av78
-------------19----------------------------------
amethyst band of invisible eyes,ring,	19,av155
anklets of opportunity,	feet,		19,av125
battlemaster's +4,	armor,		19,av64
communal +4,		weapon,		19,av66
eye of the earthmother,	head,		19,av141
flamewrath cape +4,	neck,		19,av152
healer's brooch +4,	neck,		19,av152
pelaurum +4,		armor,		19,av48
rending +4,		weapon,		19,av76
solar +4,		armor,		19,av52
sunblade +4,		weapon,		19,av79
vaporform +4,		armor,		19,av54
---------20------------------------------------
antipathy gloves,	hands,		20,av132
trickster's mask,	head,		20,av145
robe of the archfiend +4,	armor,		20,av50
torc of power preservation +4,neck,	20,av154
---------21------------------------------------
augmenting whetstone,	consumable,	21,av190
blacksmelt +5,		weapon,		21,av64 
coif of focus,		head,		21,av139
distance +5,		weapon,		21,av68
dynamic +5,		weapon,		21,av68
grasping +5,		weapon, 	21,av70
ioun stone of sustenance,head,		21,av144
summoned +5,		armor,		21,av53
unguent of blindsight,	consumable,	21,av192
---------22-------------------------------------
absence amulet +5,	neck,		22,av147
amulet of mental resolve,neck,		22,av148
blink ring,		ring,		22,av156
bloodclaw +5,		weapon,		22,av65
avandra's whisper +5,	weapon,		22,av63
eagle eye goggles,	head,		22,av140
elukian clay +5,	weapon, 	22,av68
pact hammer +5,		weapon,		22,av74
ring of fey travel,	ring,		22,av158
robe of bloodwalking +5,armor,		22,av49
rod of the star spawn +5,rod,		22,av101
staff of elemental prowess +5,staff,	22,av105
staff of missle mastery +5,staff,	22,av106
staff of searing death +5,staff,	22,av106
staff of the iron tower +5,staff,	22,av106
staff of the serpent +5,staff,		22,av106 
staggering +5,		weapon, 	22,av78
immunizing +5,		armor,		22,av46
veteran's +5,		armor,		22,av55
wildleaf +5,		armor,		22,av55
-----------23----------------------------------
Point blank +5,		weapon,		23,av75
predatory +5,		weapon,		23,av75
----------24-----------------------------------
cloak of autumn's child +5,	neck,	24,av150
dragonscale-blue,	armor,		24,av44
frostburn +5,		armor,		24,av45
mindiron+5,		weapon,		24,av72
orb of arcane generosity +5,orb,	24,av92
orb of coercive dementia +5,orb,	24,av92
orb of crimson commitment +5,orb,	24,av92
orb of draconic majesty +5,orb,		24,av93
ritualist's ring,	ring,		24,av162
wyrmtouched amulet +5,	neck,		24,av155
zephyr boots,		feet,		24,av131
----------25------------------------------------
airstriders,		feet,		25,av125
brilliant energy +5,	weapon,		25,av65
chime of opening,	wondrous item,	25,av169
gargoyle ring,		ring,		25,av156
ghost chain +5,		weapon,		25,av70
girdle of the umber hulk,waist,		25,av165
illithid robes +5,	armor,		25,av46
Ioun stone of regeneration,head,	25,av143
jarring +5,		weapon,		25,av71
life charm +5,		neck,		25,av71
mind dust,		consumable,	25,av194
potion of clarity,	consumable,	25,av188
potion of spirit,	consumable,	25,av188
overreaching +5,	weapon,		25,av73
precise wand of color spray +5,wand,	25,av111
quickhit bracers,	arms,		25,av118
sorrowsworn ring,	ring,		25,av162
spiritlink +5,		armor,		25,av53
symbol of the warpriest +5,holy symbol,	25,av90
trespasser's bane +5,	weapon,		25,av81
wand of erupting flame +5,wand,		25,av111
warsheath +5,		armor,		25,av55
zealot's +5,		armor,		25,av55
----------26-------------------------------------
battering +6,		weapon,		26,av63
bracers of archery,	arms,		26,av115
bracers of tactical blows,arms,		26,av116
clockwork owl,		head,		26,av139
cold iron bracers,	arms,		26,av116
flamedrinker shield,	arms,		26,av117
forceful +6,		weapon, 	26,av69
girdle of the dragon,	waist,		26,av165
iron armbands of power,	arms,		26,av117
mercurial rod +6,	rod,		26,av99
ricochet +6,		weapon,		26,av76
venom gloves,		hands,		26,av137
--------------27----------------------------------
Mnemonic staff +6,	staff,		27,av104
pact sword +6,		weapon,		27,av74
ring of the phoenix,	ring,		27,av161
shadow band,		ring,		27,162
--------------28---------------------------------
bag of tricks-vermillion,wondrous item,	28,av184
brightleaf,		consumable,	28,av193
feyrod +6,		rod,		28,av98
master's wand of magic missle +6,wand,	28,av110
charm of abundant action,wondrous item,	28,av169
---------------29-------------------------------
quickening diadem,	head,		29,av144
star of the astral sea +6,neck,		29,av154
staff of light +6,	staff,		29,av105
---------------30-------------------------------
ring of greater spell storing,ring,	30,av160
Flame rose,		consumable,	30,av194
gorget of reciprocity,	neck,		30,av152
legendary +6,		weapon,		30,av71
fundamental ice,	consumable,	30,av194
nullifying ring,	ring,		30,av157









shipofgoldinfo.com
ss central america?

