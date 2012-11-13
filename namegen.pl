#!/usr/bin/perl

@elements = qw(
  abig ad adri agard agath aid albert alethe and alexi alfred alm
  alt althe alv alvir amand ameli anc andre angel ann anthe antoni
  aren arb arci aric arili arit arlen arlott aronic arri arth ashli
  astasi athsheb atild atri audre august aureli auror avel averli
  bell be bern berth beth beul bonni bridgi brunild carinn cat cecili
  chlo clar claudi col colen consuel corneli cor cosett cyndi dan
  dari darl debor del dolor dulci dorothe dor edn elaid ell ev fann
  fausti feli ferd fifi flor franci fred genev georgi gild gin giov 
  giuli glori gret griseld gunill gwend helg hephzib henri herth
  honori horati huld hermi hest is jessic jeann jemim jo kristi laur
  le len lind lis livi lol lon lor lorn louis luci magd mari mir mil
  mind mon monic nad ness nicol non nor norm ori priscill penel polli
  raciel rebecc regin rhod robert ros sand shirl sib son stell steph
  sus sylvi tar tess tiff trici ver vinni viv wilm yol);

@ends = qw(a abel alison amy chen ie ietty icia ietta ina);


$name =
    $elements[rand @elements] . 'X' .
    $elements[rand @elements] . 'X' .
    $ends[rand @ends];

$name =~ s/([^aeiouy])X([^aeiouy])/$1a$2/g;
$name =~ s/(.)X\1/$1/g;
$name =~ s/X//g;

print ucfirst($name), "\n";
