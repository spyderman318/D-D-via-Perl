#!/usr/local/bin/perl
#
# prop - turn output from "lc" into proper names;
# 	excess short or long words may be discarded.
# written by Christopher Pound (pound@rice.edu) Oct 1995.
#
# Run as "lc -[number of words] datafile | prop"
#
# prop puts together one short name and one long name.
# Define the number of vowels a short name has right HERE:

$vowel_cutoff=3;

#
#
srand(time);
while(<>){
  chop;
  ($c, $v)=0;
  @a=split('',$_);
  while(@a){
    $c=pop@a;
    if ($c=~/[aeiou]/) {$v++;}
  }
  if ($v < $vowel_cutoff) {push(@short,$_);}
  else {push(@long,$_);}
}
if ($#short > $#long) {$#short=$#long;}
else {$#long=$#short;}
while(@short){
  $a=pop(@short);
  $ai=substr($a,0,1);
  $ai=~tr/[a-z]/[A-Z]/;
  substr($a,0,1)=$ai;
  $b=pop(@long);
  $bi=substr($b,0,1);
  $bi=~tr/[a-z]/[A-Z]/;
  substr($b,0,1)=$bi;
  if (int(rand(2))) {print "$a $b\n";}
  else {print "$b $a\n";}
}
