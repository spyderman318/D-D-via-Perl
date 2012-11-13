#!/usr/bin/perl
#qdnpcpty.pl
#Generates a NPC Party of size 4-20
#First item $members[0] will be party name
$members = int( rand(11)) + 5;
#print "$members\n";
#Generates a party name and character names
#@chars = `/Perl/bin/perl lcflx.pl -$members egyptian.txt`;
@chars = `perl lcflx.pl -$members egyptian.txt`;
chomp @chars; 
print "Party Name: \u@chars[0]\n";
#
#Minimum of (1) for each role
#(1) leader (cleric or warlord)
#(1) defender(fighter or paladin)
#(1) striker(ranger, rogue or warlock)
#(1) controller(wizard)
#
@role=("controller","defender","leader","striker");
@controller=("wizard");
@defender=("fighter","paladin");
@leader=("cleric","warlord");
@striker=("ranger","rogue","warlock");
#
#
#Add in Bard, Druid, Sorcerer, Swordmage, 
##@arcaneclass=("Bard","Sorcerer","SwordMage","Witch","Warlock","Wizard");
##@divineclass=("Cleric","Druid","Paladin");
@race=("Angel","Centaur","Dark Elf","Doppleganger","Dragonborn","Dwarf","Eladrin","Elf","Ethereal Doppleganger","Half Elf","Halfling","Human","Leprechaun","Minotaur","Raksasha","Storm Giant","Tiefling","Troll","Werewolf (Lycanthrope)","Vampire"); 
#
$charcount=1;
#

@al=("G","LG","E","CE","N");
@diety_g=("Avandra","Pelor");
@diety_lg=("Bahamut","Moradin");
@diety_ua=("Corellon","Erathis","Ioun","Kord","Melora","The Raven Queen", "Sehanine");
@diety_e=("Asmodeus","Bane","Tiamat","Torog","Vecna","Zehir");
@diety_ce=("Gruumsh","Lolth");
@languages=("Common","Deep Speech","Draconic","Dwarven","Elven","Giant","Goblin","Primordial","Supernal","Abyssal");
@gender=("Male","Female");
@hairlength=("None/Bald","Short","Medium","Long","Very Long");
@hairstyle=("Non-descript","Unkempt","Straight","Curly","Wavy"," ");
@hair=("Black","Brown","Blond","Red","Grey","White"," ");


@eyecolor=("Black","Brown","Grey","Hazel","Blue","Gold","Red");
@height=("< 3'","3' to 4'","4' to 5'","5' to 6'","6' to 7'","7' to 8'","8' to 9'","9' to 10'","10' to 11'","11' to 12'",">12'");
#@height=("short","normal","tall");
@weight=("underweight","normal","overweight");
@favcolor=("Red","Orange","Yellow","Green","Blue","Indigo","Violet","Brown","Black","White");
@favseason=("Winter","Summer","Spring","Fall");
@favfood=("Beef","Pork","Chicken","Turkey","Lamb","Venison","Rabbit","Vegan");
@peeve=("stupidity","arrogance","sloth"); 
@favdrink=("Ale","Beer","Wine","Whiskey");
$strength=0;
$intelligence=0;
$wisdom=0;
$dexterity=0;
$constitution=0;
$charisma=0;





