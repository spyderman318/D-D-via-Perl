#!/perl/bin
#NPCGEN.pl
#Generates a NPC Party
#Minimum of (4) characters
#Minimum of (1) for each role
#(1) leader (cleric or warlord)
#(1) defender(fighter or paladin)
#(1) striker(ranger, rogue or warlock)
#(1) controller(wizard)
#
#Generates the following
#partyname, charname, stats, spells, level, race, gender, mnr
#
$passes = 0;

$partysize=0;
@role=("controller","defender","leader","striker");
@controller=("wizard");
@defender=("fighter","paladin");
@leader=("cleric","warlord");
@striker=("ranger","rogue","warlock");
#  Ability Modifiers
#  Ability	Ability		
#  Score	Modifier
#  1		-5
#  2		-4
#  3		-4
#  4		-3
#  5		-3
#  6		-2
#  7		-2
#  8		-1
#  9		-1
# 10		+0
# 11		+0
# 12		+1
# 13		+1
# 14		+2
# 15		+2
# 16		+3
# 17		+3
# 18  		+4
# 19		+4
# 20 		+5
# 21		+5
# 22		+6
# 23		+6
# 24		+7
# 25		+7
# 26		+8
# 27 		+8
# 28		+9
# 29		+9
# 30		+10
# 31		+10
# 32		+11
# 33		+11
# 34		+12
# 35		+12
# 36		+13
# 37		+13
# 38		+14
# 39		+14
# 40		+15
# 41		+15


@class=("Bard","Cleric","Fighter","Druid","Sorcerer", "Paladin","Swordmage","Ranger - Archer","Ranger - 2 blade","Witch","Rogue","Psion","Warlock","Warlord","Wizard"); 
@arcaneclass=("Bard","Sorcerer","SwordMage","Witch","Warlock","Wizard");
@divineclass=("Cleric","Paladin"); 
@race=("Dragonborn", "Dwarf", "Eladrin", "Elf", "Half Elf", "Halfling", "Human", "Tiefling"); 
#  Dragonborn Racial Traits
#  Average Height:  6'2"-6'8"
#  Average Weight:  220-320 lbs.
#  Ability Scores:  +2 Strength, +2 Charisma
#  Size:  Medium
#  Speed:  6 squares
#  Vision:  Normal
#  Languages:  Common, Draconic
#  Skill Bonuses:  +2 History,+2 Intimidate
#  Dragonborn Fury:  When you're bloodied, you gain a +1 racial bonus to attack rolls
#  Draconic Heritage:  Your healing surge value is equal to one-quarter of your maximum hit points + your Constitution modifier.
#  Dragon Breath:  You can use dragon breath as an encounter power.
#  Favored classes:  Warlord, Fighter and Paladin 
#
#  Dwarf Racial Traits
#  Average Height:  4'3"-4'9"
#  Average Weight:  160-220 lb.
#  Ability Scores:  +2 Constitution, +2 Wisdom
#  Size:  Medium
#  Speed:  5 squares
#  Vision:  Low-light
#  Languages:  Common, Dwarven
#  Skill Bonuses:  +2 Dungeoneering, +2 Endurance
#  Cast-Iron Stomach:  +5 racial bonus to saving throws against poison
#  Dwarven Resilience:  You can use your second wind as a minor action instead of a standard action
#  Dwarven Weapon Proficiency:  You gain proficiency with the throwing hammer and the warhammer
#  Encumbered Speed:  You move at your normal speed even whit it would normally be reduced by armor or a heavy load.  Other effects that limit speed (such as difficult terrain or magical effects) affect you normally.
#  Stand your Ground:  When an effect forces you to move-through a pull, a push or a slide-you can move 1 square less than the effect specifies.  This means an effect that normally pulls, pushes or slides a target 1 square does not force you to move unless you want to.  
#  In addition, when an attack would knock you prone, you can immediately make a saving throw to avoid falling prone.
#  Favored Classes:  Paladin, Cleric and Fighter




Eladrin Racial Traits
Average Height:  5'5" - 6'1"
Average Weight:   130-180 lb.
Ability Scores:  +2 Dexterity, +2 Intelligence
Size:  Medium
Speed:  6 squares
Vision:  Low-light
Languages:  Common, Elven
Skill Bonuses:  +2 Aracana, +2 History
Eladrin Education:  You gain training in one additinal skill selected from the skill list in Chapter 5
Eladrin Weapon Proficiency:  You gain proficiency with the longsword
Eladrin Will:  You gain a +1 racial bonus to your Will defense
  In addition, you gain +5 racial bonus to saving throws against charm effects
