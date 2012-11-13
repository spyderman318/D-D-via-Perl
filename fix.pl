#!/usr/local/bin/perl
#
# fix - adds some prefixes and suffixes to lc's output to make it
#       look more like a real language.  The affixes are taken from
#       the lc output and then added to it, too.  The number of
#       affixes is equal to the number of words you feed fix, divided
#       by ten.  Some attempt is made to put the affix in the right
#       place & to ensure that it'll be pronounceable.
#
# Written by Christopher Pound (pound@rice.edu) November 1996.
#
srand(time);
$howlong=int(rand(3))+2;
@basic=<>;
@words=@basic;
$lim=int($#basic/10)+1;
while ($found < $lim) {
  $word=splice(@words, rand @words, 1);
  chop($word);
  $pre=0;
  if ((int(rand(3))+1) == 3) { $fix=substr($word,0,$howlong); $pre=1; }
  else { $fix=substr($word,length($word)-$howlong,$howlong); }
  next unless ($fix=~/[aeiouy]/);
  $found++;
  $fixes{$found}=$pre.'#'.$fix;
}
foreach $w (@basic) {
  chop($w);
  if (int(rand(2))) { print "$w\n"; next; }
  $fix=$fixes{int(rand($lim))+1};
  ($pre,$fix)=split('#',$fix,2);
  if ($fix=~/^[aeiouy]/) { $vp=1; }
  if ($fix=~/[aeiouy]$/) { $vs=1; }
  if ($pre) {
    if (($w=~/^[aeiouy]/)&&($vs)) { $w=substr($w,1,length($w)-1); }
    $w=~y/A-Z/a-z/;
    print "$fix$w\n";
  }
  else {
    if (($w=~/[aeiouy]$/)&&($vp)) { $w=substr($w,0,length($w)-1); }
    $fix=~y/A-Z/a-z/;
    print "$w$fix\n";
  }
}