do 
	{
	$passes=0;
	$role1=0;
	$role2=0;
	$role3=0;
	$role4=0;
	$roleroll = 0;
	$role2pick = 0;


	print " \n";

	$levels[$charcount] = int( rand(20)) + 7;
	$roleroll=int( rand(4)) + 0;
	if ($roleroll == 0)
	{       $role1++;
	        $class[$charcount]="Wizard";}
	elsif ($roleroll == 1)
	{       $role2++;
		$role2pick = int(rand(2)) + 1;
		if ($role2pick == 1)
		{
			$class[$charcount]="Fighter";
		}
		elsif ($role2pick == 2)
		{
			$class[$charcount]="Paladin"
		}
		else
		{	print "Error in role2pick ftr/pal";}
	}
	elsif ($roleroll == 2)
	{       $role3++;
		$role3pick = int(rand(2)) + 1;
		if ($role3pick == 1)
		{
		        $class[$charcount]="Cleric";
		}
		elsif ($role3pick == 2)
		{
		        $class[$charcount]="Warlord"
		}
		else
		{	print "Error";}
	}

	elsif ($roleroll == 3)
	{       $role4++;
		$role4pick = int(rand(3)) + 1;
		if ($role4pick == 1)
		{
			$rangertype = int(rand(2)) + 1;
			if ($rangertype == 1)
				{
				$class[$charcount]="Ranger:  2-Bladed";
				}
			elsif ($rangertype == 2)
				{
				$class[$charcount]="Ranger:  Archer";
			}
			else
			{	print "Error";}
		}
		elsif ($role4pick == 2)
		{
		        $class[$charcount]="Rogue";
		}
		elsif ($role4pick == 3)
		{
			$class[$charcount]="Warlock";
		}
		else
		{	print "Error";}
	}
	else
		{	print "Error in roleroll";}
	chomp $class[$charcount];
	$racepick = int(rand(20))+0;
	@charclass[$charcount]=@race[$racepick-1];
	chomp @charclass;

	if ($alpick == 0)
	{	$dietypick = int(rand(2))+1;
		if ($dietypick == 1)
		{	$diety="Avandra";}
		elsif ($dietypick == 2)
		{	$diety="Pelor";}
		else
		{	print "Error";}
	}
	elsif ($alpick == 1)
	{
		$dietypick = int(rand(2))+1;
                if ($dietypick == 1)
                {       $diety="Bahamut";}
		elsif ($dietypick == 2)
		{	$diety="Moradin";}
                else
                {       print "Error in alpick2";}
	}
        elsif ($alpick == 2)
        {
                $dietypick=int(rand(6))+1;
                if ($dietypick == 1)
                {       $diety="Asmodeus";}
                elsif ($dietypick == 2)
                {       $diety="Bane";}
                elsif ($dietypick == 3)
                {       $diety="Tiamat";}
                elsif ($dietypick == 4)
                {       $diety="Torog";}
                elsif ($dietypick == 5)
                {       $diety="Vecna";}
                elsif ($dietypick == 6)
                {       $diety="Zehir";}
                else
                {       print "Error in alpick 3 - dietypick";}
        }
        elsif ($alpick == 3)
        {
                $dietypick=int(rand(2))+1;
                if ($dietypick == 1)
                {       $diety="Gruumsh";}
                elsif ($dietypick == 2)
                {       $diety="Lolth";}
                else
                {
                        print "Error in alpick5 - dietypick";
                }
        }
	elsif ($alpick == 4)
	{	$dietypick=int(rand(7))+1;
                if ($dietypick == 1)
                {       $diety="Corellon";}
                elsif ($dietypick == 2)
                {       $diety="Erathis";}
                elsif ($dietypick == 3)
                {       $diety="Ioun";}
                elsif ($dietypick == 4)
                {       $diety="Kord";}
                elsif ($dietypick == 5)
                {       $diety="Melora";}
                elsif ($dietypick == 6)
                {       $diety="The Raven Queen";}
                elsif ($dietypick == 7)
                {       $diety="Sehanine";}
		else
		{	print "Error in alpick ==5 ";}
	}
	else
	{
		print "Error after alpick after 5";

	}
	$gndr=int(rand(2))+1;
	if ($gndr == 1)
	{	$gndr="Male";}
	elsif ($gndr == 2)
	{	$gndr="Female";}
	else
	{	print "Gender Error";}
	
	$hairlroll=int(rand(4))+0;

	if ($hairlroll == 0)
	{	
		$hairsroll = 5;
		$hairroll = 6;
	}
	else
	{
		$hairsroll=int(rand(4))+0;
		$hairroll=int(rand(5))+0;
	}

	$eyecroll=int(rand(6))+0;
	
	print "Name: \u$chars[$charcount] Level: $levels[$charcount] Class: $class[$charcount]  Race: $charclass[$charcount]\n" ;
	print "AL:\u$al[$alpick] Diety:$diety  Gender:$gndr  Hair:$hairlength[$hairlroll] $hairstyle[$hairsroll] $hair[$hairroll] Eyes:$eyecolor[$eyecroll]\n";
	
# ----------------------------------------------------

	$charcount++;
	$passes=1;	
	
	do 
	{
        	$random = int( rand(11)) + 12;
		$stat=0;
		$stat = $random;
		chomp $stat;
		chomp($random);
		if ($random == 1)
			{$random = "$random(-5)";}
		elsif ($random == 2 | $random ==3 )
			{$random = "$random(-4)";}
		elsif ($random == 4 | $random == 5)
			{$random = "$random(-3)";}
		elsif ($random == 6 | $random == 7)
			{$random = "$random(-2)";} 
		elsif ($random == 8 | $random == 9)
			{$random = "$random(-1)";}
		elsif ($random == 10 | $random == 11)
			{$random = "$random(0)";}
		elsif ($random == 12 | $random == 13)
			{$random = "$random(+1)";}
		elsif ($random == 14 | $random == 15)
			{$random = "$random(+2)";}
		elsif ($random == 16 | $random == 17)
			{$random = "$random(+3)";}
		elsif ($random == 18 | $random == 19)
			{$random = "$random(+4)";}
		elsif ($random == 20 | $random == 21)
			{$random = "$random(+5)";}
		elsif ($random == 22 | $random == 23)
			{$random = "$random(+6)";}
		elsif ($random == 24 | $random == 25)
			{$random = "$random(+7)";}
		elsif ($random == 26 | $random == 27)
			{$random = "$random(+8)";}
        	elsif ($random == 28 | $random == 29)
        	        {$random = "$random(+9)";}
        	elsif ($random == 30 | $random == 31)
        	        {$random = "$random(+10)";}
        	elsif ($random == 32 | $random == 33)
        	        {$random = "$random(+11)";}
		else
			{last}

		chomp($random);

		if ($passes == 1)
			{
			$strength = $stat;
			print "Str: $random ";
			$random = 0;
			}
		elsif ($passes == 2)
			{
			$intelligence=$stat;
			print "Int: $random ";
			$random=0;
			}
		elsif ($passes == 3)
			{
			$wisdom = $stat;
			print "Wis: $random ";
			$random=0;
			}
		elsif ($passes == 4)
			{
			$dexterity=$stat;
			print "Dex: $random ";
			$random=0;
			}
		elsif ($passes == 5)
			{
			$constitution=$stat;
			print "Con: $random ";
			$random=0;
			}
		elsif ($passes == 6)
			{
			$charisma = $stat;
			print "Cha: $random ";
			$random=0;
			}
		else 
			{
			print "ERROR";
			}

		$passes++;
		}
	while ($passes < 7); 


        if ($racepick - 1 == 4)
        {       
		print "\n";		
		print "Dragonborn Racial stat mods:  +2 Str +2 Cha \n";
		print "Dragonborn Racial Skill mods: +2 History +2 Intimidation \n";
		print "Dragonborn Fury\n"; 
		print "Draconic Heritage\n"; 
		print "Dragon Breath\n";
		$strength=$strength+2;
		$charisma=$charisma+2;
		print "Modified stats \n";


		if ($strength == 1)
			{$stmod = "(-5)";}
		elsif ($strength == 2 | $strength == 3)
			{$stmod = "(-4)";}
		elsif ($strength == 4 | $strength == 5)
			{$stmod = "(-3)";}
		elsif ($strength == 6 | $strength == 7)
			{$stmod = "(-2)";}
		elsif ($strength == 8 | $strength == 9)
			{$stmod = "(-1)";}
		elsif ($strength == 10 | $strength == 11)
			{$stmod = "(0)";}
		elsif ($strength == 12 | $strength == 13)
			{$stmod = "(+1)";}
		elsif ($strength == 14 | $strength == 15)
			{$stmod = "(+2)";}
		elsif ($strength == 16 | $strength == 17)
			{$stmod = "(+3)";}
		elsif ($strength == 18 | $strength == 19)
			{$stmod = "(+4)";}
		elsif ($strength == 20 | $strength == 21)
			{$stmod = "(+5)";}
		elsif ($strength == 22 | $strength == 23)
			{$stmod = "(+6)";}
		elsif ($strength == 24 | $strength == 25)
			{$stmod = "(+7)";}
		elsif ($strength == 26 | $strength == 27)
			{$stmod = "(+8)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+9)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+10)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+11)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}



		if ($intelligence == 1)
			{$inmod = "(-5)";}
		elsif ($intelligence == 2 | $intelligence == 3)
			{$inmod = "(-4)";}
		elsif ($intelligence == 4 | $intelligence == 5)
			{$inmod = "(-3)";}
		elsif ($intelligence == 6 | $intelligence == 7)
			{$inmod = "(-2)";}
		elsif ($intelligence == 8 | $intelligence == 9)
			{$inmod = "(-1)";}
		elsif ($intelligence == 10 | $intelligence == 11)
			{$inmod = "(0)";}
		elsif ($intelligence == 12 | $intelligence == 13)
			{$inmod = "(+1)";}
		elsif ($intelligence == 14 | $intelligence == 15)
			{$inmod = "(+2)";}
		elsif ($intelligence == 16 | $intelligence == 17)
			{$inmod = "(+3)";}
		elsif ($intelligence == 18 | $intelligence == 19)
			{$inmod = "(+4)";}
		elsif ($intelligence == 20 | $intelligence == 21)
			{$inmod = "(+5)";}
		elsif ($intelligence == 22 | $intelligence == 23)
			{$inmod = "(+6)";}
		elsif ($intelligence == 24 | $intelligence == 25)
			{$inmod = "(+7)";}
		elsif ($intelligence == 26 | $intelligence == 27)
			{$inmod = "(+8)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+9)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+10)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+11)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}



		if ($widsom == 1)
			{$wimod = "(-5)";}
		elsif ($wisdom == 2 | $wisdom == 3)
			{$wimod = "(-4)";}
		elsif ($wisdom == 4 | $wisdom == 5)
			{$wimod = "(-3)";}
		elsif ($wisdom == 6 | $wisdom == 7)
			{$wimod = "(-2)";}
		elsif ($wisdom == 8 | $wisdom == 9)
			{$wimod = "(-1)";}
		elsif ($wisdom == 10 | $wisdom == 11)
			{$wimod = "(0)";}
		elsif ($wisdom == 12 | $wisdom == 13)
			{$wimod = "(+1)";}
		elsif ($wisdom == 14 | $wisdom == 15)
			{$wimod = "(+2)";}
		elsif ($wisdom == 16 | $wisdom == 17)
			{$wimod = "(+3)";}
		elsif ($wisdom == 18 | $wisdom == 19)
			{$wimod = "(+4)";}
		elsif ($wisdom == 20 | $wisdom == 21)
			{$wimod = "(+5)";}
		elsif ($wisdom == 22 | $wisdom == 23)
			{$wimod = "(+6)";}
		elsif ($wisdom == 24 | $wisdom == 25)
			{$wimod = "(+7)";}
		elsif ($wisdom == 26 | $wisdom == 27)
			{$wimod = "(+8)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+9)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+10)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+11)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($dexterity == 1)
			{$dxmod = "(-5)";}
		elsif ($dexterity == 2 | $dexterity == 3)
			{$dxmod = "(-4)";}
		elsif ($dexterity == 4 | $dexterity == 5)
			{$dxmod = "(-3)";}
		elsif ($dexterity == 6 | $dexterity == 7)
			{$dxmod = "(-2)";}
		elsif ($dexterity == 8 | $dexterity == 9)
			{$dxmod = "(-1)";}
		elsif ($dexterity == 10 | $dexterity == 11)
			{$dxmod = "(0)";}
		elsif ($dexterity == 12 | $dexterity == 13)
			{$dxmod = "(+1)";}
		elsif ($dexterity == 14 | $dexterity == 15)
			{$dxmod = "(+2)";}
		elsif ($dexterity == 16 | $dexterity == 17)
			{$dxmod = "(+3)";}
		elsif ($dexterity == 18 | $dexterity == 19)
			{$dxmod = "(+4)";}
		elsif ($dexterity == 20 | $dexterity == 21)
			{$dxmod = "(+5)";}
		elsif ($dexterity == 22 | $dexterity == 23)
			{$dxmod = "(+6)";}
		elsif ($dexterity == 24 | $dexterity == 25)
			{$dxmod = "(+7)";}
		elsif ($dexterity == 26 | $dexterity == 27)
			{$dxmod = "(+8)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+9)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+10)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+11)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($constitution == 1)
			{$comod = "(-5)";}
		elsif ($constitution == 2 | $constitution == 3)
			{$comod = "(-4)";}
		elsif ($constitution == 4 | $constitution == 5)
			{$comod = "(-3)";}
		elsif ($constitution == 6 | $constitution == 7)
			{$comod = "(-2)";}
		elsif ($constitution == 8 | $constitution == 9)
			{$comod = "(-1)";}
		elsif ($constitution == 10 | $constitution == 11)
			{$comod = "(0)";}
		elsif ($constitution == 12 | $constitution == 13)
			{$comod = "(+1)";}
		elsif ($constitution == 14 | $constitution == 15)
			{$comod = "(+2)";}
		elsif ($constitution == 16 | $constitution == 17)
			{$comod = "(+3)";}
		elsif ($constitution == 18 | $constitution == 19)
			{$comod = "(+4)";}
		elsif ($constitution == 20 | $constitution == 21)
			{$comod = "(+5)";}
		elsif ($constitution == 22 | $constitution == 23)
			{$comod = "(+6)";}
		elsif ($constitution == 24 | $constitution == 25)
			{$comod = "(+7)";}
		elsif ($constitution == 26 | $constitution == 27)
			{$comod = "(+8)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+9)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+10)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+11)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+12)";}
		else
			{$dummy = $dummy + 1;}


		if ($charisma == 1)
			{$chmod = "(-5)";}
		elsif ($charisma == 2 | $charisma == 3)
			{$chmod = "(-4)";}
		elsif ($charisma == 4 | $charisma == 5)
			{$chmod = "(-3)";}
		elsif ($charisma == 6 | $charisma == 7)
			{$chmod = "(-2)";}
		elsif ($charisma == 8 | $charisma == 9)
			{$chmod = "(-1)";}
		elsif ($charisma == 10 | $charisma == 11)
			{$chmod = "(0)";}
		elsif ($charisma == 12 | $charisma == 13)
			{$chmod = "(+1)";}
		elsif ($charisma == 14 | $charisma == 15)
			{$chmod = "(+2)";}
		elsif ($charisma == 16 | $charisma == 17)
			{$chmod = "(+3)";}
		elsif ($charisma == 18 | $charisma == 19)
			{$chmod = "(+4)";}
		elsif ($charisma == 20 | $charisma == 21)
			{$chmod = "(+5)";}
		elsif ($charisma == 22 | $charisma == 23)
			{$chmod = "(+6)";}
		elsif ($charisma == 24 | $charisma == 25)
			{$chmod = "(+7)";}
		elsif ($charisma == 26 | $charisma == 27)
			{$chmod = "(+8)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+9)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+10)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+11)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

# --------------------------------------------------------------------------

		print "ST: $strength $stmod  IN: $intelligence $inmod WI: $wisdom $wimod DX: $dexterity $dxmod CO: $constitution $comod CH: $charisma $chmod\n";
	}
        elsif ($racepick - 1 == 5)
        {       
		print "\n";	
		print "Dwarf Racial mods:  +2 Wis +2 Con \n";
		print "Dwarven Racial Skill mods:+2 Dungeoneering +2 Endurance\n";
		print "Cast Iron Stomach\n"; 
		print "Dwarven Resiliance\n"; 
		print "Dwarven Weapon Proficiency\n"; 
		print "Encumbered Speed\n"; 
		print "Stand your ground\n";
		$wisdom=$wisdom+2;
		$constitution = $constitution +2;
		print "Modified stats \n";


		if ($strength == 1)
			{$stmod = "(-5)";}
		elsif ($strength == 2 | $strength == 3)
			{$stmod = "(-4)";}
		elsif ($strength == 4 | $strength == 5)
			{$stmod = "(-3)";}
		elsif ($strength == 6 | $strength == 7)
			{$stmod = "(-2)";}
		elsif ($strength == 8 | $strength == 9)
			{$stmod = "(-1)";}
		elsif ($strength == 10 | $strength == 11)
			{$stmod = "(0)";}
		elsif ($strength == 12 | $strength == 13)
			{$stmod = "(+1)";}
		elsif ($strength == 14 | $strength == 15)
			{$stmod = "(+2)";}
		elsif ($strength == 16 | $strength == 17)
			{$stmod = "(+3)";}
		elsif ($strength == 18 | $strength == 19)
			{$stmod = "(+4)";}
		elsif ($strength == 20 | $strength == 21)
			{$stmod = "(+5)";}
		elsif ($strength == 22 | $strength == 23)
			{$stmod = "(+6)";}
		elsif ($strength == 24 | $strength == 25)
			{$stmod = "(+7)";}
		elsif ($strength == 26 | $strength == 27)
			{$stmod = "(+8)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+9)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+10)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+11)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($intelligence == 1)
			{$inmod = "(-5)";}
		elsif ($intelligence == 2 | $intelligence == 3)
			{$inmod = "(-4)";}
		elsif ($intelligence == 4 | $intelligence == 5)
			{$inmod = "(-3)";}
		elsif ($intelligence == 6 | $intelligence == 7)
			{$inmod = "(-2)";}
		elsif ($intelligence == 8 | $intelligence == 9)
			{$inmod = "(-1)";}
		elsif ($intelligence == 10 | $intelligence == 11)
			{$inmod = "(0)";}
		elsif ($intelligence == 12 | $intelligence == 13)
			{$inmod = "(+1)";}
		elsif ($intelligence == 14 | $intelligence == 15)
			{$inmod = "(+2)";}
		elsif ($intelligence == 16 | $intelligence == 17)
			{$inmod = "(+3)";}
		elsif ($intelligence == 18 | $intelligence == 19)
			{$inmod = "(+4)";}
		elsif ($intelligence == 20 | $intelligence == 21)
			{$inmod = "(+5)";}
		elsif ($intelligence == 22 | $intelligence == 23)
			{$inmod = "(+6)";}
		elsif ($intelligence == 24 | $intelligence == 25)
			{$inmod = "(+7)";}
		elsif ($intelligence == 26 | $intelligence == 27)
			{$inmod = "(+8)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+9)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+10)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+11)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($widsom == 1)
			{$wimod = "(-5)";}
		elsif ($wisdom == 2 | $wisdom == 3)
			{$wimod = "(-4)";}
		elsif ($wisdom == 4 | $wisdom == 5)
			{$wimod = "(-3)";}
		elsif ($wisdom == 6 | $wisdom == 7)
			{$wimod = "(-2)";}
		elsif ($wisdom == 8 | $wisdom == 9)
			{$wimod = "(-1)";}
		elsif ($wisdom == 10 | $wisdom == 11)
			{$wimod = "(0)";}
		elsif ($wisdom == 12 | $wisdom == 13)
			{$wimod = "(+1)";}
		elsif ($wisdom == 14 | $wisdom == 15)
			{$wimod = "(+2)";}
		elsif ($wisdom == 16 | $wisdom == 17)
			{$wimod = "(+3)";}
		elsif ($wisdom == 18 | $wisdom == 19)
			{$wimod = "(+4)";}
		elsif ($wisdom == 20 | $wisdom == 21)
			{$wimod = "(+5)";}
		elsif ($wisdom == 22 | $wisdom == 23)
			{$wimod = "(+6)";}
		elsif ($wisdom == 24 | $wisdom == 25)
			{$wimod = "(+7)";}
		elsif ($wisdom == 26 | $wisdom == 27)
			{$wimod = "(+8)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+9)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+10)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+11)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($dexterity == 1)
			{$dxmod = "(-5)";}
		elsif ($dexterity == 2 | $dexterity == 3)
			{$dxmod = "(-4)";}
		elsif ($dexterity == 4 | $dexterity == 5)
			{$dxmod = "(-3)";}
		elsif ($dexterity == 6 | $dexterity == 7)
			{$dxmod = "(-2)";}
		elsif ($dexterity == 8 | $dexterity == 9)
			{$dxmod = "(-1)";}
		elsif ($dexterity == 10 | $dexterity == 11)
			{$dxmod = "(0)";}
		elsif ($dexterity == 12 | $dexterity == 13)
			{$dxmod = "(+1)";}
		elsif ($dexterity == 14 | $dexterity == 15)
			{$dxmod = "(+2)";}
		elsif ($dexterity == 16 | $dexterity == 17)
			{$dxmod = "(+3)";}
		elsif ($dexterity == 18 | $dexterity == 19)
			{$dxmod = "(+4)";}
		elsif ($dexterity == 20 | $dexterity == 21)
			{$dxmod = "(+5)";}
		elsif ($dexterity == 22 | $dexterity == 23)
			{$dxmod = "(+6)";}
		elsif ($dexterity == 24 | $dexterity == 25)
			{$dxmod = "(+7)";}
		elsif ($dexterity == 26 | $dexterity == 27)
			{$dxmod = "(+8)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+9)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+10)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+11)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($constitution == 1)
			{$comod = "(-5)";}
		elsif ($constitution == 2 | $constitution == 3)
			{$comod = "(-4)";}
		elsif ($constitution == 4 | $constitution == 5)
			{$comod = "(-3)";}
		elsif ($constitution == 6 | $constitution == 7)
			{$comod = "(-2)";}
		elsif ($constitution == 8 | $constitution == 9)
			{$comod = "(-1)";}
		elsif ($constitution == 10 | $constitution == 11)
			{$comod = "(0)";}
		elsif ($constitution == 12 | $constitution == 13)
			{$comod = "(+1)";}
		elsif ($constitution == 14 | $constitution == 15)
			{$comod = "(+2)";}
		elsif ($constitution == 16 | $constitution == 17)
			{$comod = "(+3)";}
		elsif ($constitution == 18 | $constitution == 19)
			{$comod = "(+4)";}
		elsif ($constitution == 20 | $constitution == 21)
			{$comod = "(+5)";}
		elsif ($constitution == 22 | $constitution == 23)
			{$comod = "(+6)";}
		elsif ($constitution == 24 | $constitution == 25)
			{$comod = "(+7)";}
		elsif ($constitution == 26 | $constitution == 27)
			{$comod = "(+8)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+9)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+10)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+11)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($charisma == 1)
			{$chmod = "(-5)";}
		elsif ($charisma == 2 | $charisma == 3)
			{$chmod = "(-4)";}
		elsif ($charisma == 4 | $charisma == 5)
			{$chmod = "(-3)";}
		elsif ($charisma == 6 | $charisma == 7)
			{$chmod = "(-2)";}
		elsif ($charisma == 8 | $charisma == 9)
			{$chmod = "(-1)";}
		elsif ($charisma == 10 | $charisma == 11)
			{$chmod = "(0)";}
		elsif ($charisma == 12 | $charisma == 13)
			{$chmod = "(+1)";}
		elsif ($charisma == 14 | $charisma == 15)
			{$chmod = "(+2)";}
		elsif ($charisma == 16 | $charisma == 17)
			{$chmod = "(+3)";}
		elsif ($charisma == 18 | $charisma == 19)
			{$chmod = "(+4)";}
		elsif ($charisma == 20 | $charisma == 21)
			{$chmod = "(+5)";}
		elsif ($charisma == 22 | $charisma == 23)
			{$chmod = "(+6)";}
		elsif ($charisma == 24 | $charisma == 25)
			{$chmod = "(+7)";}
		elsif ($charisma == 26 | $charisma == 27)
			{$chmod = "(+8)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+9)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+10)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+11)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		print "ST: $strength $stmod  IN: $intelligence $inmod WI: $wisdom $wimod DX: $dexterity $dxmod  CO: $constitution $comod CH: $charisma $chmod \n";
	}
        elsif ($racepick - 1 == 6)
        {       
		print "\n";	
		print "Eladrin Racial mods: +2 Int +2 Dex \n";
		print "Eladrin Racial Skill mods: +2 Arcana +2 History\n";
		print "Eladrin Education\n";
		print "Eladrin Weapon Proficiency\n";
	        print "Eladrin Will\n";
	        print "Fey Origin\n";
	        print "Trance\n";
	        print "Fey Step\n";
		$intelligence = $intelligence +2;
		$dexterity = $dexterity + 2;
		print "Modified stats \n";

		if ($strength == 1)
			{$stmod = "(-5)";}
		elsif ($strength == 2 | $strength == 3)
			{$stmod = "(-4)";}
		elsif ($strength == 4 | $strength == 5)
			{$stmod = "(-3)";}
		elsif ($strength == 6 | $strength == 7)
			{$stmod = "(-2)";}
		elsif ($strength == 8 | $strength == 9)
			{$stmod = "(-1)";}
		elsif ($strength == 10 | $strength == 11)
			{$stmod = "(0)";}
		elsif ($strength == 12 | $strength == 13)
			{$stmod = "(+1)";}
		elsif ($strength == 14 | $strength == 15)
			{$stmod = "(+2)";}
		elsif ($strength == 16 | $strength == 17)
			{$stmod = "(+3)";}
		elsif ($strength == 18 | $strength == 19)
			{$stmod = "(+4)";}
		elsif ($strength == 20 | $strength == 21)
			{$stmod = "(+5)";}
		elsif ($strength == 22 | $strength == 23)
			{$stmod = "(+6)";}
		elsif ($strength == 24 | $strength == 25)
			{$stmod = "(+7)";}
		elsif ($strength == 26 | $strength == 27)
			{$stmod = "(+8)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+9)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+10)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+11)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($intelligence == 1)
			{$inmod = "(-5)";}
		elsif ($intelligence == 2 | $intelligence == 3)
			{$inmod = "(-4)";}
		elsif ($intelligence == 4 | $intelligence == 5)
			{$inmod = "(-3)";}
		elsif ($intelligence == 6 | $intelligence == 7)
			{$inmod = "(-2)";}
		elsif ($intelligence == 8 | $intelligence == 9)
			{$inmod = "(-1)";}
		elsif ($intelligence == 10 | $intelligence == 11)
			{$inmod = "(0)";}
		elsif ($intelligence == 12 | $intelligence == 13)
			{$inmod = "(+1)";}
		elsif ($intelligence == 14 | $intelligence == 15)
			{$inmod = "(+2)";}
		elsif ($intelligence == 16 | $intelligence == 17)
			{$inmod = "(+3)";}
		elsif ($intelligence == 18 | $intelligence == 19)
			{$inmod = "(+4)";}
		elsif ($intelligence == 20 | $intelligence == 21)
			{$inmod = "(+5)";}
		elsif ($intelligence == 22 | $intelligence == 23)
			{$inmod = "(+6)";}
		elsif ($intelligence == 24 | $intelligence == 25)
			{$inmod = "(+7)";}
		elsif ($intelligence == 26 | $intelligence == 27)
			{$inmod = "(+8)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+9)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+10)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+11)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($widsom == 1)
			{$wimod = "(-5)";}
		elsif ($wisdom == 2 | $wisdom == 3)
			{$wimod = "(-4)";}
		elsif ($wisdom == 4 | $wisdom == 5)
			{$wimod = "(-3)";}
		elsif ($wisdom == 6 | $wisdom == 7)
			{$wimod = "(-2)";}
		elsif ($wisdom == 8 | $wisdom == 9)
			{$wimod = "(-1)";}
		elsif ($wisdom == 10 | $wisdom == 11)
			{$wimod = "(0)";}
		elsif ($wisdom == 12 | $wisdom == 13)
			{$wimod = "(+1)";}
		elsif ($wisdom == 14 | $wisdom == 15)
			{$wimod = "(+2)";}
		elsif ($wisdom == 16 | $wisdom == 17)
			{$wimod = "(+3)";}
		elsif ($wisdom == 18 | $wisdom == 19)
			{$wimod = "(+4)";}
		elsif ($wisdom == 20 | $wisdom == 21)
			{$wimod = "(+5)";}
		elsif ($wisdom == 22 | $wisdom == 23)
			{$wimod = "(+6)";}
		elsif ($wisdom == 24 | $wisdom == 25)
			{$wimod = "(+7)";}
		elsif ($wisdom == 26 | $wisdom == 27)
			{$wimod = "(+8)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+9)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+10)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+11)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($dexterity == 1)
			{$dxmod = "(-5)";}
		elsif ($dexterity == 2 | $dexterity == 3)
			{$dxmod = "(-4)";}
		elsif ($dexterity == 4 | $dexterity == 5)
			{$dxmod = "(-3)";}
		elsif ($dexterity == 6 | $dexterity == 7)
			{$dxmod = "(-2)";}
		elsif ($dexterity == 8 | $dexterity == 9)
			{$dxmod = "(-1)";}
		elsif ($dexterity == 10 | $dexterity == 11)
			{$dxmod = "(0)";}
		elsif ($dexterity == 12 | $dexterity == 13)
			{$dxmod = "(+1)";}
		elsif ($dexterity == 14 | $dexterity == 15)
			{$dxmod = "(+2)";}
		elsif ($dexterity == 16 | $dexterity == 17)
			{$dxmod = "(+3)";}
		elsif ($dexterity == 18 | $dexterity == 19)
			{$dxmod = "(+4)";}
		elsif ($dexterity == 20 | $dexterity == 21)
			{$dxmod = "(+5)";}
		elsif ($dexterity == 22 | $dexterity == 23)
			{$dxmod = "(+6)";}
		elsif ($dexterity == 24 | $dexterity == 25)
			{$dxmod = "(+7)";}
		elsif ($dexterity == 26 | $dexterity == 27)
			{$dxmod = "(+8)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+9)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+10)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+11)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($constitution == 1)
			{$comod = "(-5)";}
		elsif ($constitution == 2 | $constitution == 3)
			{$comod = "(-4)";}
		elsif ($constitution == 4 | $constitution == 5)
			{$comod = "(-3)";}
		elsif ($constitution == 6 | $constitution == 7)
			{$comod = "(-2)";}
		elsif ($constitution == 8 | $constitution == 9)
			{$comod = "(-1)";}
		elsif ($constitution == 10 | $constitution == 11)
			{$comod = "(0)";}
		elsif ($constitution == 12 | $constitution == 13)
			{$comod = "(+1)";}
		elsif ($constitution == 14 | $constitution == 15)
			{$comod = "(+2)";}
		elsif ($constitution == 16 | $constitution == 17)
			{$comod = "(+3)";}
		elsif ($constitution == 18 | $constitution == 19)
			{$comod = "(+4)";}
		elsif ($constitution == 20 | $constitution == 21)
			{$comod = "(+5)";}
		elsif ($constitution == 22 | $constitution == 23)
			{$comod = "(+6)";}
		elsif ($constitution == 24 | $constitution == 25)
			{$comod = "(+7)";}
		elsif ($constitution == 26 | $constitution == 27)
			{$comod = "(+8)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+9)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+10)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+11)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($charisma == 1)
			{$chmod = "(-5)";}
		elsif ($charisma == 2 | $charisma == 3)
			{$chmod = "(-4)";}
		elsif ($charisma == 4 | $charisma == 5)
			{$chmod = "(-3)";}
		elsif ($charisma == 6 | $charisma == 7)
			{$chmod = "(-2)";}
		elsif ($charisma == 8 | $charisma == 9)
			{$chmod = "(-1)";}
		elsif ($charisma == 10 | $charisma == 11)
			{$chmod = "(0)";}
		elsif ($charisma == 12 | $charisma == 13)
			{$chmod = "(+1)";}
		elsif ($charisma == 14 | $charisma == 15)
			{$chmod = "(+2)";}
		elsif ($charisma == 16 | $charisma == 17)
			{$chmod = "(+3)";}
		elsif ($charisma == 18 | $charisma == 19)
			{$chmod = "(+4)";}
		elsif ($charisma == 20 | $charisma == 21)
			{$chmod = "(+5)";}
		elsif ($charisma == 22 | $charisma == 23)
			{$chmod = "(+6)";}
		elsif ($charisma == 24 | $charisma == 25)
			{$chmod = "(+7)";}
		elsif ($charisma == 26 | $charisma == 27)
			{$chmod = "(+8)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+9)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+10)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+11)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		print "ST: $strength $stmod  IN: $intelligence $inmod WI: $wisdom $wimod DX: $dexterity $dxmod  CO: $constitution $comod CH: $charisma $chmod \n";
	}
        elsif ($racepick-1 == 8)
        {       
		print "\n";
		print "Elf Racial mods: +2 Wis +2 Dex \n";
		print "Elven Racial Skill mods: +2 Nature +2 Perception\n";
		print "Elven Weapon Proficiency\n";
	        print "Fey Origin\n";
	        print "Group Awareness\n";
		print "Wild Step\n"; 
		print "Elven Accuracy\n";
		$wisdom = $wisdom + 2;
		$dexterity = $dexterity + 2;
		print "Modified stats \n";

		if ($strength == 1)
			{$stmod = "(-5)";}
		elsif ($strength == 2 | $strength == 3)
			{$stmod = "(-4)";}
		elsif ($strength == 4 | $strength == 5)
			{$stmod = "(-3)";}
		elsif ($strength == 6 | $strength == 7)
			{$stmod = "(-2)";}
		elsif ($strength == 8 | $strength == 9)
			{$stmod = "(-1)";}
		elsif ($strength == 10 | $strength == 11)
			{$stmod = "(0)";}
		elsif ($strength == 12 | $strength == 13)
			{$stmod = "(+1)";}
		elsif ($strength == 14 | $strength == 15)
			{$stmod = "(+2)";}
		elsif ($strength == 16 | $strength == 17)
			{$stmod = "(+3)";}
		elsif ($strength == 18 | $strength == 19)
			{$stmod = "(+4)";}
		elsif ($strength == 20 | $strength == 21)
			{$stmod = "(+5)";}
		elsif ($strength == 22 | $strength == 23)
			{$stmod = "(+6)";}
		elsif ($strength == 24 | $strength == 25)
			{$stmod = "(+7)";}
		elsif ($strength == 26 | $strength == 27)
			{$stmod = "(+8)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+9)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+10)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+11)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}
		if ($intelligence == 1)
			{$inmod = "(-5)";}
		elsif ($intelligence == 2 | $intelligence == 3)
			{$inmod = "(-4)";}
		elsif ($intelligence == 4 | $intelligence == 5)
			{$inmod = "(-3)";}
		elsif ($intelligence == 6 | $intelligence == 7)
			{$inmod = "(-2)";}
		elsif ($intelligence == 8 | $intelligence == 9)
			{$inmod = "(-1)";}
		elsif ($intelligence == 10 | $intelligence == 11)
			{$inmod = "(0)";}
		elsif ($intelligence == 12 | $intelligence == 13)
			{$inmod = "(+1)";}
		elsif ($intelligence == 14 | $intelligence == 15)
			{$inmod = "(+2)";}
		elsif ($intelligence == 16 | $intelligence == 17)
			{$inmod = "(+3)";}
		elsif ($intelligence == 18 | $intelligence == 19)
			{$inmod = "(+4)";}
		elsif ($intelligence == 20 | $intelligence == 21)
			{$inmod = "(+5)";}
		elsif ($intelligence == 22 | $intelligence == 23)
			{$inmod = "(+6)";}
		elsif ($intelligence == 24 | $intelligence == 25)
			{$inmod = "(+7)";}
		elsif ($intelligence == 26 | $intelligence == 27)
			{$inmod = "(+8)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+9)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+10)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+11)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($widsom == 1)
			{$wimod = "(-5)";}
		elsif ($wisdom == 2 | $wisdom == 3)
			{$wimod = "(-4)";}
		elsif ($wisdom == 4 | $wisdom == 5)
			{$wimod = "(-3)";}
		elsif ($wisdom == 6 | $wisdom == 7)
			{$wimod = "(-2)";}
		elsif ($wisdom == 8 | $wisdom == 9)
			{$wimod = "(-1)";}
		elsif ($wisdom == 10 | $wisdom == 11)
			{$wimod = "(0)";}
		elsif ($wisdom == 12 | $wisdom == 13)
			{$wimod = "(+1)";}
		elsif ($wisdom == 14 | $wisdom == 15)
			{$wimod = "(+2)";}
		elsif ($wisdom == 16 | $wisdom == 17)
			{$wimod = "(+3)";}
		elsif ($wisdom == 18 | $wisdom == 19)
			{$wimod = "(+4)";}
		elsif ($wisdom == 20 | $wisdom == 21)
			{$wimod = "(+5)";}
		elsif ($wisdom == 22 | $wisdom == 23)
			{$wimod = "(+6)";}
		elsif ($wisdom == 24 | $wisdom == 25)
			{$wimod = "(+7)";}
		elsif ($wisdom == 26 | $wisdom == 27)
			{$wimod = "(+8)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+9)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+10)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+11)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($dexterity == 1)
			{$dxmod = "(-5)";}
		elsif ($dexterity == 2 | $dexterity == 3)
			{$dxmod = "(-4)";}
		elsif ($dexterity == 4 | $dexterity == 5)
			{$dxmod = "(-3)";}
		elsif ($dexterity == 6 | $dexterity == 7)
			{$dxmod = "(-2)";}
		elsif ($dexterity == 8 | $dexterity == 9)
			{$dxmod = "(-1)";}
		elsif ($dexterity == 10 | $dexterity == 11)
			{$dxmod = "(0)";}
		elsif ($dexterity == 12 | $dexterity == 13)
			{$dxmod = "(+1)";}
		elsif ($dexterity == 14 | $dexterity == 15)
			{$dxmod = "(+2)";}
		elsif ($dexterity == 16 | $dexterity == 17)
			{$dxmod = "(+3)";}
		elsif ($dexterity == 18 | $dexterity == 19)
			{$dxmod = "(+4)";}
		elsif ($dexterity == 20 | $dexterity == 21)
			{$dxmod = "(+5)";}
		elsif ($dexterity == 22 | $dexterity == 23)
			{$dxmod = "(+6)";}
		elsif ($dexterity == 24 | $dexterity == 25)
			{$dxmod = "(+7)";}
		elsif ($dexterity == 26 | $dexterity == 27)
			{$dxmod = "(+8)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+9)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+10)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+11)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($constitution == 1)
			{$comod = "(-5)";}
		elsif ($constitution == 2 | $constitution == 3)
			{$comod = "(-4)";}
		elsif ($constitution == 4 | $constitution == 5)
			{$comod = "(-3)";}
		elsif ($constitution == 6 | $constitution == 7)
			{$comod = "(-2)";}
		elsif ($constitution == 8 | $constitution == 9)
			{$comod = "(-1)";}
		elsif ($constitution == 10 | $constitution == 11)
			{$comod = "(0)";}
		elsif ($constitution == 12 | $constitution == 13)
			{$comod = "(+1)";}
		elsif ($constitution == 14 | $constitution == 15)
			{$comod = "(+2)";}
		elsif ($constitution == 16 | $constitution == 17)
			{$comod = "(+3)";}
		elsif ($constitution == 18 | $constitution == 19)
			{$comod = "(+4)";}
		elsif ($constitution == 20 | $constitution == 21)
			{$comod = "(+5)";}
		elsif ($constitution == 22 | $constitution == 23)
			{$comod = "(+6)";}
		elsif ($constitution == 24 | $constitution == 25)
			{$comod = "(+7)";}
		elsif ($constitution == 26 | $constitution == 27)
			{$comod = "(+8)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+9)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+10)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+11)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($charisma == 1)
			{$chmod = "(-5)";}
		elsif ($charisma == 2 | $charisma == 3)
			{$chmod = "(-4)";}
		elsif ($charisma == 4 | $charisma == 5)
			{$chmod = "(-3)";}
		elsif ($charisma == 6 | $charisma == 7)
			{$chmod = "(-2)";}
		elsif ($charisma == 8 | $charisma == 9)
			{$chmod = "(-1)";}
		elsif ($charisma == 10 | $charisma == 11)
			{$chmod = "(0)";}
		elsif ($charisma == 12 | $charisma == 13)
			{$chmod = "(+1)";}
		elsif ($charisma == 14 | $charisma == 15)
			{$chmod = "(+2)";}
		elsif ($charisma == 16 | $charisma == 17)
			{$chmod = "(+3)";}
		elsif ($charisma == 18 | $charisma == 19)
			{$chmod = "(+4)";}
		elsif ($charisma == 20 | $charisma == 21)
			{$chmod = "(+5)";}
		elsif ($charisma == 22 | $charisma == 23)
			{$chmod = "(+6)";}
		elsif ($charisma == 24 | $charisma == 25)
			{$chmod = "(+7)";}
		elsif ($charisma == 26 | $charisma == 27)
			{$chmod = "(+8)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+9)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+10)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+11)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		print "ST: $strength $stmod  IN: $intelligence $inmod WI: $wisdom $wimod DX: $dexterity $dxmod  CO: $constitution $comod CH: $Charisma $chmod \n";
	}
	elsif ($racepick -1 == 9)
	{	
		print "\n";
		print "Half-Elf Racial mods:  +2 Con +2 Cha \n";
		print "Half-Elven Skill mods: +2 Diplomacy +2 Insight\n";
		print "Dilettante\n";
	        print "Dual Heritage\n";
	       	print "Group Diplomacy\n";
		$constitution = $constitution + 2;
		$charisma = $charisma + 2;
		print "Modified stats \n";

		if ($strength == 1)
			{$stmod = "(-5)";}
		elsif ($strength == 2 | $strength == 3)
			{$stmod = "(-4)";}
		elsif ($strength == 4 | $strength == 5)
			{$stmod = "(-3)";}
		elsif ($strength == 6 | $strength == 7)
			{$stmod = "(-2)";}
		elsif ($strength == 8 | $strength == 9)
			{$stmod = "(-1)";}
		elsif ($strength == 10 | $strength == 11)
			{$stmod = "(0)";}
		elsif ($strength == 12 | $strength == 13)
			{$stmod = "(+1)";}
		elsif ($strength == 14 | $strength == 15)
			{$stmod = "(+2)";}
		elsif ($strength == 16 | $strength == 17)
			{$stmod = "(+3)";}
		elsif ($strength == 18 | $strength == 19)
			{$stmod = "(+4)";}
		elsif ($strength == 20 | $strength == 21)
			{$stmod = "(+5)";}
		elsif ($strength == 22 | $strength == 23)
			{$stmod = "(+6)";}
		elsif ($strength == 24 | $strength == 25)
			{$stmod = "(+7)";}
		elsif ($strength == 26 | $strength == 27)
			{$stmod = "(+8)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+9)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+10)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+11)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($intelligence == 1)
			{$inmod = "(-5)";}
		elsif ($intelligence == 2 | $intelligence == 3)
			{$inmod = "(-4)";}
		elsif ($intelligence == 4 | $intelligence == 5)
			{$inmod = "(-3)";}
		elsif ($intelligence == 6 | $intelligence == 7)
			{$inmod = "(-2)";}
		elsif ($intelligence == 8 | $intelligence == 9)
			{$inmod = "(-1)";}
		elsif ($intelligence == 10 | $intelligence == 11)
			{$inmod = "(0)";}
		elsif ($intelligence == 12 | $intelligence == 13)
			{$inmod = "(+1)";}
		elsif ($intelligence == 14 | $intelligence == 15)
			{$inmod = "(+2)";}
		elsif ($intelligence == 16 | $intelligence == 17)
			{$inmod = "(+3)";}
		elsif ($intelligence == 18 | $intelligence == 19)
			{$inmod = "(+4)";}
		elsif ($intelligence == 20 | $intelligence == 21)
			{$inmod = "(+5)";}
		elsif ($intelligence == 22 | $intelligence == 23)
			{$inmod = "(+6)";}
		elsif ($intelligence == 24 | $intelligence == 25)
			{$inmod = "(+7)";}
		elsif ($intelligence == 26 | $intelligence == 27)
			{$inmod = "(+8)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+9)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+10)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+11)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($widsom == 1)
			{$wimod = "(-5)";}
		elsif ($wisdom == 2 | $wisdom == 3)
			{$wimod = "(-4)";}
		elsif ($wisdom == 4 | $wisdom == 5)
			{$wimod = "(-3)";}
		elsif ($wisdom == 6 | $wisdom == 7)
			{$wimod = "(-2)";}
		elsif ($wisdom == 8 | $wisdom == 9)
			{$wimod = "(-1)";}
		elsif ($wisdom == 10 | $wisdom == 11)
			{$wimod = "(0)";}
		elsif ($wisdom == 12 | $wisdom == 13)
			{$wimod = "(+1)";}
		elsif ($wisdom == 14 | $wisdom == 15)
			{$wimod = "(+2)";}
		elsif ($wisdom == 16 | $wisdom == 17)
			{$wimod = "(+3)";}
		elsif ($wisdom == 18 | $wisdom == 19)
			{$wimod = "(+4)";}
		elsif ($wisdom == 20 | $wisdom == 21)
			{$wimod = "(+5)";}
		elsif ($wisdom == 22 | $wisdom == 23)
			{$wimod = "(+6)";}
		elsif ($wisdom == 24 | $wisdom == 25)
			{$wimod = "(+7)";}
		elsif ($wisdom == 26 | $wisdom == 27)
			{$wimod = "(+8)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+9)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+10)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+11)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($dexterity == 1)
			{$dxmod = "(-5)";}
		elsif ($dexterity == 2 | $dexterity == 3)
			{$dxmod = "(-4)";}
		elsif ($dexterity == 4 | $dexterity == 5)
			{$dxmod = "(-3)";}
		elsif ($dexterity == 6 | $dexterity == 7)
			{$dxmod = "(-2)";}
		elsif ($dexterity == 8 | $dexterity == 9)
			{$dxmod = "(-1)";}
		elsif ($dexterity == 10 | $dexterity == 11)
			{$dxmod = "(0)";}
		elsif ($dexterity == 12 | $dexterity == 13)
			{$dxmod = "(+1)";}
		elsif ($dexterity == 14 | $dexterity == 15)
			{$dxmod = "(+2)";}
		elsif ($dexterity == 16 | $dexterity == 17)
			{$dxmod = "(+3)";}
		elsif ($dexterity == 18 | $dexterity == 19)
			{$dxmod = "(+4)";}
		elsif ($dexterity == 20 | $dexterity == 21)
			{$dxmod = "(+5)";}
		elsif ($dexterity == 22 | $dexterity == 23)
			{$dxmod = "(+6)";}
		elsif ($dexterity == 24 | $dexterity == 25)
			{$dxmod = "(+7)";}
		elsif ($dexterity == 26 | $dexterity == 27)
			{$dxmod = "(+8)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+9)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+10)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+11)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($constitution == 1)
			{$comod = "(-5)";}
		elsif ($constitution == 2 | $constitution == 3)
			{$comod = "(-4)";}
		elsif ($constitution == 4 | $constitution == 5)
			{$comod = "(-3)";}
		elsif ($constitution == 6 | $constitution == 7)
			{$comod = "(-2)";}
		elsif ($constitution == 8 | $constitution == 9)
			{$comod = "(-1)";}
		elsif ($constitution == 10 | $constitution == 11)
			{$comod = "(0)";}
		elsif ($constitution == 12 | $constitution == 13)
			{$comod = "(+1)";}
		elsif ($constitution == 14 | $constitution == 15)
			{$comod = "(+2)";}
		elsif ($constitution == 16 | $constitution == 17)
			{$comod = "(+3)";}
		elsif ($constitution == 18 | $constitution == 19)
			{$comod = "(+4)";}
		elsif ($constitution == 20 | $constitution == 21)
			{$comod = "(+5)";}
		elsif ($constitution == 22 | $constitution == 23)
			{$comod = "(+6)";}
		elsif ($constitution == 24 | $constitution == 25)
			{$comod = "(+7)";}
		elsif ($constitution == 26 | $constitution == 27)
			{$comod = "(+8)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+9)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+10)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+11)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($charisma == 1)
			{$chmod = "(-5)";}
		elsif ($charisma == 2 | $charisma == 3)
			{$chmod = "(-4)";}
		elsif ($charisma == 4 | $charisma == 5)
			{$chmod = "(-3)";}
		elsif ($charisma == 6 | $charisma == 7)
			{$chmod = "(-2)";}
		elsif ($charisma == 8 | $charisma == 9)
			{$chmod = "(-1)";}
		elsif ($charisma == 10 | $charisma == 11)
			{$chmod = "(0)";}
		elsif ($charisma == 12 | $charisma == 13)
			{$chmod = "(+1)";}
		elsif ($charisma == 14 | $charisma == 15)
			{$chmod = "(+2)";}
		elsif ($charisma == 16 | $charisma == 17)
			{$chmod = "(+3)";}
		elsif ($charisma == 18 | $charisma == 19)
			{$chmod = "(+4)";}
		elsif ($charisma == 20 | $charisma == 21)
			{$chmod = "(+5)";}
		elsif ($charisma == 22 | $charisma == 23)
			{$chmod = "(+6)";}
		elsif ($charisma == 24 | $charisma == 25)
			{$chmod = "(+7)";}
		elsif ($charisma == 26 | $charisma == 27)
			{$chmod = "(+8)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+9)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+10)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+11)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		print "ST: $strength $stmod  IN: $intelligence $inmod WI: $wisdom $wimod DX: $dexterity $dxmod  CO: $constitution $comod CH: $charisma $chmod \n";
	}
        elsif ($racepick -1 == 10)
	{       
		print "\n";
		print "Halfling Racial mods: +2 Dex +2 Cha \n";
		print "Halfling Skill mods: +2 Acrobatics +2 Thievery Skill\n";
		print "Bold\n"; 
		print "Nimble Reaction\n"; 
		print "Second Chance\n";
		$dexterity = $dexterity + 2;
		$charisma = $charisma + 2;
		print "Modified stats \n";

		if ($strength == 1)
			{$stmod = "(-5)";}
		elsif ($strength == 2 | $strength == 3)
			{$stmod = "(-4)";}
		elsif ($strength == 4 | $strength == 5)
			{$stmod = "(-3)";}
		elsif ($strength == 6 | $strength == 7)
			{$stmod = "(-2)";}
		elsif ($strength == 8 | $strength == 9)
			{$stmod = "(-1)";}
		elsif ($strength == 10 | $strength == 11)
			{$stmod = "(0)";}
		elsif ($strength == 12 | $strength == 13)
			{$stmod = "(+1)";}
		elsif ($strength == 14 | $strength == 15)
			{$stmod = "(+2)";}
		elsif ($strength == 16 | $strength == 17)
			{$stmod = "(+3)";}
		elsif ($strength == 18 | $strength == 19)
			{$stmod = "(+4)";}
		elsif ($strength == 20 | $strength == 21)
			{$stmod = "(+5)";}
		elsif ($strength == 22 | $strength == 23)
			{$stmod = "(+6)";}
		elsif ($strength == 24 | $strength == 25)
			{$stmod = "(+7)";}
		elsif ($strength == 26 | $strength == 27)
			{$stmod = "(+8)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+9)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+10)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+11)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($intelligence == 1)
			{$inmod = "(-5)";}
		elsif ($intelligence == 2 | $intelligence == 3)
			{$inmod = "(-4)";}
		elsif ($intelligence == 4 | $intelligence == 5)
			{$inmod = "(-3)";}
		elsif ($intelligence == 6 | $intelligence == 7)
			{$inmod = "(-2)";}
		elsif ($intelligence == 8 | $intelligence == 9)
			{$inmod = "(-1)";}
		elsif ($intelligence == 10 | $intelligence == 11)
			{$inmod = "(0)";}
		elsif ($intelligence == 12 | $intelligence == 13)
			{$inmod = "(+1)";}
		elsif ($intelligence == 14 | $intelligence == 15)
			{$inmod = "(+2)";}
		elsif ($intelligence == 16 | $intelligence == 17)
			{$inmod = "(+3)";}
		elsif ($intelligence == 18 | $intelligence == 19)
			{$inmod = "(+4)";}
		elsif ($intelligence == 20 | $intelligence == 21)
			{$inmod = "(+5)";}
		elsif ($intelligence == 22 | $intelligence == 23)
			{$inmod = "(+6)";}
		elsif ($intelligence == 24 | $intelligence == 25)
			{$inmod = "(+7)";}
		elsif ($intelligence == 26 | $intelligence == 27)
			{$inmod = "(+8)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+9)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+10)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+11)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($widsom == 1)
			{$wimod = "(-5)";}
		elsif ($wisdom == 2 | $wisdom == 3)
			{$wimod = "(-4)";}
		elsif ($wisdom == 4 | $wisdom == 5)
			{$wimod = "(-3)";}
		elsif ($wisdom == 6 | $wisdom == 7)
			{$wimod = "(-2)";}
		elsif ($wisdom == 8 | $wisdom == 9)
			{$wimod = "(-1)";}
		elsif ($wisdom == 10 | $wisdom == 11)
			{$wimod = "(0)";}
		elsif ($wisdom == 12 | $wisdom == 13)
			{$wimod = "(+1)";}
		elsif ($wisdom == 14 | $wisdom == 15)
			{$wimod = "(+2)";}
		elsif ($wisdom == 16 | $wisdom == 17)
			{$wimod = "(+3)";}
		elsif ($wisdom == 18 | $wisdom == 19)
			{$wimod = "(+4)";}
		elsif ($wisdom == 20 | $wisdom == 21)
			{$wimod = "(+5)";}
		elsif ($wisdom == 22 | $wisdom == 23)
			{$wimod = "(+6)";}
		elsif ($wisdom == 24 | $wisdom == 25)
			{$wimod = "(+7)";}
		elsif ($wisdom == 26 | $wisdom == 27)
			{$wimod = "(+8)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+9)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+10)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+11)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($dexterity == 1)
			{$dxmod = "(-5)";}
		elsif ($dexterity == 2 | $dexterity == 3)
			{$dxmod = "(-4)";}
		elsif ($dexterity == 4 | $dexterity == 5)
			{$dxmod = "(-3)";}
		elsif ($dexterity == 6 | $dexterity == 7)
			{$dxmod = "(-2)";}
		elsif ($dexterity == 8 | $dexterity == 9)
			{$dxmod = "(-1)";}
		elsif ($dexterity == 10 | $dexterity == 11)
			{$dxmod = "(0)";}
		elsif ($dexterity == 12 | $dexterity == 13)
			{$dxmod = "(+1)";}
		elsif ($dexterity == 14 | $dexterity == 15)
			{$dxmod = "(+2)";}
		elsif ($dexterity == 16 | $dexterity == 17)
			{$dxmod = "(+3)";}
		elsif ($dexterity == 18 | $dexterity == 19)
			{$dxmod = "(+4)";}
		elsif ($dexterity == 20 | $dexterity == 21)
			{$dxmod = "(+5)";}
		elsif ($dexterity == 22 | $dexterity == 23)
			{$dxmod = "(+6)";}
		elsif ($dexterity == 24 | $dexterity == 25)
			{$dxmod = "(+7)";}
		elsif ($dexterity == 26 | $dexterity == 27)
			{$dxmod = "(+8)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+9)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+10)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+11)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}
		
		if ($constitution == 1)
			{$comod = "(-5)";}
		elsif ($constitution == 2 | $constitution == 3)
			{$comod = "(-4)";}
		elsif ($constitution == 4 | $constitution == 5)
			{$comod = "(-3)";}
		elsif ($constitution == 6 | $constitution == 7)
			{$comod = "(-2)";}
		elsif ($constitution == 8 | $constitution == 9)
			{$comod = "(-1)";}
		elsif ($constitution == 10 | $constitution == 11)
			{$comod = "(0)";}
		elsif ($constitution == 12 | $constitution == 13)
			{$comod = "(+1)";}
		elsif ($constitution == 14 | $constitution == 15)
			{$comod = "(+2)";}
		elsif ($constitution == 16 | $constitution == 17)
			{$comod = "(+3)";}
		elsif ($constitution == 18 | $constitution == 19)
			{$comod = "(+4)";}
		elsif ($constitution == 20 | $constitution == 21)
			{$comod = "(+5)";}
		elsif ($constitution == 22 | $constitution == 23)
			{$comod = "(+6)";}
		elsif ($constitution == 24 | $constitution == 25)
			{$comod = "(+7)";}
		elsif ($constitution == 26 | $constitution == 27)
			{$comod = "(+8)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+9)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+10)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+11)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($charisma == 1)
			{$chmod = "(-5)";}
		elsif ($charisma == 2 | $charisma == 3)
			{$chmod = "(-4)";}
		elsif ($charisma == 4 | $charisma == 5)
			{$chmod = "(-3)";}
		elsif ($charisma == 6 | $charisma == 7)
			{$chmod = "(-2)";}
		elsif ($charisma == 8 | $charisma == 9)
			{$chmod = "(-1)";}
		elsif ($charisma == 10 | $charisma == 11)
			{$chmod = "(0)";}
		elsif ($charisma == 12 | $charisma == 13)
			{$chmod = "(+1)";}
		elsif ($charisma == 14 | $charisma == 15)
			{$chmod = "(+2)";}
		elsif ($charisma == 16 | $charisma == 17)
			{$chmod = "(+3)";}
		elsif ($charisma == 18 | $charisma == 19)
			{$chmod = "(+4)";}
		elsif ($charisma == 20 | $charisma == 21)
			{$chmod = "(+5)";}
		elsif ($charisma == 22 | $charisma == 23)
			{$chmod = "(+6)";}
		elsif ($charisma == 24 | $charisma == 25)
			{$chmod = "(+7)";}
		elsif ($charisma == 26 | $charisma == 27)
			{$chmod = "(+8)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+9)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+10)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+11)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		print "ST: $strength $stmod  IN: $intelligence $inmod WI: $wisdom $wimod DX: $dexterity $dxmod  CO: $constitution $comod CH: $charisma $chmod \n";
	}
        elsif ($racepick -1 == 11)
        {       
		print "\n";
		print "Human Racial mods:+2 ability (choice)\n";
		print "Bonus At-Will power\n";
	       	print "Bonus Feat at 1st Level\n"; 
		print "Bonus Skill\n";
		print "Human Defense Bonus: +1 Fort/Ref/Def\n";
		$constitution = $constitution + 2;
		print "Modified stats \n";

		print "ST: $strength $stmod  IN: $intelligence $inmod WI: $wisdom $wimod DX: $dexterity $dxmod  CO: $constitution $comod CH: $charisma $chmod \n";

	}
        elsif ($racepick -1 == 16)
        {       
		print "\n";
		print "Tiefling Racial mods:+2 Int +2 Cha \n";
		print "Tiefling Skill mods: +2 Bluff +2 Stealth\n";
		print "Bloodhunt\n"; 
		print "Fire Res (5 + 1/2 your level)\n";
		print "Infernal Wrath\n";
		$intelligence = $intelligence + 2;
		$charisma = $charisma + 2;
		print "Modified stats \n";

		if ($strength == 1)
			{$stmod = "(-5)";}
		elsif ($strength == 2 | $strength == 3)
			{$stmod = "(-4)";}
		elsif ($strength == 4 | $strength == 5)
			{$stmod = "(-3)";}
		elsif ($strength == 6 | $strength == 7)
			{$stmod = "(-2)";}
		elsif ($strength == 8 | $strength == 9)
			{$stmod = "(-1)";}
		elsif ($strength == 10 | $strength == 11)
			{$stmod = "(0)";}
		elsif ($strength == 12 | $strength == 13)
			{$stmod = "(+1)";}
		elsif ($strength == 14 | $strength == 15)
			{$stmod = "(+2)";}
		elsif ($strength == 16 | $strength == 17)
			{$stmod = "(+3)";}
		elsif ($strength == 18 | $strength == 19)
			{$stmod = "(+4)";}
		elsif ($strength == 20 | $strength == 21)
			{$stmod = "(+5)";}
		elsif ($strength == 22 | $strength == 23)
			{$stmod = "(+6)";}
		elsif ($strength == 24 | $strength == 25)
			{$stmod = "(+7)";}
		elsif ($strength == 26 | $strength == 27)
			{$stmod = "(+8)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+9)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+10)";}
		elsif ($strength == 28 | $strength == 29)
			{$stmod = "(+11)";}
		elsif ($strength == 30 | $strength == 31)
			{$stmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($intelligence == 1)
			{$inmod = "(-5)";}
		elsif ($intelligence == 2 | $intelligence == 3)
			{$inmod = "(-4)";}
		elsif ($intelligence == 4 | $intelligence == 5)
			{$inmod = "(-3)";}
		elsif ($intelligence == 6 | $intelligence == 7)
			{$inmod = "(-2)";}
		elsif ($intelligence == 8 | $intelligence == 9)
			{$inmod = "(-1)";}
		elsif ($intelligence == 10 | $intelligence == 11)
			{$inmod = "(0)";}
		elsif ($intelligence == 12 | $intelligence == 13)
			{$inmod = "(+1)";}
		elsif ($intelligence == 14 | $intelligence == 15)
			{$inmod = "(+2)";}
		elsif ($intelligence == 16 | $intelligence == 17)
			{$inmod = "(+3)";}
		elsif ($intelligence == 18 | $intelligence == 19)
			{$inmod = "(+4)";}
		elsif ($intelligence == 20 | $intelligence == 21)
			{$inmod = "(+5)";}
		elsif ($intelligence == 22 | $intelligence == 23)
			{$inmod = "(+6)";}
		elsif ($intelligence == 24 | $intelligence == 25)
			{$inmod = "(+7)";}
		elsif ($intelligence == 26 | $intelligence == 27)
			{$inmod = "(+8)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+9)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+10)";}
		elsif ($intelligence == 28 | $intelligence == 29)
			{$inmod = "(+11)";}
		elsif ($intelligence == 30 | $intelligence == 31)
			{$inmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($widsom == 1)
			{$wimod = "(-5)";}
		elsif ($wisdom == 2 | $wisdom == 3)
			{$wimod = "(-4)";}
		elsif ($wisdom == 4 | $wisdom == 5)
			{$wimod = "(-3)";}
		elsif ($wisdom == 6 | $wisdom == 7)
			{$wimod = "(-2)";}
		elsif ($wisdom == 8 | $wisdom == 9)
			{$wimod = "(-1)";}
		elsif ($wisdom == 10 | $wisdom == 11)
			{$wimod = "(0)";}
		elsif ($wisdom == 12 | $wisdom == 13)
			{$wimod = "(+1)";}
		elsif ($wisdom == 14 | $wisdom == 15)
			{$wimod = "(+2)";}
		elsif ($wisdom == 16 | $wisdom == 17)
			{$wimod = "(+3)";}
		elsif ($wisdom == 18 | $wisdom == 19)
			{$wimod = "(+4)";}
		elsif ($wisdom == 20 | $wisdom == 21)
			{$wimod = "(+5)";}
		elsif ($wisdom == 22 | $wisdom == 23)
			{$wimod = "(+6)";}
		elsif ($wisdom == 24 | $wisdom == 25)
			{$wimod = "(+7)";}
		elsif ($wisdom == 26 | $wisdom == 27)
			{$wimod = "(+8)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+9)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+10)";}
		elsif ($wisdom == 28 | $wisdom == 29)
			{$wimod = "(+11)";}
		elsif ($wisdom == 30 | $wisdom == 31)
			{$wimod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($dexterity == 1)
			{$dxmod = "(-5)";}
		elsif ($dexterity == 2 | $dexterity == 3)
			{$dxmod = "(-4)";}
		elsif ($dexterity == 4 | $dexterity == 5)
			{$dxmod = "(-3)";}
		elsif ($dexterity == 6 | $dexterity == 7)
			{$dxmod = "(-2)";}
		elsif ($dexterity == 8 | $dexterity == 9)
			{$dxmod = "(-1)";}
		elsif ($dexterity == 10 | $dexterity == 11)
			{$dxmod = "(0)";}
		elsif ($dexterity == 12 | $dexterity == 13)
			{$dxmod = "(+1)";}
		elsif ($dexterity == 14 | $dexterity == 15)
			{$dxmod = "(+2)";}
		elsif ($dexterity == 16 | $dexterity == 17)
			{$dxmod = "(+3)";}
		elsif ($dexterity == 18 | $dexterity == 19)
			{$dxmod = "(+4)";}
		elsif ($dexterity == 20 | $dexterity == 21)
			{$dxmod = "(+5)";}
		elsif ($dexterity == 22 | $dexterity == 23)
			{$dxmod = "(+6)";}
		elsif ($dexterity == 24 | $dexterity == 25)
			{$dxmod = "(+7)";}
		elsif ($dexterity == 26 | $dexterity == 27)
			{$dxmod = "(+8)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+9)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+10)";}
		elsif ($dexterity == 28 | $dexterity == 29)
			{$dxmod = "(+11)";}
		elsif ($dexterity == 30 | $dexterity == 31)
			{$dxmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($constitution == 1)
			{$comod = "(-5)";}
		elsif ($constitution == 2 | $constitution == 3)
			{$comod = "(-4)";}
		elsif ($constitution == 4 | $constitution == 5)
			{$comod = "(-3)";}
		elsif ($constitution == 6 | $constitution == 7)
			{$comod = "(-2)";}
		elsif ($constitution == 8 | $constitution == 9)
			{$comod = "(-1)";}
		elsif ($constitution == 10 | $constitution == 11)
			{$comod = "(0)";}
		elsif ($constitution == 12 | $constitution == 13)
			{$comod = "(+1)";}
		elsif ($constitution == 14 | $constitution == 15)
			{$comod = "(+2)";}
		elsif ($constitution == 16 | $constitution == 17)
			{$comod = "(+3)";}
		elsif ($constitution == 18 | $constitution == 19)
			{$comod = "(+4)";}
		elsif ($constitution == 20 | $constitution == 21)
			{$comod = "(+5)";}
		elsif ($constitution == 22 | $constitution == 23)
			{$comod = "(+6)";}
		elsif ($constitution == 24 | $constitution == 25)
			{$comod = "(+7)";}
		elsif ($constitution == 26 | $constitution == 27)
			{$comod = "(+8)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+9)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+10)";}
		elsif ($constitution == 28 | $constitution == 29)
			{$comod = "(+11)";}
		elsif ($constitution == 30 | $constitution == 31)
			{$comod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		if ($charisma == 1)
			{$chmod = "(-5)";}
		elsif ($charisma == 2 | $charisma == 3)
			{$chmod = "(-4)";}
		elsif ($charisma == 4 | $charisma == 5)
			{$chmod = "(-3)";}
		elsif ($charisma == 6 | $charisma == 7)
			{$chmod = "(-2)";}
		elsif ($charisma == 8 | $charisma == 9)
			{$chmod = "(-1)";}
		elsif ($charisma == 10 | $charisma == 11)
			{$chmod = "(0)";}
		elsif ($charisma == 12 | $charisma == 13)
			{$chmod = "(+1)";}
		elsif ($charisma == 14 | $charisma == 15)
			{$chmod = "(+2)";}
		elsif ($charisma == 16 | $charisma == 17)
			{$chmod = "(+3)";}
		elsif ($charisma == 18 | $charisma == 19)
			{$chmod = "(+4)";}
		elsif ($charisma == 20 | $charisma == 21)
			{$chmod = "(+5)";}
		elsif ($charisma == 22 | $charisma == 23)
			{$chmod = "(+6)";}
		elsif ($charisma == 24 | $charisma == 25)
			{$chmod = "(+7)";}
		elsif ($charisma == 26 | $charisma == 27)
			{$chmod = "(+8)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+9)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+10)";}
		elsif ($charisma == 28 | $charisma == 29)
			{$chmod = "(+11)";}
		elsif ($charisma == 30 | $charisma == 31)
			{$chmod = "(+12)";}
		else
			{$dummy = $dummy + 1;}

		print "ST: $strength $stmod  IN: $intelligence $inmod WI: $wisdom $wimod DX: $dexterity $dxmod  CO: $constitution $comod CH: $charisma $chmod \n";

	}
        else
        {
		$dummy=0;

	}

	print "\n";
	
	}
while ($charcount < $members);


#
#AC
#List Skill Bonuses
#Show Racial skill list bonuses
#Show Class skill list bonuses
#List Total Skill bonuses
#
#if arcane, pick a familiar
#
#if over level 10, pick a mount
#if over level 20, pick a extraordinary mount eg...griffon, pegasus,dragon
#
#build equipment listing...find in old dm ...character of certain level 
#has probably magic items, hirelings, lands, castles, holdings
#
#
#
#
#
#Generates the following
# ac(10 + 1/2 level+armor+abilmod+classmod+featmod+enhmod+miscmod+miscmod), atks, dmg, mv, gender, al, hp, bloodied hp(1/2 hp), surge value(1/4 hp), surgesperday, second wind(once per encounter - temp hp), role, skills, save_fort(10+1/2 level+abil+class+feat+enh+misc+misc), save_will, save_reflex, action points, spells, mnr
#
#@class=("Bard","Druid","Sorcerer","Swordmage","Witch","Psion"); 
#@arcaneclass=("Bard","Sorcerer","SwordMage","Witch","Warlock","Wizard");
#@divineclass=("Cleric","Paladin"); 
# social_interactions(cheerful,charming,talkative,witty,reserved,relaxed,nervous,rude);
# social_optimistic(enthusiastic,grim,hopeful,self-assured,fatalistic,brooding);
# social_trusting(gullible,suspicious,open-minded,naive,skeptical,trusting);
# decision_points_assertive(humble,timid,adaptable,easygoing,commanding,impatient);
# decision_points_rule following(conscientious, uncompromising,scrupulous,honest,pragmatic,flexible,dutiful,wild,ignoring);
# decision_points_empathetic(kind,stern,thoughtful,protective,hard-hearted,oblivious);
# dire_straits_courageous(brave,cautious,competitive,reckless,steady,fierce);
# dire_straits_setback response(stoic,vengeful,driven,bold,happy-go-lucky,impassioned);
# dire_straits_nerves(calm,impulsive,skittish,patient,restless,unshakable);
#
# skill(acrobatics_dex,arcana_int,athletics_str,bluff_cha,diplomacy_cha,dungeoneering_wis,endurance_con,heal_wis,history_int,insight_wis,intimidate_cha,nature_wis,perception_wis,religion_int,stealth_dex,streetwise_cha,thievery_dex);
#
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
#
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




#Eladrin Racial Traits
#Average Height:  5'5" - 6'1"
#Average Weight:   130-180 lb.
#Ability Scores:  +2 Dexterity, +2 Intelligence
#Size:  Medium
#Speed:  6 squares
#Vision:  Low-light
#Languages:  Common, Elven
#Skill Bonuses:  +2 Aracana, +2 History
#Eladrin Education:  You gain training in one additinal skill selected from the skill list in Chapter 5
#Eladrin Weapon Proficiency:  You gain proficiency with the longsword
#Eladrin Will:  You gain a +1 racial bonus to your Will defense
#  In addition, you gain +5 racial bonus to saving throws against charm effects
#Fey Origin:  Your ancestors were native to the Feywild, so you are considered a fey creature for the purpose of effects that relate to creature origin.
#Trance:  Rather than sleep, eladrin enter a meditative state known as trance.  You need to spend 4 hours in this state to gain the same benefits other races gain from taking a 6-hour extended rest.  While in a trance, you are fully aware of your surroundings and notice approaching enemies and other events as normal.
#Fey Step:  You can use fey step as an encounter power.

#Fey Step:  Eladrin Racial Power
#With a step, you vanish from one place and appear in another.
#Encounter:  Teleportation
#Move Action:  Personal
#Effect:  Teleport up to 5 squares (see "Teleportation" on page 286)

#Favored Classes:  Wizard, Rogue and Warlord




#Elf Racial Traits
#Average Height:  5'4" - 6'
#Average Weight:  130-170 lb. 
#Ability Scores:  +2 Dexterity, +2 Wisdom
#Size:  Medium
#Speed:  7 squares
#Vision:  Low-light 
#Languages:  Common, Elven
#Skill Bonuses:  +2 Nature, +2 Perception
#Elven Weapon Proficiency:  You gain proficiency with the longbow and the shortbow
#Fey Origin:  Your ancestors were native to the Feywild, so you are considered a fey creature for the purpose of effects that relate to creature origin.
#Group Awareness:  You grant non-elf allies within 5 squares of you a +1 racial bonus to Perception checks
#Wild Step:  You ignore difficult terrain when you shift (even if you have a power that allows you to shift multiple squares)
#Elven Accuracy:  You can use elven accuracy as an encounter power.

#Elven Accuracy - Elf Racial Trait
#With an instant of focus, you take careful aim at your foe and strike with the legendary accuracy of the elves.
#Encounter - 
#Free Action 	Personal
#Effect:  Reroll an attack roll.  Use the second roll, even if it's lower.
#Favored Classes:  Ranger,Rogue and Cleric





#Half-Elf
#Racial Traits
#Average Height:  5'5" - 6'2"
#Average Weight:  130-190 lb.
#Ability Scores:  +2 Constitution, +2 Charisma
#Size:  Medium
#Speed:  6 squares
#Vision:  Low-light
#Languages:  Common, Elven, choice of one other
#Skill Bonuses:  +2 Diplomacy, +2 Insight
#Dilettante:  At 1st level, you choose an at-will power from a class different from yours.  You can use that power as an encounter power.
#Dual Heritage:  You can take feats that have either elf or human as a prerequisite (as well as those specifically for half-elves), as long as you meet any other requirements.
#Group Diplomacy:  You grant allies withi 10 squares of you a +1 racial bonus to Diplomacy checks.
#Favored Classes:  Warlord, Paladin and Warlock




#Halfling
#Halfling Racial Traits
#Average Height:  3'10" - 4'2"
#Average Weight:  75-85 lb.
#Ability Scores:  +2 Dexterity, +2 Charisma
#Size:  Small
#Speed:  6 squares
#Vision:  Normal
#Languages:  Common, choice of one other
#Skill Bonuses:  +2 Acrobatics, +2 Thievery
#Bold:  You gain a +5 racial bonus to saving throws against fear
#Nimble Reaction:  You gain a +2 racial bonus to AC against opportunity attacks
#Second Chance:  You can use second chance as an encounter power

#Second Chance - Racial Power
#Luck and small size combine to work in your favor as you dodge your enemy's attack
#Encounter
#Immediate Interrupt	Personal
#Effect:  When an attack hits you, force an enemy to roll the attack again.  The enemy uses the second roll, even if it's lower.

#Favored Classes:  Rogue, Ranger and Warlock
#Notes:  Being small
#Small characters follow most of the same rules as Medium ones, with the following exceptions
#*  You can't use two-handed weapons (page 215), such as greatswords and halberds.
#*  When you use a versatile weapon (page 217), such as a longsword, you must use it two-handed, but you don't deal additional damage for doing so.


#Human
#Racial Traits
#Average Height:  5'6 - 6'2"
#Average Weight:  135 - 220 lb.
#Ability Scores"  +2 to one ability score of your choice
#Size:  Medium
#Speed:  6 squares
#Vision:  Normal
#Languages:  Common, choice of one other
#Bonus At-Will Power:  You know one extra at-will power from your class
#Bonus Feat:  You gain a bonus feat at 1st level.  You must meet the feat's prerequisites
#Bonus Skill:  You gain training in one additional skill from your class skill list
#Human Defense Bonuses:  +1 to Fortitude, REflex and Will Defenses
#Favored Class:  Any/All





#Tiefling
#Racial Traits
#Average Height:  5'6" - 6'2"
#Average Weight:  140-230 lb.
#Ability Scores:  +2 Intelligence, +2 Charisma
#Size:  Medium
#Speed:  6 squares
#Vision:  Low-light
#Languages:  Common, choice of one other
#Skill Bonuses:  +2 Bluff, +2 Stealth
#Bloodhunt:  You gain a +1 racial bonus to attack rolls against bloodied foes
#Fire Resistance:  You have resist fire 5 + one-half your level
#Infernal Wrath:  You can use infernal wrath as an encounter power

#Infernal Wrath - Tiefling Racial Power
#You call upon your furious nature to improve your odds of harming your foe
#Encounter
#Minor Action	Personal
#Effect:  You can channel your fury to gain a +1 power bonus to your next attack roll against an enemy that hit you since your last turn.  If your attack hits and deals damage, add your Charisma modifier as extra damage.

#Favored Classes:  Warlock, Warlord and Rogue


#Classes
#Cleric (page 60) a divinely inspired warrior
#Fighter (page 75):  A master of martial combat.
#Paladin (page 89):  A champion dedicated to a specific diety
#Ranger (page 103):  A ranged or two-weapon combat specialist
#Rogue (page 116):  A combatant who uses stealth and slyness to thwart enemies
#Warlock (page 129):  A wielder of arcan power gleaned from otherworldly entities
#Warlord (page 143):  A commander who leads from the front
#Wizard (page 156):  The world's most powerful purveyor of magic



#Paragon Paths  Levels 11-20
#Cleric (page 72):  Angelic avenger, Divine oracle, Radiant servant, Warpriest
#Fighter (page 86):  Iron vanguard, Kensei, Pit Fighter, Swordmaster
#Paladin (page 100):  Astral Weapon, Champion of order, Hospitaler, Justiciar
#Ranger (page 113):  Battlefield archer, Beast stalker, Pathfinder, Stormwarden
#Rogue (page 126):  Cat burglar, Daggermaster, Master Infiltrator, Shadow Assassin
#Warlock (page 140):  Doomsayer, Feytouched, Life-stealer
#Warlord (page 153):  Battle Captain, Combat Veteran, Knight Commander, Sword Marshal
#Wizard (page 169):  Battle mage, Blood mage, Spellstorm mage, Wizard of the Spiral Tower


#Epic Destinies 21-30

#Epic Destiny		Description					Prerequisite
#Archmage		Ultimate master of arcane spells		21st level Wizard
#	Arcane Seclusion - Demispell
#	Spell Recall (21st level):  At the beginning of each day, choose one daily spell that you know (and have prepared today, if you prepare spells).  You can use that spell two times that day, rather than only once.
#	Arcane Spirit (24th level):  
#	Archspell (30th level):  
#	Archmage Power:  Shape Magic - Archmage Utility 26
#		You reach into the ebb and flow of arcane energy and pluck a spell you have already used out of the invisible tide, instantly recalling it to memory.
#Daily Standard Action		Personal
#Effect:  You regain one arcane opwer you have already used.





#Deadly trickster	A wanderer, thief, pragmatist and survivor	21st level; Dexterity 21 or Charisma 21; training in Acrobatics, Bluff, Stealth or Thievery
#	Sly Fortune's Favor (21st level):  You have a knack for getting out of tough situations.  Three times per day, as a free action, you can reroll a d20 roll (attack roll, skill check, ability check or saving throw)
#	Trickster's Control (24th level):  If you roll an 18 or highter on the d20 when making the first attack roll for an encounter or daily attack pwer, that power is not expended.
#	Trickster's Disposition (30th level):  Once per day, you can tell the DM to treat the result of a d20 roll he just made as a 1.  No rerolls are possible
#Deadly Trickster Power
#Epic Trick - DEadly Trickster Utility 26
#Daily * Healing
#Minor Action		Personal
#Effect:  Regain all of your hit points and healing surges, automatically save against all effects on you, recover all expended encoun ter powers, or recover all expended daily powers except this one.  Once you use this power, you cannot recover it except by taking and extended rest.

#Demigod			You are on the path to godhood			21st level
#	Divine Spark (21st level):  Increase two ability scores of your choice by 2 each
#	Divine Recovery (24th level):  The first time you are reduced to 0 hit points or fewer each day, you regain hit points equal to half your maximum hit points
#	Divine Miracle (30th level):  When you have expended your last remaining encounter power, you regain the use of one encounter power of your choice.  In this way, you never run out of encounter powers.
#Demigod Power
#Divine Regeneration - Demigod Utility 26
#You ignite the divine spark that glows within you, unleashing a wave of regenerating energy for a short time
#Daily*Healing
#Minor Action		Personal
#Effect:  You gain regeneration equal to your highest ability score until the end of the encounter

#Eternal seeker		Your destiny finds you				21st level
#	Seeker of the Many Paths (21st level):  When you gain a class encounter or daily power by gaining a level, you can choose your new ower from any class.
#	Learning a power doesn't necessarily equip you with all the attributes required to use the power.  For eample, a fighter who learns a wizard spell as an Eternal Seeker would not gain the ability to use implements that make casting wizard spells more effective.  Therefore, you're usually better off learning powers that are compatible with what you already know.
#	Eternal Action (24th level):  When you spend an action point to take an extra action, you also gain an extra action on your next turn.  The extra action you take on your next turn doesn't benefit from any abilities (such as many paragon path features) that affect what happens when you spend an action point.
#	Seeker's Lore (26th level):  You gain one 22nd level utility power from any class
#	Seeking Destiny (30th level):  You gain the 24th level epic destiny feature from any other epic destiny that you qualify for.



#Skills
#Key Skill		Ability		Class Skill for
#Acrobatics		Dex		Ranger, Rogue
#	Acrobatic Stunt			Base DC 15
#	Balance 			
#	Escape from a Grab
#	Escape from Restraints
#	Reduce Falling Damage (Trained only)
#Arcana			Int		Cleric, Warlock, Wizard
#	Arcana Knowledge
#	Monster Knowledge
#	Detect Magic (Trained Only)
#Athletics		Str		Figher, ranger, rogue, warlord
#	Climb
#	Escape from a Grab
#	Jump
#	Swim
#Bluff			Cha		Rogue, warlock
#Diplomacy		Cha		Cleric, paladin, warlord, wizard
#Dungeoneering		Wis		Ranger, rogue, wizard
#	Dungeoneering Knowledge
#	Forage
#	Monster Knowledge
#Endurance		Con		Figher, paladin, ranger, warlord
#Heal			Wis		Cleric, Fighter, paladin, ranger, warlord
#	First Aid
#	Treat Disease
#History			Int		Cleric, paladin, warlock, warlord, wizard
#Insight			Wis		Cleric, paladin, rogue, warlock, wizard
#Intimidate		Cha		Fighter, paladin, rogue, warlock, warlord
#Nature			Wis		Ranger, wizard
#	Forage
#	Handle Animal
#	Nature Knowledge
#	Monster Knowledge
#Perception		Wis		Ranger, Rogue
#	Listen				Perception DC
#		Battle				0
#		Normal Conversation		10
#		Whispers			20
#		Through a door			+5
#		Through a wall			+10
#		More than 10 squares away	+2

#	Spot or Search
#		Barely hidden			10
#		Well hidden			25
#		More than 10 squares away	+2

#	Find Tracks
#		Soft ground (snow,loose dirt,mud)	15
#		Hard ground (wood or stone)	25
#		Rain or snow since tracks were made	+10
#		Each day since trackes were made	+2
#		Quarry obscured its tracks		+5
#		Huge or larger creature			-5
#		Group of ten or more			-5
#Religion		Int		Cleric, paladin, warlock, wizard
#	Religion Knowledge
#	Monster Knowledge
#Stealth			Dex		Ranger, Rogue
#Streetwise		Cha		Figher, rogue, warlock
#Thievery		Dex		Rogue, warlock
#	Disable Trap
#	Open Lock
#	Pick Pocket
#	Sleight of Hand

#Skill check bonuses
#When you create your character, you should determine your base skill check bonus for each skill you know.  Your base skill check bonus for a skill incluydes the following:
#One-half your level
#Your ability score modifier (each skill is based on one of your ability scores)
#a +5 bonus if you're trained in that skill

#In addition, some or all of the following factors might applyt to your base skill check bonus:
#Armor check penalty, if you're wearing some kinds of armor (see Chapter 7) and making a check using Strength, Dexterity or Constitution as the key ability
#Racial of feat bonuses
#An item bonus from a magic item
#A power bonus
#Any untyped bonus that might apply

#Skill Check
#To make a skill check, roll 1d20 and add the following:
#Your base skill check bonus with that skill
#All situational modifiers that apply
#Bonuses and penalties from powers affecting you

#The total is your check result.




#Knowledge Skill
#Level of Knowledge		DC
#Common				15
#Expert				20
#Master				25
#Paragon tier			+10
#Epic tier			+15


#Monster Knowledge		DC
#Name, type and keywords		15
#Powers				20
#Resistances and vulnerabilities	25
#Paragon tier creature		+5
#Epic tier creature		+10




#Heroic Tier Feats
#Action Surge (Human)
#Agile Hunter (Ranger)
#Alertness 
#Armor of Bahamut (Divinity)
#Armor Proficiency (Chainmail)
#Armor Proficiency (Hide)
#Armor Proficiency (Leather)
#Armor Proficiency (Plate)
#Armor Proficiency (Scale)
#Astral Fire
#Avandra's Rescue
#Backstabber
#Blade Opportunist
#Burning Blizzard
#Combat Reflexes
#Corellon's Grace
#Dark Fury
#Defensive Mobility
#Distracting Shield
#Dodge Giants
#Dragonborn Frenzy
#Dragonborn Senses
#Durable
#Dwarven Weapon Training
#Eladrin Soldier
#Elven Precision
#Enlarged Dragon Breath
#Escape Artist
#Expanded Spellbook
#Far Shot
#Far Throw
#Fast Runner
#Ferocious Rebuke
#Group Insight
#Halfling Agility
#Harmony of Erathis
#Healing Hands
#Hellfire Blood
#Human Perserverance
#Improved Dark On's Belssing   
#Improved Fate of the Void
#Improved Initiative
#Improved Misty Step
#Inspired Recovery
#Ioun's Poise
#Jack of all Trades
#Kord's Favor
#Lethal Hunter
#Light Step
#Linguist
#Long Jumper
#Lost in the Crowd
#Melora's Tide
#Moradin's Resolve
#Mounted Combat
#Nimble Blade
#Pelor's Radiance
#Potent Challenge
#Power Attack
#Powerful Charge
#Precise Hunter
#Press the Advantage
#Quick Draw
#Raging Storm
#Raven Queen's Blessing
#Ritual Caster
#Sehanine's Reversal
#Shield Proficiency (Heavy)
#Shield Proficiency (Light)
#Shield Push
#Skill Focus
#Skill Training
#Sure Climber
#Surprise Knockdown
#Tactical Assault
#Toughness
#Two-Weapon Defense
#Two-Weapon Fighting
#Weapon Focus
#Weapon Proficiency
#Wintertouched

#Paragon Tier Feats
#Action Recovery
#Agile Athlete
#Arcane Reach
#Armor Specialization (Chainmail)
#Armor Specialization (Hide)
#Armor Specialization (Plate)
#Armor Specialization (Scale)
#Back to the Wall
#Blood Thirst
#Combat Anticipation
#Combat Commander
#Danger Sense
#Deadly Axe
#Defensive Advantage
#Devastating Critical
#Distant Shot
#Dwarven Durability
#Empowered Dragon Breath
#Evasion
#Feywild Protection 
#Fiery Rebuke
#Fleet-Footed
#Great Fortitude
#Hammer Rhythm
#Heavy Blade Opportunity
#Improved SEcond Wind
#Inescapable Force
#Iron Will
#Lasting Frost
#Light Blade Precision
#Lightning Arc
#Lightning Reflexes
#Mettle
#Point-Blank Shot
#Polearm Gamble
#Psychic Lock
#Resounding Thunder
#Running Shot
#Scimitar Dance
#Second Implement
#Secret Stride
#Seize the Moment
#Shield Specialization
#Sly Hunter
#Solid Sound
#Spear Push
#Spell Focus
#Steady Shooter
#Sweeping Flail
#Twofold Curse
#Uncanny Dodge
#Underfoot



#Epic Tier Feats
#Arcane Mastery 
#Axe Mastery
#Blind-Fight
#Bludgeon Mastery
#Epic Resurgence
#Flail Mastery
#Flanking Maneuver
#Font of Radiance
#Heavy Blade Mastery
#Irrestible Flame
#Light Blade Mastery
#Pick Mastery
#Spear Mastery
#Spell Accuracy
#Triumphant Attack
#Two-Weapon Flurry
#Unfettered Stride


#Multiclass Feats
#Initiate of the Faith
#Student of the Sword
#Soldier of the Faith
#Warrior of the Wild
#Sneak of Shadows
#Pact Initiate
#Student of Battle
#Arcane Initiate
#Novice Power
#Acolyte Power
#Adept Power

# @racialfeatures=(make this the seventh and eighth element in the race array, the first 6 would be up/down stat values for each face
#
#@lvlrange=("1-10: Heroic","11-20: Paragon","21-30: Epic"); 
#$level=[
#[0,"1st","see race","class features;racial traits;gain 1 feat;train starting skills;gain 2 at-will attack powers;gain 1 encounter attack power;gain 1 daily attack power","1**",2,1,1,0],
#[1000,"2nd","-","gain 1 utility power;gain 1 feat",2,2,1,1,1],
#[2250,"3rd","-"."gain 1 encounter attack power",2,2,2,1,1],
#[3750,"4th","+1 to two","gain 1 feat",3,2,2,1,1],
#[5500,"5th","-","gain 1 daily attack power",3,2,2,2,1],
#[7500,"6th","-","gain 1 utility power,gain 1 feat",4,2,2,2,2],
#[10000,"7th","-","gain 1 encounter attack power",4,2,3,2,2],
#[13000,"8th","+1 to two","gain 1 feat",5,2,3,2,2],
#[16500,"9th","-","gain 1 daily attack power",5,2,3,3,2],
#[20500,"10th","-","gain 1 utility power, gain 1 feat",6,2,3,3,3],
#[26000,"11th","+1 to all","paragon path features; gain 1 paragon path encounter attack power; gain 1 feat",7,2,4,3,3],
#[32000,"12th","-","gain 1 paragon path utility power; gain 1 feat",8,2,4,3,4],
#[39000,"13th","-","replace 1 encounter attack power,8,2,"4*",3,4],
#[47000,"14th","+1 to two","gain 1 feat",9,2,4,3,4],
#[57000,"15th","-","replace 1 daily attack power",9,2,4,"3*",4],
#[69000,"16th","-","paragon path feature;gain 1 utility power;gain 1 feat",10,2,4,3,5],
#[83000,"17th","-","replace 1 encounter attack power",10,2,"4*",3,5],
#[99000,"18th","+1 to two","gain 1 feat",11,2,4,3,5],
#[119000,"19th","-","replace 1 daily attack power",11,2,4,"3*",5],
#[143000,"20th","-","gain 1 paragon path daily attack power; gain 1 feat",12,2,4,4,5],
#[175000,"21st","+1 to all","-","epic destiny feature; gain 1 feat",13,2,4,4,5],
#[210000,"22nd","-","gain 1 utiity power;gain 1 feat",14,2,4,4,6],
#[255000,"23rd","-","replace 1 encounter attack power",14,2,"4*",4,6],
#[310000,"24th","+1 to two","epic destiny feature;gain 1 feat",15,2,4,4,6],
#[375000,"25th","-","replace 1 daily attack power",15,2,4,"4*",6],
#[450000,"26th","-","gain 1 epic destiny utility power;gain 1 feat",16,2,4,4,7],
#[550000,"27th","-","replace 1 encounter attack power",16,2,"4*",4,7],
#[675000,"28th","+1 to two","gain 1 feat",17,2,4,4,7],
#[825000,"29th","-","replace 1 daily attack power",17,2,4,"4*",7], 
#[1000000,"30th","-","epic destiny feature;gain 1 feat",18,2,4,4,7]
#];
#  *  At these levels you replace a known power with a new poewr of your new level
#  ** Humans gain one additional feat at 1st level.  Some classes grant additional feats as well

#@monstrace("Storm Giant", "Goliath",  "Vampire", "Raksasha", "Minotaur", "Half-Orc", "Leprechaun", "Doppleganger", "Lycanthrope", "Hill Giant","Troll","Goblin,"Ogre","Ogre-Magi","Troglodyte","Ghost","Illithid","Bugbear","Efreeti","Archon","Elemental","Angel","Devil","Demon","Sahuagin","Lich","Dragon"); 
#@familiar=("Bat","Book Imp","Bound Demon","Cat","Crafter Homunculus","Dragonling","Falcon","Owl","Rat","Raven","Serpent","Spider"); 

#@secskill=("Armorer","Bowyer/Fletcher","Farmer/Gardener","Fisher (netting)","Forester","Guide","Gambler","Hunter / Fisher (Hook & Line)","Husbandman (Animal Husbandry","Jeweler / Lapidary","Leather Worker / Tanner", "Painter","architect","Mason / Carpenter","Miner","Navigator (fresh and salt water)","Sailor","Shipwright","Tailor / Weaver", "Teamster / Freighter","Trader / Barterer","Trapper / Furrier","Woodworker / Cabinet Maker","Brewer","Herald / Public Speaker","Comedian / Jester","Cook / Chef", "Writer / Scribe", "No skill of measureable worth");
#@alignment=("Lawful Good","Lawful Neutral","Lawful Evil","Neutral Evil","True Neutral","Chaotic Evil","Chaotic Neutral","Chaotic Good","Neutral Good");
#@wealth("none","scant","average","above average","exceptional","super abundant");
#@appearanceage=("young","youthful","mature","middle-aged","old","ancient");
#@appearancegen=("dirty","clean","unkempt","immaculate","rough","rugged","foppish","regal","royal","non-descript","imposing","intimidating");
#@sanity=("very stable","normal","neurotic","unstable","psychotic","insane","maniacial");
#@traits=("optomist","pessimist","hedonist","altruist","helpful/kindly","careless","capricious","mischievous","sober","drunk","curious/inquisitive","moody","trusting","suspicious/cautious","precise/exacting","perceptive","opinionated/contrary","violent/warlike","studious","foul/barbaric","cruel/callous","practical joker/prankster","servile/obsequious","fanatical/obsessive","malevolent","loquacious","sadist","masochist");
#@personalitymain=("Average","Extroverted","Introverted");
#@personalityaverage=("modest","egoist/arrogant","friendly","aloof","hostile","well-spoken","diplomatic","abrasive");
#@personalityextroverted=("forceful","overbearing","friendly","blustering","antagonistic","rude","rash","diplomatic");
#@personalityintroverted=("retiring","taciturn","friendly","aloof","hostile","rude","courteous","solitary","secretive","regal","royal");
#@disposition=("cheerful","morose","compassionate/sensitive","unfeeling/insensitive","humble","proud/haughty","even-tempered","hot-tempered","easy going","harsh");
#@intellect=("dull","average","active","dreaming","ponderous","anti-intellectual","scheming","brilliant");
#@nature=("soft-hearted","forgiving","hard-hearted","unforgiving","jealous","vengeful","vindictive","punisher");
#@materialism=("aesthetic","intellectualist","average","covetous","greedy","avaricious");
#@honesty=("scrupulous","very honorable","truthful","average","liar","deceitful");
#@bravery=("normal","foolhardy","brave","fearless","cowardly","craven");
#@energy=("slothful,lazy,normal,energetic,driven"); 
#@thrift=("miserly,mean,thrifty,average,spendthrift,wastrel");
#@morals=("aesthetic,virtuous,normal,lusty,lustful,immoral,amoral,perverted,sadistic,depraved"); 
#@piety=("saintly,martyr/zealot,pious,reverant,average,impious,irreverant,iconoclastic,irreligous");
#@interest=("religion,legends,history,nature,horticulture,husbandry,exotic animals,hunting,fishing,handicrafts,athletics,politics,wine & spirits,foods & preparations,gambling/games,drugs,collector (see collections), community service,altruism,clocks,horses,pets,puzzles,none,medical,architecture,fighting,weapons,history,sailing/boating,research,sewing,landscaping,decorating,geography/maps,swimming,climbing");
#@collections=("Weapons-Knives and daggers,Weapons-Swords,Weapons-Exotic,shields,armor,books & scrolls,mineral & gems,ornaments & jewelry,coins/tokens,trophies & skins,porcelain,china, crystal,artwork-paintings, artwork-tapestries,artwork-statues,artwork-carvings");
#@equiparmor=("");
#@equipweapons=("");
##@equipslot(1....xxx); 

