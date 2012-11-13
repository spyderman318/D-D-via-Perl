#!/usr/bin/perl -w
#
#  http://www.mail-archive.com/eug-lug@efn.org/msg01147.html
# Script for creating a cryptogram out of plaintext
# By:      Rob Hudson <[EMAIL PROTECTED]>
# Created: 22 Jan 2000
# Updated: 07 Feb 2000 : Changed to using FYShuffle
# Updated: 15 Apr 2000 : Added fortune support
use Text::Wrap;
my $text = "";
my @lines;
my $alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

## Set up fortune locale
## You may need to change this to match your system
my $fortune_dir = "/usr/share/games/fortunes/";

## Which files you don't want quotes pulled from
## A list of files separated by '|'
my $exclude = "ascii-art|translate-me";

if (@ARGV && $ARGV[0] ne '-f') {
  my $inFile = $ARGV[0] if ($ARGV[0] ne "") or die "No file specified\n";
  # Read it, Scrunch it, Up it.
  open IN, $inFile or die "Can't open input file: $!";
  while (<IN>) {     
    s/[\s]+/ /g;
    $text .= $_;
  }
  close (IN);

  print "\nHere is your quote:\n\n";
}
else {
  opendir FORTUNE_DIR, $fortune_dir or die "Can't read directory $fortune_dir: $!";
  my @files = grep !/^\.|.dat$|$exclude/, readdir FORTUNE_DIR;

  # Pick a random file from which to get the fortune
  my $fortune_file = $files[rand @files];

  # This is inefficient from a memory usage standpoint, but it's much easier
  $/ = '%';
  open FILE, "$fortune_dir$fortune_file" or die "Can't open file: $!";
  while (<FILE>) {
    push @lines, $_;
  }
  close (FILE);

  $text = $lines[rand @lines];
  $text =~ s/%$//g;       # remove the % 
  $text =~ s/[\s]+/ /g;   # make spacing uniform
  $text =~ s/^\s+//g;     # remove whitespace at beginning

  print "\nQuote taken from fortune file '" . $fortune_file . "':\n\n";
}

## Start cryptogram processing
$text = uc($text);
# print wrap ("","", $text), "\n\n";

## Build random alphabet string, not allowing repeat letters
my @alpha = split //, $alpha;
my $substit = join '', fisher_yates_shuffle(\@alpha);

## Have to use an eval since $vars don't get interpreted inside a tr call.
eval "\$text =~ tr/$alpha/$substit/";
print wrap ("","", $text), "\n\n";

## Taken from perlfaq4 (thanks btrott)
sub fisher_yates_shuffle {
  my $array = shift;
  for (my $i = @$array; --$i; ) {
    my $j = int rand ($i+1);
    next if $i == $j;
    @$array[$i, $j] = @$array[$j, $i];
  }
  return join '', @$array;
}

