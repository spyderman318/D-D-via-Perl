#!/usr/bin/perl -w
# from http://www.perlmonks.org/index.pl?node_id=166379
# original code by graff

#TK notes for study
# GREAT Stuff here!!! http://phaseit.net/claird/comp.lang.perl.tk/ptkF
+AQ.html
# Good tutorial : http://www.bin-co.com/perl/perl_tk_tutorial/
# Good information here as well: http://www.ida.liu.se/~tompe/perltk/i
+ndex.html

# TO DO
#  take selected word(s) from a pattern and test it as a part of the s
+olution.

use strict;
use Tk;
use Text::Autoformat;

my ($puzStr, $solutionStr, %ent, %lbl);
my ($crypto, $solution, $List, $trStr1, $trStr2, @template, @patterns)
+;
my $patterns = "";
my @letters = qw/a b c d e f g h i j k l m n o p q r s t u v w x y z/;
+  # lower case
my @Letters = qw/A B C D E F G H I J K L M N O P Q R S T U V W X Y Z/;
+  #ALL CAPS
my $tfont = "Courier 12";
my $lfont = "Courier 10";
my $file_passed = "";

if ($ARGV[0] ne "") {$file_passed = $ARGV[0]; }
    else {print "no file passed!!!\n"; exit; }

my $which_dict = "<../sortedpatterns.txt";   # NO ZERO OCCURRENCES;
# This file is created by another perl script I use to read a file con
+taining all the cryptograms I have solved
# to create a list of patterns sorted by word length, the pattern, and
+ the frequency of use.
#FORMAT
#   Number of Letters - PATTERN - WORD - Occurences
#   3 =11 ALL 731
#   3 =11 TOO 212
#  .
#  .
#  .
#  .
#3 === THE 7933
#3 === AND 2983
#3 === YOU 2593
#3 === ARE 1348
# The much larger file includes words that I have yet to encounter but
+ are found in a dictionary of common words.
# Both of these files are available at my website:
# http://www.happenstance-music.com/sortedpatterns.txt  390k   (curren
+t on 9/23/09)
# http://www.happenstance-music.com/sorted-combined-patterns.txt  2.7m
+b  (current on 9/23/09)

#if ($d) {
#    $which_dict = "<../sorted-combined-patterns.txt";  # THE BIG ONE
#}

open(DICT, $which_dict) || die "$which_dict: $!\n";
chomp(my @dict = <DICT>);
close DICT;

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
+# # # # # # # # # # #
#   THIS IS THE TOP OF THE MAINLOOP!
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
+# # # # # # # # # # #
my $main = MainWindow->new;
my $bg = $main->cget('-background');
my $fg = $main->cget('-foreground');

#$main->Label(-text => "Type the cryptogram puzzle in this box and hit
+ the \"Enter\" key:",
$main->Label(-text => "Click on \"Read File\", put cursor at the end o
+f the puzzle and press the \"Enter\" key:",
             -font => $lfont
             )->pack(-side => 'top');
$main->Button(
            -text    => 'Read File',
            -command => sub { &readFile },
            )->pack;
$main->Button(
            -text    => 'Quit',
            -command => sub { &Quit },
            )->pack;
             
my $puzzle = $main->Text(-relief => 'sunken',
                         -width => 126, -height => 3,
                         -font => $tfont,
                         -wrap => 'word',
                         -spacing1 => '5p', -spacing2 => '5p', -spacin
+g3 => '5p'
                         )->pack(-side => 'top');

my $nxt = $main->Label(-text => "Now type a letter in each of these bo
+xes to decode it:",
                       -font => $lfont,
                       -foreground => $bg
                       )->pack(-side => 'top');
my $frm = $main->Frame()->pack(-side => 'top', -pady => 2);  # pady SP
+ECIFIES HOW MUCH VERTICAL EXTERNAL PADDING TO LEAVE ON EACH SIDE??? 

my $row = my $col = 1;
foreach my $c (@letters) 
{
    $lbl{$c} = $frm->Label(-text => " $c>",
                           -font => $tfont,
                           -foreground => $bg
                           )->grid(-row => $row,
                                   -column => $col++);
    $ent{$c} = $frm->Entry(-width => 1,
                           -font => $tfont,
                           -borderwidth => 2,
                           -relief => 'flat'
                           )->grid(-row => $row,
                                   -column => $col++ );
    if ( $c eq 'm' ) {
        $row = 2, $col = 1;
    }
}
$row = 3; $col = 12;
my $btn1 = $frm->Button(-text => "Show Counts",
             -command => \&scSub,
             -state => 'disabled',
             )->grid(-row => $row,
                     -column => $col,
                     -columnspan => 5 );