Fey Origin:  Your ancestors were native to the Feywild, so you are considered a fey creature for the purpose of effects that relate to creature origin.
Trance:  Rather than sleep, eladrin enter a meditative state known as trance.  You need to spend 4 hours in this state to gain the same benefits other races gain from taking a 6-hour extended rest.  While in a trance, you are fully aware of your surroundings and notice approaching enemies and other events as normal.
Fey Step:  You can use fey step as an encounter power.

Fey Step:  Eladrin Racial Power
With a step, you vanish from one place and appear in another.
Encounter:  Teleportation
Move Action:  Personal
Effect:  Teleport up to 5 squares (see "Teleportation" on page 286)

Favored Classes:  Wizard, Rogue and Warlord




Elf Racial Traits
Average Height:  5'4" - 6'
Average Weight:  130-170 lb. 
Ability Scores:  +2 Dexterity, +2 Wisdom
Size:  Medium
Speed:  7 squares
Vision:  Low-light 
Languages:  Common, Elven
Skill Bonuses:  +2 Nature, +2 Perception
Elven Weapon Proficiency:  You gain proficiency with the longbow and the shortbow
Fey Origin:  Your ancestors were native to the Feywild, so you are considered a fey creature for the purpose of effects that relate to creature origin.
Group Awareness:  You grant non-elf allies within 5 squares of you a +1 racial bonus to Perception checks
Wild Step:  You ignore difficult terrain when you shift (even if you have a power that allows you to shift multiple squares)
Elven Accuracy:  You can use elven accuracy as an encounter power.

Elven Accuracy - Elf Racial Trait
With an instant of focus, you take careful aim at your foe and strike with the legendary accuracy of the elves.
Encounter - 
Free Action 	Personal
Effect:  Reroll an attack roll.  Use the second roll, even if it's lower.
Favored Classes:  Ranger,Rogue and Cleric





Half-Elf
Racial Traits
Average Height:  5'5" - 6'2"
Average Weight:  130-190 lb.
Ability Scores:  +2 Constitution, +2 Charisma
Size:  Medium
Speed:  6 squares
Vision:  Low-light
Languages:  Common, Elven, choice of one other
Skill Bonuses:  +2 Diplomacy, +2 Insight
Dilettante:  At 1st level, you choose an at-will power from a class different from yours.  You can use that power as an encounter power.
Dual Heritage:  You can take feats that have either elf or human as a prerequisite (as well as those specifically for half-elves), as long as you meet any other requirements.
Group Diplomacy:  You grant allies withi 10 squares of you a +1 racial bonus to Diplomacy checks.
Favored Classes:  Warlord, Paladin and Warlock




Halfling
Halfling Racial Traits
Average Height:  3'10" - 4'2"
Average Weight:  75-85 lb.
Ability Scores:  +2 Dexterity, +2 Charisma
Size:  Small
Speed:  6 squares
Vision:  Normal
Languages:  Common, choice of one other
Skill Bonuses:  +2 Acrobatics, +2 Thievery
Bold:  You gain a +5 racial bonus to saving throws against fear
Nimble Reaction:  You gain a +2 racial bonus to AC against opportunity attacks
Second Chance:  You can use second chance as an encounter power

Second Chance - Racial Power
Luck and small size combine to work in your favor as you dodge your enemy's attack
Encounter
Immediate Interrupt	Personal
Effect:  When an attack hits you, force an enemy to roll the attack again.  The enemy uses the second roll, even if it's lower.

Favored Classes:  Rogue, Ranger and Warlock
Notes:  Being small
Small characters follow most of the same rules as Medium ones, with the following exceptions
*  You can't use two-handed weapons (page 215), such as greatswords and halberds.
*  When you use a versatile weapon (page 217), such as a longsword, you must use it two-handed, but you don't deal additional damage for doing so.


Human
Racial Traits
Average Height:  5'6 - 6'2"
Average Weight:  135 - 220 lb.
Ability Scores"  +2 to one ability score of your choice
Size:  Medium
Speed:  6 squares
Vision:  Normal
Languages:  Common, choice of one other
Bonus At-Will Power:  You know one extra at-will power from your class
Bonus Feat:  You gain a bonus feat at 1st level.  You must meet the feat's prerequisites
Bonus Skill:  You gain training in one additional sill from your class skill list
Human Defense Bonuses:  +1 to Fortitude, REflex and Will Defenses
Favored Class:  Any/All





