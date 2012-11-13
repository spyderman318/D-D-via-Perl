#!/usr/bin/perl
#
# lc -- language confluxer (http://www.ruf.rice.edu/~pound/revised-lc)
#
# - Written by Christopher Pound (pound@rice.edu), July 1993.
# - Loren Miller suggested I make sure lc starts by picking a
#   letter pair that was at the beginning of a data word, Oct 95.
# - Cleaned it up a little bit, March 95; more, September 01
#
# The datafile should be a bunch of words from some language
# with minimal punctuation or garbage (# starts a comment!!!!).  Try 
# mixing and matching words from different languages to get just 
# the balance you like.  The output of course needs some editing.
#
# If you happen to have a unix-style command line, run it as 
# "lc -[number of words you want] datafile" or "lc -s [datafile]"
# to see the distribution produced by the words in your dataset.
# Format your output further using either my "prop" script or
# the "pr" command.  Try "lc -50 datafile | prop" or maybe
# "lc -392 datafile | pr -7"

# If you don't have a unix-style command line, set $unix to 0
# and set the $file and $number parameters by hand each time:
$unix = 1;
$file = 'language_file.txt';
$number = 25;

# Define the limits on good word lengths ...
$min_length = 3;
$max_length = 7;

# Seed the random number generator and parse arguments (if unix)
srand(time);
($unix and (@ARGV == 2) and ($file = pop(@ARGV)) and ($number = pop(@ARGV)) 
  and (($number =~ /^-\d+$/) or ($number =~ /^-s/)))
  or ($unix and die "usage: $0 -[s|#] filename\n");
$number =~ s/-//;

# Read in the data, cleaning it up as we go, and making it one long array
open(INFILE, $file) or die "$0: $file not found\n";
while (<INFILE>) {
  s/#.*//;
  next unless length;
  s/^\s*//; 
  s/\s*\n//; 
  s/\s+/ /;
  push(@data, ' ', split('', $_)); 
}

# Let's assume the first letter could follow the last pair (loop around)
push(@data, ' ', $data[1]);

# Now, load our hash of character pairs and the letters that may follow them,
# keeping track of which pairs can be at the start of a word
while (@data > 2) {
  ($first, $second, $third) = @data[0..2];
  $hash{$first.$second} .= $third;
  push(@start_pairs, $second.$third) if ($first eq ' ');
  shift @data; 
}

# Oh, so you just want to see a representation of our hash??? OK.
($number eq 's') and (print map { "$_:$hash{$_}\n" } keys %hash) and exit;

# Loop to generate new words, beginning with a start_pair; find a word,
# then continue to the next word using the last two characters (the last
# of which will be whitespace) from the previous word as a "seed" for the new;
# oh, and only print the first $max_length characters of any words
$new = $start_pairs[rand @start_pairs];
for (1..$number) {
  $new = &new_word(substr($new, -2, 2));
  print substr($new, 0, $max_length), "\n";
}

# Messy recursive function to build a word, getting rid of short words 
# and handling "seeds" from previous words properly
sub new_word {
  my $word = pop;
  my $pair = substr($word, -2, 2);
  my $letter = substr($hash{$pair}, rand length($hash{$pair}), 1);
  if ($word =~ /\s$/) {
    return $word if (length($word) > $min_length);
    return &new_word(substr($word, -1, 1).$letter);
  } else {
    $word =~ s/^\s//;
    return &new_word($word.$letter);
  }
}

