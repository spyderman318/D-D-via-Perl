#!/usr/bin/perl
# dungtype.pl
#
@matbldg= qw/Wood Stone/;
@texture=qw/Hard Soft/;
@dungtype=("Arena Level","Assassin's Guild ","Graveyard/Crypt","Lair (Animal)","Lair (Beholder)","Lair (Dragon)","Lair (Elemental) / Elemental Cave","Lair (Giant)","Lair (Golem)","Lair (Humanoid)","Lair (Insect) / Hive ","Lair (Lycanthrope)","Lair (Ooze)","Lair (Outer) / Dungeon biased by a Plane","Lair (Plant)","Lair (Reptile)","Lair (Undead)","Lair (Water)","Lair (Weird)","Lair (Alien)","Lair (Faerie)","Lair (Immortal(s))","Lair (NPC Party/Parties)","Lair (Psionic-using (roll 1d30 for frequency))","Lair (Technological)","Living Dungeon (dungeon itself is alive)","Martial Arts Dojo","Maze","Narrow Corridors (only 3' wide, single file)","Natural Cave","Signal Tower / Lighthouse","Special Dungeon (it's mostly [D6] Specials)","Temple","Thieves' Guild","Trap Dungeon (it's mostly [D4] Traps)","Trick Dungeon (it's mostly [D5] Tricks)","Unconnected Rooms (use teleporters to get around)","Unusual Material (walls are made of DM's choice )","Unusual Material, Blood Rock (+1 crit ranges)","Unusual Material, Deadwood (Undead resist turning)","Unusual Material, Mage Stone (spells enhanced by 1 CL)","Wizard's Tower","(Pick a Room Type, the dungeon is all that type) ","(Roll on this table twice)");

$dtcnt=int(rand($#dungtype + 1));
print "Dungeon Type:  $dungtype[$dtcnt]\n";