Tiefling
Racial Traits
Average Height:  5'6" - 6'2"
Average Weight:  140-230 lb.
Ability Scores:  +2 Intelligence, +2 Charisma
Size:  Medium
Speed:  6 squares
Vision:  Low-light
Languages:  Common, choice of one other
Skill Bonuses:  +2 Bluff, +2 Stealth
Bloodhunt:  You gain a +1 racial bonus to attack rolls against bloodied foes
Fire Resistance:  You have resist fire 5 + one-half your level
Infernal Wrath:  You can use infernal wrath as an encounter power

Infernal Wrath - Tiefling Racial Power
You call upon your furious nature to improve your odds of harming your foe
Encounter
Minor Action	Personal
Effect:  You can channel your fury to gain a +1 power bonus to your next attack roll against an enemy that hit you since your last turn.  If your attack hits and deals damage, add your Charisma modifier as extra damage.

Favored Classes:  Warlock, Warlord and Rogue


Classes
Cleric (page 60) a divinely inspired warrior
Fighter (page 75):  A master of martial combat.
Paladin (page 89):  A champion dedicated to a specific diety
Ranger (page 103):  A ranged or two-weapon combat specialist
Rogue (page 116):  A combatant who uses stealth and slyness to thwart enemies
Warlock (page 129):  A wielder of arcan power gleaned from otherworldly entities
Warlord (page 143):  A commander who leads from the front
Wizard (page 156):  The world's most powerful purveyor of magic



Paragon Paths  Levels 11-20
Cleric (page 72):  Angelic avenger, Divine oracle, Radiant servant, Warpriest
Fighter (page 86):  Iron vanguard, Kensei, Pit Fighter, Swordmaster
Paladin (page 100):  Astral Weapon, Champion of order, Hospitaler, Justiciar
Ranger (page 113):  Battlefield archer, Beast stalker, Pathfinder, Stormwarden
Rogue (page 126):  Cat burglar, Daggermaster, Master Infiltrator, Shadow Assassin
Warlock (page 140):  Doomsayer, Feytouched, Life-stealer
Warlord (page 153):  Battle Captain, Combat Veteran, Knight Commander, Sword Marshal
Wizard (page 169):  Battle mage, Blood mage, Spellstorm mage, Wizard of the Spiral Tower


Epic Destinies 21-30

Epic Destiny		Description					Prerequisite
Archmage		Ultimate master of arcane spells		21st level Wizard
	Arcane Seclusion - Demispell
	Spell Recall (21st level):  At the beginning of each day, choose one daily spell that you know (and have prepared today, if you prepare spells).  You can use that spell two times that day, rather than only once.
	Arcane Spirit (24th level):  
	Archspell (30th level):  
	Archmage Power:  Shape Magic - Archmage Utility 26
		You reach into the ebb and flow of arcane energy and pluck a spell you have already used out of the invisible tide, instantly recalling it to memory.
Daily Standard Action		Personal
Effect:  You regain one arcane opwer you have already used.





Deadly trickster	A wanderer, thief, pragmatist and survivor	21st level; Dexterity 21 or Charisma 21; training in Acrobatics, Bluff, Stealth or Thievery
	Sly Fortune's Favor (21st level):  You have a knack for getting out of tough situations.  Three times per day, as a free action, you can reroll a d20 roll (attack roll, skill check, ability check or saving throw)
	Trickster's Control (24th level):  If you roll an 18 or highter on the d20 when making the first attack roll for an encounter or daily attack pwer, that power is not expended.
	Trickster's Disposition (30th level):  Once per day, you can tell the DM to treat the result of a d20 roll he just made as a 1.  No rerolls are possible
Deadly Trickster Power
Epic Trick - DEadly Trickster Utility 26
Daily * Healing
Minor Action		Personal
Effect:  Regain all of your hit points and healing surges, automatically save against all effects on you, recover all expended encoun ter powers, or recover all expended daily powers except this one.  Once you use this power, you cannot recover it except by taking and extended rest.