$row = 4; $col = 12;
my $btn2 = $frm->Button(-text => "List Patterns / Suggest Words",
             -command => \&listPatterns,
             -state => 'disabled',
             )->grid(-row => $row,
                     -column => $col,
                     -columnspan => 5 );
$row = 5; $col = 12;
my $btn3 = $frm->Button(-text => "Print Solved",
             -command => \&printSolved,
             -state => 'disabled',
             )->grid(-row => $row,
                     -column => $col,
                     -columnspan => 5 );
                      
            my $lst = $main->Label(-text => "The solution will appear 
+below:", 
                       -font => $lfont,
                       -foreground => $bg
                       )->pack(-side => 'top');
my $solutn = $main->Text(-relief => 'raised',
                         -width => 126, -height => 6,
                         -font => $tfont,
                         -wrap => 'word',
                         -spacing1 => '5p', -spacing2 => '0p', -spacin
+g3 => '1p'
                         )->pack(-side => 'top');

$main->bind( 'Tk::Entry', '<KeyRelease>', [\&krSub, Ev('K')] );
$main->bind( 'Tk::Entry', '<Enter>', \&enSub );

$puzzle->bind( "<Return>" => sub { 
    $puzStr = lc $puzzle->get('1.0','end');
    $puzStr =~ s/\s+$//;
    $crypto = $puzStr;
    $puzStr =~ s/ /  /g;
    $puzzle->delete('1.0','end'), $puzzle->insert('1.0',$puzStr);
    foreach my $c (@letters) {
        $ent{$c}->delete(0,'end');
        if ( $puzStr =~ /$c/ ) {
            $ent{$c}->configure(-state => 'normal', -relief => 'sunken
+');
            $ent{$c}->insert(0,"_");
            $lbl{$c}->configure(-foreground => $fg);
        } else {
            $ent{$c}->configure(-state => 'disabled', -relief => 'flat
+');
            $lbl{$c}->configure(-foreground => $bg);
        }
    }
    $nxt->configure(-foreground => $fg);
    $lst->configure(-foreground => $fg);
    $btn1->configure(-state => 'normal');
    $btn2->configure(-state => 'normal');
    $btn3->configure(-state => 'normal');
    &updateSlvd; 
});

MainLoop;

sub Quit { exit; }

    # Read in a file
sub readFile {
    if ($file_passed ne "") { 
        open(CRYPTO, $file_passed) || die "$file_passed: $!\n";
        $puzStr = <CRYPTO>;
        chomp $puzStr;
        $puzStr = lc $puzStr;
        $crypto = $puzStr;
    }
    &buildPatterns;
    $puzStr =~ s/\s+$//;
    $puzzle->delete('1.0','end'), $puzzle->insert('1.0',$puzStr);
}

# KEY HAS BEEN RELEASED -  THIS IS WHERE WE HAVE ENTERED A LETTER TO B
+E TRANSLATED
sub krSub {
    my ( $w, $c ) = @_;
    if ( $c !~ /^[a-z]$/i ) {
        $w->delete(0,'end'), $w->insert(0,'_');
    } else {
        foreach my $l (@letters) {
            next if ( $w eq $ent{$l} );
            if ( $c eq $ent{$l}->get ) {
                $ent{$l}->delete(0,'end'), $ent{$l}->insert(0,'_');
            }
        }
    }
    &updateSlvd;
    $w->selectionRange(0,'end');
}

# ENTER HAS BEEN PRESSED 
sub enSub {
    my $w = $_[0];
    $w->selectionRange(0,'end');
    $w->focus;
}

# SHOW COUNTS SUBROUTINE
sub scSub {
    my %cnt = ();
    my ( $n, $chk );
    my $maxn = my $maxw = 0;
    foreach my $c (@letters) {
        $chk = $puzStr;
        $chk =~ s/[^$c]//g;
        $n = length( $chk );
        $cnt{$n} .= " $c";
        $maxn = $n if ( $maxn < $n );
        $n = length( $cnt{$n} );
        $maxw = $n if ( $maxw < $n );
    }
    my $top = $main->Toplevel(-title => 'Crypto-count');
    $n = scalar( keys( %cnt ));
    $maxw += 5;
    my $txt = $top->Text(width => $maxw,
                         height => $n,
                         font => $lfont
                         )->pack;
    $top->Button(-text => "Dismiss",
                 -command => sub { $top->destroy }
                 )->pack;
    for ( $n=$maxn; $n>0; $n-- ) {
        if ( exists( $cnt{$n} )) {
            $txt->insert( 'end', sprintf( "%3d %s\n", $n, $cnt{$n} ));
        }
    }
}

# PRINT SOLVED CRYPTOGRAM TO A TEXT BOX
sub printSolved {
    local $_ = $crypto;
    my $solved = "";
    my $maxw = 100;
    my $top2 = $main->Toplevel(-title => 'Cryptogram Solved');
    $maxw += 5;
    my $txt = $top2->Text(width => $maxw,
                         height => 5,
                         font => $lfont
                         )->pack;
    $top2->Button(-text => "Dismiss",
                 -command => sub { $top2->destroy }
                 )->pack;
    eval "tr/$trStr1/$trStr2/"; 
    $solved  = $_; 
    my $formatted = autoformat $solved, { case => 'sentence', right =>
+ 123 };
    $solved = $solved . "\n" . $formatted;
    #print "\$trStr1:$trStr1\n\$trStr2:$trStr2\n\$crypto: $crypto\n\$s
+olved: $solved\n";
    $txt->insert( 'end', $solved);

}
# UPDATE SOLVED TEXT  - 

sub updateSlvd
{
    local $_ = $puzStr;
    $trStr1 = $trStr2 = "";
    foreach my $c (@letters) {
        my $t = uc $ent{$c}->get;
        if ( $t ne "" ) {
            $trStr1 .= $c;
            $trStr2 .= $t;
        }
    }
    eval "tr/$trStr1/$trStr2/";
    my $solution = $patterns . "\n" . $puzStr . "\n" . $_;
    $solutionStr = $_;
    #$solutn->delete('1.0','end'), $solutn->insert('1.0',$_);
    $solutn->delete('1.0','end'), $solutn->insert('1.0',$solution);
}

sub selectWord {
    #print "nothing here yet....\n";
    #print "future enhancement is to take the selected word, and trans
+late using it to see\n";
    #print "if it might be the right one.\n";
    #print "an extremely useful enhancement would be to do this with m
+ultiple words.\n";
}

sub selectPattern {
    my $selectedIndex =    $List->curselection();
    my $selected = $List->get($selectedIndex);
    my @pattern_list = grep {/ $selected /} @dict;
    my $top = $main->Toplevel(-title => 'List Patterns');
    my $maxn = $#pattern_list;
    my $maxw = 50;
    my $maxh = $maxn +5;
    my $n;
    my $WordList = $top->Listbox(-selectmode=>'single',
                -height=>$maxh,
                -width=>$maxw)->pack;
    $top->Button(-text => "Select a word/pattern",
                 -command => sub { &selectWord }
                 )->pack;
    $top->Button(-text => "Dismiss",
                 -command => sub { $top->destroy }
                 )->pack;
    for ( $n = 0; $n <= $maxn; $n++ ) {
            $WordList->insert( 'end', $pattern_list[$n] );
    }
}

sub listPatterns {
my $top = $main->Toplevel(-title => 'Select Pattern');
    my $maxn = $#patterns;
    my $maxw = 50;
    my $maxh = $maxn +5;
    my $n;
    #foreach my $word (@patterns) {
    #    print "$word \n";
    #}

$List = $top->Listbox(-selectmode=>'single',
                -height=>$maxh,
                -width=>$maxw)->pack;

#    my $top = $main->Toplevel(-title => 'patterns');
    $top->Button(-text => "Select a word/pattern",
                 -command => sub { &selectPattern }
                 )->pack;
    $top->Button(-text => "Dismiss",
                 -command => sub { $top->destroy }
                 )->pack;
    for ( $n = 0; $n <= $maxn; $n++ ) {
            $List->insert( 'end', $patterns[$n] );
    }
}

sub suggestions {
    my $maxn = $#patterns;
    my $maxw = 50;
    my $maxh = $maxn +5;
    my $n;
    my $top = $main->Toplevel(-title => 'patterns');
    my $txt = $top->Text(width => $maxw,
                         height => $maxh,
                         font => $lfont
                         )->pack;
    $top->Button(-text => "Select a word/pattern",
                 -command => sub { &selectWord }
                 )->pack;
    $top->Button(-text => "Dismiss",
                 -command => sub { $top->destroy }
                 )->pack;
    for ( $n = 0; $n <= $maxn; $n++ ) {
            $txt->insert( 'end', sprintf( "%2d %s\n", $n, $patterns[$n
+] ));
    }
}

#Build a pattern
sub doword {   
    #print "DOWORD SUB\n";
    my $cryptogram;
    #my $doword = uc shift;   #DON'T UPPERCASE IT SINCE IN THIS PROGRA
+M WE DIFFERENTIATE BETWEEN SOLVED AND UNSOLVED LETTERS BY UPPER/LOWER
+ CASE
    my $doword = shift;
    my $len = length $doword;
    my $pat = '';
    my $got_a_pattern = 0;
    my $solution;
    my @hits = ();
    my @matchset = ('1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 
+'B', 'C', 'D', 'E');
    my ($i,$j,$match,$newmatch,$mc);
    for ($i = 0; $i < $len; $i++) {
        if (substr($doword,$i,1) ne "-") { substr($pat,$i,1) = "="; }
        else { substr($pat,$i,1) = '-'; }
        
        if (substr($doword,$i,1) eq ":") { substr($pat,$i,1) = substr(
+$doword,$i,1); }
        if (substr($doword,$i,1) eq "'") { substr($pat,$i,1) = substr(
+$doword,$i,1); }
        if (substr($doword,$i,1) eq ",") { substr($pat,$i,1) = substr(
+$doword,$i,1); }
        if (substr($doword,$i,1) eq ".") { substr($pat,$i,1) = substr(
+$doword,$i,1); }
        if (substr($doword,$i,1) eq "!") { substr($pat,$i,1) = substr(
+$doword,$i,1); }
        if (substr($doword,$i,1) eq "?") { substr($pat,$i,1) = substr(
+$doword,$i,1); }
        if (substr($doword,$i,1) eq "\"") { substr($pat,$i,1) = substr
+($doword,$i,1); }
        if (substr($doword,$i,1) eq "_") { substr($pat,$i,1) = substr(
+$doword,$i,1); }

        for ($j = 0; $j < 26; $j++) {
            if (substr($doword,$i,1) eq $letters[$j]) { 
                $hits[$j]++; 
            }
        }
    } # (end of first big "for loop"   
    for ($j = 0; $j < 52; $j++) {
        if (defined $hits[$j]) {
            if ($hits[$j] > 1) { 
                $got_a_pattern = 1; 
            }
        }    
    } # (end of this little "for loop"
    if ($got_a_pattern)  {
        $match = 0;
        $newmatch = 0;
#       go through the word a letter at a time
        for ($i = 0; $i < $len; $i++) {
            if (substr($pat,$i,1) eq '=') {
                if ($newmatch > 0) { 
                    $match++; 
                    $newmatch = 0;
                }
                $mc = $matchset[$match];    
            }       
        #   go through the rest of the word beginning at $i+1
        #   if not already matched
            if (substr($pat,$i,1) eq '=') {
                for ($j =$i+1; $j < $len; $j++) {
                    if (substr($doword,$i,1) eq substr($doword,$j,1)) 
+{
                        substr($pat,$i,1) = $mc;
                        substr($pat,$j,1) = $mc;
                        $newmatch++;
                    }
                }
            }
        } # (end of for loop)
    } # (end of if $pattern loop)
    return $pat;
}    # (end of doword subroutine)

# Get an array of all the words 
sub  extractTemplates {
    my $crypt = shift;
    # extract templates by splitting on whitespace
    my  @template2 = split / /,$crypt;
    # remove leading and trailing punctuation
    # add templates not already in the list, to the template list
    my $which_word = 0;
    foreach ( @template2 ) {
        my $len1 = (length $_) -1;
        $which_word++;
    }
    foreach (@template2) {
        $_  =~ tr/ //d;
        if ($_ eq " ") { next; }
         push @template,$_;
    }
    return @template;

} # END OF EXTRACTTEMPLATES
 
 sub buildPatterns {
    # FIRST BUILD AN ARRAY (@template) WITH ALL THE WORDS IN IT - INCL
+UDING PUNCTUATION
    extractTemplates ($crypto);
    # NOW BUILD THE $patterns STRING AND  THE @patterns ARRAY 
    # THE STRING IS USED IN THE DISPLAY - THE  ARRAY CAN BE USED FOR S
+UGGESTED SUBSTITUTION
    foreach (@template) {
        #print "$_\n";
        my $pat = doword ($_);
        $patterns .= $pat ."  ";
        # STRIP PUNCTUATION FROM EACH ITEM BEFORE ADDING IT TO THE ARR
+AY 
        $pat  =~ tr/.,:;!?"(){}//d;
        push @patterns,$pat;
    }
 }


