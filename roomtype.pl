#!/usr/bin/perl
# roomtype.pl
@lightcon=qw/well-lit dim candlelit lantern-lit dark/;
$lc=int(rand($#lightcon + 1));

@rt=("Animal Pens","Antechamber (Entry room into larger room)","Armory","Audience","Aviary","Banquet","Barracks / Quarters","Bath / Bathing Room","Bedroom/Boudior","Bestiary","Cell","Chantry (Shrine)","Chapel","Cistern (holds water)","Class","Closet","Conjuring","Corridor","Court","Crypt / Burial Chamber","Dining / Feast Hall","Divination","Dormitory","Dressing Room","Elevator Room","Empty (completely clean)","Entry-/Vestibule","Fountain/Pool Room","Gallery","Game Room","Garbage Room","Gardens","Guardroom","Hall","Hall, Great","Hallway","Harem/Seraglio","Heating Room (for warmth)","Kennel","Kitchen","Laboratory","Library","Lounge","","Map Room / Cartography","Meditation","Meeting Room","Museum","Music Room","Nest (animal)","Observatory","Office","Pantry","Pen/Prison","Pool","Priest's Chamber/Lab","Privy/Secret","Psionicist's Chamber/Lab","Reception","Refectory (Monestary Dining Room)","Robing Room","Rogue's Chamber/Lab","Salon","Shrine","Sitting Room","Smithy/Forge","Solar","Stable","Storage","Strongroom/Vault","Study","Temple","Throne Room","Torture Chamber","Training/Exercise/Practice","Treasure Room","Trophy Room","Wafer Closet/Toilet","Waiting Room","Wardrobe","Warrior's Chamber/Lab","Well","Wine Cellar","Wizard's Chamber/Lab","Workroom","Workshop");
$rtcnt=int(rand($#rt + 1));
print "Room appears to be $lightcon[$lc] $rt[$rtcnt]\n";