Demigod			You are on the path to godhood			21st level
	Divine Spark (21st level):  Increase two ability scores of your choice by 2 each
	Divine Recovery (24th level):  The first time you are reduced to 0 hit points or fewer each day, you regain hit points equal to half your maximum hit points
	Divine Miracle (30th level):  When you have expended your last remaining encounter power, you regain the use of one encounter power of your choice.  In this way, you never run out of encounter powers.
Demigod Power
Divine Regeneration - Demigod Utility 26
You ignite the divine spark that glows within you, unleashing a wave of regenerating energy for a short time
Daily*Healing
Minor Action		Personal
Effect:  You gain regeneration equal to your highest ability score until the end of the encounter

Eternal seeker		Your destiny finds you				21st level
	Seeker of the Many Paths (21st level):  When you gain a class encounter or daily power by gaining a level, you can choose your new ower from any class.
	Learning a power doesn't necessarily equip you with all the attributes required to use the power.  For eample, a fighter who learns a wizard spell as an Eternal Seeker would not gain the ability to use implements that make casting wizard spells more effective.  Therefore, you're usually better off learning powers that are compatible with what you already know.
	Eternal Action (24th level):  When you spend an action point to take an extra action, you also gain an extra action on your next turn.  The extra action you take on your next turn doesn't benefit from any abilities (such as many paragon path features) that affect what happens when you spend an action point.
	Seeker's Lore (26th level):  You gain one 22nd level utility power from any class
	Seeking Destiny (30th level):  You gain the 24th level epic destiny feature from any other epic destiny that you qualify for.



Skills
Key Skill		Ability		Class Skill for
Acrobatics		Dex		Ranger, Rogue
	Acrobatic Stunt			Base DC 15
	Balance 			
	Escape from a Grab
	Escape from Restraints
	Reduce Falling Damage (Trained only)
Arcana			Int		Cleric, Warlock, Wizard
	Arcana Knowledge
	Monster Knowledge
	Detect Magic (Trained Only)
Athletics		Str		Figher, ranger, rogue, warlord
	Climb
	Escape from a Grab
	Jump
 	Swim
Bluff			Cha		Rogue, warlock
Diplomacy		Cha		Cleric, paladin, warlord, wizard
Dungeoneering		Wis		Ranger, rogue, wizard
	Dungeoneering Knowledge
	Forage
	Monster Knowledge
Endurance		Con		Figher, paladin, ranger, warlord
Heal			Wis		Cleric, Fighter, paladin, ranger, warlord
	First Aid
	Treat Disease
History			Int		Cleric, paladin, warlock, warlord, wizard
Insight			Wis		Cleric, paladin, rogue, warlock, wizard
Intimidate		Cha		Fighter, paladin, rogue, warlock, warlord
Nature			Wis		Ranger, wizard
	Forage
	Handle Animal
	Nature Knowledge
	Monster Knowledge
Perception		Wis		Ranger, Rogue
	Listen				Perception DC
		Battle				0
		Normal Conversation		10
		Whispers			20
		Through a door			+5
		Through a wall			+10
		More than 10 squares away	+2

	Spot or Search
		Barely hidden			10
		Well hidden			25
		More than 10 squares away	+2

	Find Tracks
		Soft ground (snow,loose dirt,mud)	15
		Hard ground (wood or stone)	25
		Rain or snow since tracks were made	+10
		Each day since trackes were made	+2
		Quarry obscured its tracks		+5
		Huge or larger creature			-5
		Group of ten or more			-5
Religion		Int		Cleric, paladin, warlock, wizard
	Religion Knowledge
	Monster Knowledge
Stealth			Dex		Ranger, Rogue
Streetwise		Cha		Figher, rogue, warlock
Thievery		Dex		Rogue, warlock
	Disable Trap
	Open Lock
	Pick Pocket
	Sleight of Hand

Skill check bonuses
When you create your character, you should determine your base skill check bonus for each skill you know.  Your base skill check bonus for a skill incluydes the following:
One-half your level
Your ability score modifier (each skill is based on one of your ability scores)
a +5 bonus if you're trained in that skill

In addition, some or all of the following factors might applyt to your base skill check bonus:
Armor check penalty, if you're wearing some kinds of armor (see Chapter 7) and making a check using Strength, Dexterity or Constitution as the key ability
Racial of feat bonuses
An item bonus from a magic item
A power bonus
Any untyped bonus that might apply

Skill Check
To make a skill check, roll 1d20 and add the following:
Your base skill check bonus with that skill
All situational modifiers that apply
Bonuses and penalties from powers affecting you

The total is your check result.




