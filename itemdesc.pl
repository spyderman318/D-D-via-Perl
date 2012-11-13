#!/usr/bin/perl
#itemdesc.pl
@idesc=qw/Bone Ivory Ceramic Cloth Crystal Glass Gold Granite Leather Liquid Hard-Metal Soft-Metal Mirror Obsidian Parchment Pearl Silver Stone Gem Wood Thin-Rope Thick-Rope/;
$idesccnt=int(rand($#idesc +1));

if ($idesccnt == 18)
  {
  @gem=qw/diamond citrine peridot jasper tourmaline topaz lapiz-lazuli emerald sapphire amethyst onyx/;
  $gemcnt =int(rand($#gem + 1));
  $idesc[$idesccnt] = $gem[$gemcnt];
  }
print "Item made of $idesc[$idesccnt] \n";
