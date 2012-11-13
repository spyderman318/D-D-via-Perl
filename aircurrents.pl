#!/usr/bin/perl
# aircurrents.pl
@airstr=qw/very-slight slight strong very-strong gusting moaning still/;
@airtemp=qw/cool cold chill average very-chill freezing warm hot very-hot burning/;
@airdir=qw/updraft downdraft neither-up-nor-down indeterminate swirling chaotic/;
@airtype=qw/breeze wind gust still/;
@airdesc=qw/constant intermittent/;

$a1cnt=int(rand($#airstr +1));
$a2cnt=int(rand($#airtemp +1));
$a3cnt=int(rand($#airdir +1));
$a4cnt=int(rand($#airtype +1));
$a5cnt=int(rand($#airdesc +1));

print "There is a $airstr[$a1cnt] $airdesc[$a5cnt] $airtemp[$a2cnt] $airdir[$a3cnt] $airtype[$a4cnt] \n";

#breeze, slight  DMG1  1
#breeze, slight, damp  DMG1  2
#breeze, gusting   DMG1  3
#cold current  DMG1  4
#downdraft, slight   DMG1  5
#downdraft, strong   DMG1  6
#still   DMG1  7
#still, very chill   DMG1  8
#still, warm (or hot)  DMG1  9
#updraft, slight   DMG1  10
#updraft, strong   DMG1  11
#wind, strong  DMG1  12
#wind, strong, gusting   DMG1  13
#wind, strong, moaning   DMG1  14