Knowledge Skill
Level of Knowledge		DC
Common				15
Expert				20
Master				25
Paragon tier			+10
Epic tier			+15


Monster Knowledge		DC
Name, type and keywords		15
Powers				20
Resistances and vulnerabilities	25
Paragon tier creature		+5
Epic tier creature		+10











Heroic Tier Feats
Action Surge (Human)
Agile Hunter (Ranger)
Alertness 
Armor of Bahamut (Divinity)
Armor Proficiency (Chainmail)
Armor Proficiency (Hide)
Armor Proficiency (Leather)
Armor Proficiency (Plate)
Armor Proficiency (Scale)
Astral Fire
Avandra's Rescue
Backstabber
Blade Opportunist
Burning Blizzard
Combat Reflexes
Corellon's Grace
Dark Fury
Defensive Mobility
Distracting Shield
Dodge Giants
Dragonborn Frenzy
Dragonborn Senses
Durable
Dwarven Weapon Training
Eladrin Soldier
Elven Precision
Enlarged Dragon Breath
Escape Artist
Expanded Spellbook
Far Shot
Far Throw
Fast Runner
Ferocious Rebuke
Group Insight
Halfling Agility
Harmony of Erathis
Healling Hands
Hellfire Blood
Human Perserverance
Improved Dark On's Belssing   
Improved Fate of the Void
Improved Initiative
Improved Misty Step
Inspired Recovery
Ioun's Poise
Jack of all Trades
Kord's Favor
Lethal Hunter
Light Step
Linguist
Long Jumper
Lost in the Crowd
Melora's Tide
Moradin's Resolve
Mounted Combat
Nimble Blade
Pelor's Radiance
Potent Challenge
Power Attack
Powerful Charge
Precise Hunter
Press the Advantage
Quick Draw
Raging Storm
Raven Queen's Blessing
Ritual Caster
Sehanine's Reversal
Shield Proficiency (Heavy)
Shield Proficiency (Light)
Shield Push
Skill Focus
Skill Training
Sure Climber
Surprise Knockdown
Tactical Assault
Toughness
Two-Weapon Defense
Two-Weapon Fighting
Weapon Focus
Weapon Proficiency
Wintertouched

Paragon Tier Feats
Action Recovery
Agile Athlete
Arcane Reach
Armor Specialization (Chainmail)
Armor Specialization (Hide)
Armor Specialization (Plate)
Armor Specialization (Scale)
Back to the Wall
Blood Thirst
Combat Anticipation
Combat Commander
Danger Sense
Deadly Axe
Defensive Advantage
Devastating Critical
Distant Shot
Dwarven Durability
Empowered Dragon Breath
Evasion
Feywild Protection 
Fiery Rebuke
Fleet-Footed
Great Fortitude
Hammer Rhythm
Heavy Blade Opportunity
Improved SEcond Wind
Inescapable Force
Iron Will
Lasting Frost
Light Blade Precision
Lightning Arc
Lightning Reflexes
Mettle
Point-Blank Shot
Polearm Gamble
Psychic Lock
Resounding Thunder
Running Shot
Scimitar Dance
Second Implement
Secret Stride
Seize the Moment
Shield Specialization
Sly Hunter
Solid Sound
Spear Push
Spell Focus
Steady Shooter
Sweeping Flail
Twofold Curse
Uncanny Dodge
Underfoot



Epic Tier Feats
Arcane Mastery 
Axe Mastery
Blind-Fight
Bludgeon Mastery
Epic Resurgence
Flail Mastery
Flanking Maneuver
Font of Radiance
Heavy Blade Mastery
Irrestible Flame
Light Blade Mastery
Pick Mastery
Spear Mastery
Spell Accuracy
Triumphant Attack
Two-Weapon Flurry
Unfettered Stride


Multiclass Feats
Initiate of the Faith
Student of the Sword
Soldier of the Faith
Warrior of the Wild
Sneak of Shadows
Pact Initiate
Student of Battle
Arcane Initiate
Novice Power
Acolyte Power
Adept Power
JXK OD Ll ReSWA
kOES'A dcoe
LwrhL hUNRWE
lIFHR aRWP
A
A
A
A
lINFUI










# @racialfeatures=(make this the seventh and eighth element in the race array, the first 6 would be up/down stat values for each face
#
@lvlrange=("1-10: Heroic","11-20: Paragon","21-30: Epic"); 
$level=[
[0,"1st","see race","class features;racial traits;gain 1 feat;train starting skills;gain 2 at-will attack powers;gain 1 encounter attack power;gain 1 daily attack power","1**",2,1,1,0],
[1000,"2nd","-","gain 1 utility power;gain 1 feat",2,2,1,1,1],
[2250,"3rd","-"."gain 1 encounter attack power",2,2,2,1,1],
[3750,"4th","+1 to two","gain 1 feat",3,2,2,1,1],
[5500,"5th","-","gain 1 daily attack power",3,2,2,2,1],
[7500,"6th","-","gain 1 utility power,gain 1 feat",4,2,2,2,2],
[10000,"7th","-","gain 1 encounter attack power",4,2,3,2,2],
[13000,"8th","+1 to two","gain 1 feat",5,2,3,2,2],
[16500,"9th","-","gain 1 daily attack power",5,2,3,3,2],
[20500,"10th","-","gain 1 utility power, gain 1 feat",6,2,3,3,3],
[26000,"11th","+1 to all","paragon path features; gain 1 paragon path encounter attack power; gain 1 feat",7,2,4,3,3],
[32000,"12th","-","gain 1 paragon path utility power; gain 1 feat",8,2,4,3,4],
[39000,"13th","-","replace 1 encounter attack power,8,2,"4*",3,4],
[47000,"14th","+1 to two","gain 1 feat",9,2,4,3,4],
[57000,"15th","-","replace 1 daily attack power",9,2,4,"3*",4],
[69000,"16th","-","paragon path feature;gain 1 utility power;gain 1 feat",10,2,4,3,5],
[83000,"17th","-","replace 1 encounter attack power",10,2,"4*",3,5],
[99000,"18th","+1 to two","gain 1 feat",11,2,4,3,5],
[119000,"19th","-","replace 1 daily attack power",11,2,4,"3*",5],
[143000,"20th","-","gain 1 paragon path daily attack power; gain 1 feat",12,2,4,4,5],
[175000,"21st","+1 to all","-","epic destiny feature; gain 1 feat",13,2,4,4,5],
[210000,"22nd","-","gain 1 utiity power;gain 1 feat",14,2,4,4,6],
[255000,"23rd","-","replace 1 encounter attack power",14,2,"4*",4,6],
[310000,"24th","+1 to two","epic destiny feature;gain 1 feat",15,2,4,4,6],
[375000,"25th","-","replace 1 daily attack power",15,2,4,"4*",6],
[450000,"26th","-","gain 1 epic destiny utility power;gain 1 feat",16,2,4,4,7],
[550000,"27th","-","replace 1 encounter attack power",16,2,"4*",4,7],
[675000,"28th","+1 to two","gain 1 feat",17,2,4,4,7],
[825000,"29th","-","replace 1 daily attack power",17,2,4,"4*",7], 
[1000000,"30th","-","epic destiny feature;gain 1 feat",18,2,4,4,7]
];
#  *  At these levels you replace a known power with a new poewr of your new level
#  ** Humans gain one additional feat at 1st level.  Some classes grant additional feats as well

@monstrace("Storm Giant", "Goliath",  "Vampire", "Raksasha", "Minotaur", "Half-Orc", "Leprechaun", "Doppleganger", "Lycanthrope", "Hill Giant","Troll","Goblin,"Ogre","Ogre-Magi","Troglodyte","Ghost","Illithid","Bugbear","Efreeti","Archon","Elemental","Angel","Devil","Demon","Sahuagin","Lich","Dragon"); 
@familiar=("Bat","Book Imp","Bound Demon","Cat","Crafter Homunculus","Dragonling","Falcon","Owl","Rat","Raven","Serpent","Spider"); 

@gender=("Male","Female"); 
@hair=("Black","Brown","Blond","Red","Grey","White","None");
@hairstyle=("Straight","Curly","Wavy");
@hairlength("Short","Medium","Long","None/Bald","Very Long");
@eyecolor=("Black","Brown","Grey","Hazel","Blue","Gold","Red");
#height=("< 3'","3' to 4'","4' to 5'","5' to 6'","6' to 7'","7' to 8'","8' to 9'","9' to 10'","10' to 11'","11' to 12'",">12'");
@height=("short","normal","tall");
@weight=("underweight","normal","overweight");
@favcolor=("Red","Orange","Yellow","Green","Blue","Indigo","Violet","Brown","Black","White");
@favseason=("Winter","Summer","Spring","Fall");
@favfood=("Beef","Pork","Chicken","Turkey","Lamb","Venison","Rabbit","Vegan");
@peeve=("stupidity","arrogance","sloth"); 
@favdrink=("Ale","Beer","Wine","Whiskey");
@secskill=("Armorer","Bowyer/Fletcher","Farmer/Gardener","Fisher (netting)","Forester","Guide","Gambler","Hunter / Fisher (Hook & Line)","Husbandman (Animal Husbandry","Jeweler / Lapidary","Leather Worker / Tanner", "Painter","architect","Mason / Carpenter","Miner","Navigator (fresh and salt water)","Sailor","Shipwright","Tailor / Weaver", "Teamster / Freighter","Trader / Barterer","Trapper / Furrier","Woodworker / Cabinet Maker","Brewer","Herald / Public Speaker","Comedian / Jester","Cook / Chef", "Writer / Scribe", "No skill of measureable worth");
@alignment=("Lawful Good","Lawful Neutral","Lawful Evil","Neutral Evil","True Neutral","Chaotic Evil","Chaotic Neutral","Chaotic Good","Neutral Good");
@wealth("none","scant","average","above average","exceptional","super abundant");
@appearanceage=("young","youthful","mature","middle-aged","old","ancient");
@appearancegen=("dirty","clean","unkempt","immaculate","rough","rugged","foppish","regal","royal","non-descript","imposing","intimidating");
@sanity=("very stable","normal","neurotic","unstable","psychotic","insane","maniacial");
@traits=("optomist","pessimist","hedonist","altruist","helpful/kindly","careless","capricious","mischievous","sober","drunk","curious/inquisitive","moody","trusting","suspicious/cautious","precise/exacting","perceptive","opinionated/contrary","violent/warlike","studious","foul/barbaric","cruel/callous","practical joker/prankster","servile/obsequious","fanatical/obsessive","malevolent","loquacious","sadist","masochist");
@personalitymain=("Average","Extroverted","Introverted");
@personalityaverage=("modest","egoist/arrogant","friendly","aloof","hostile","well-spoken","diplomatic","abrasive");
@personalityextroverted=("forceful","overbearing","friendly","blustering","antagonistic","rude","rash","diplomatic");
@personalityintroverted=("retiring","taciturn","friendly","aloof","hostile","rude","courteous","solitary","secretive","regal","royal");
@disposition=("cheerful","morose","compassionate/sensitive","unfeeling/insensitive","humble","proud/haughty","even-tempered","hot-tempered","easy going","harsh");
@intellect=("dull","average","active","dreaming","ponderous","anti-intellectual","scheming","brilliant");
@nature=("soft-hearted","forgiving","hard-hearted","unforgiving","jealous","vengeful","vindictive","punisher");
@materialism=("aesthetic","intellectualist","average","covetous","greedy","avaricious");
@honesty=("scrupulous","very honorable","truthful","average","liar","deceitful");
@bravery=("normal","foolhardy","brave","fearless","cowardly","craven");
@energy=("slothful,lazy,normal,energetic,driven"); 
@thrift=("miserly,mean,thrifty,average,spendthrift,wastrel");
@morals=("aesthetic,virtuous,normal,lusty,lustful,immoral,amoral,perverted,sadistic,depraved"); 
@piety=("saintly,martyr/zealot,pious,reverant,average,impious,irreverant,iconoclastic,irreligous");
@interest=("religion,legends,history,nature,horticulture,husbandry,exotic animals,hunting,fishing,handicrafts,athletics,politics,wine & spirits,foods & preparations,gambling/games,drugs,collector (see collections), community service,altruism,clocks,horses,pets,puzzles,none,medical,architecture,fighting,weapons,history,sailing/boating,research,sewing,landscaping,decorating,geography/maps,swimming,climbing");
@collections=("Weapons-Knives and daggers,Weapons-Swords,Weapons-Exotic,shields,armor,books & scrolls,mineral & gems,ornaments & jewelry,coins/tokens,trophies & skins,porcelain,china, crystal,artwork-paintings, artwork-tapestries,artwork-statues,artwork-carvings");
@equiparmor=("");
@equipweapons=("");
#@equipslot(1....xxx); 









do 
	{
	$random = int( rand(11)) + 12;

		print "$random\n";
		$passes++;
	
	}
while ($passes < 6); 



 


