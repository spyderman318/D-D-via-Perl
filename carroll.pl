#!/usr/bin/perl
use strict;
use warnings;

print "Encode (E) or Decode (D)?\n";

my $choice = <STDIN>;

if ( $choice =~ /e/i ) {
    print "What's the key-phrase:\n";
    my $key_phrase = <STDIN>;
    chomp($key_phrase);
    print "What's the text to encode:\n";
    my $clear_text = <STDIN>;
    chomp($clear_text);
    print
"    '$clear_text' \nencoded using \n    '$key_phrase'\nresult:\n    ";
    print &amp;amp;amp;amp;encode_lcc( $clear_text, $key_phrase ), "\n";
}
elsif ( $choice =~ /d/i ) {
    print "What's the key-phrase:\n";
    my $key_phrase = <STDIN>;
    chomp($key_phrase);
    print "What's the text to decode:\n";
    my $cypher_text = <STDIN>;
    chomp($cypher_text);
    print
"    '$cypher_text' \ndecoded using \n    '$key_phrase'\nresult:\n    ";
    print &amp;amp;amp;amp;decode_lcc( $cypher_text, $key_phrase ), "\n";
}
else {
    print "Entry must be D or E\n";
    exit;
}

sub encode_lcc {
    my $alpha = 'abcdefghijklmnopqrstuvwxyz';
    my ( $clear_text, $key_phrase ) = @_;
    unless ( $clear_text &amp;amp;amp;amp;&amp;amp;amp;amp; $key_phrase ) {
        die
"Wrong number of arguments. Syntax: encode_lcc(CLEARTEXT,KEYPHRASE)";
    }
    $key_phrase =~ tr/A-Z/a-z/;
    my @key_array = $key_phrase =~ /[a-z]/gi;
    my $i         = 0;
    my $output    = '';
    foreach ( split ( '', $clear_text ) ) {
        if (/[^a-z]/i) {
            $output .= $_;
        }
        else {
            $output .= substr(
                $alpha,
                (
                    index( $alpha,   lc($_) ) -
                      index( $alpha, $key_array[$i] )
                ),
                1
              )
              ; # encoded output is the letter in the alphabet found at:
                # (letter's normal position) minus (letter-position of
                # the current keyphrase-letter)
            $i = ( ( $i + 1 ) % @key_array );
        }
    }
    return $output;
}

sub decode_lcc {
    my $alpha = 'abcdefghijklmnopqrstuvwxyz';
    my ( $cypher_text, $key_phrase ) = @_;
    unless ( $cypher_text &amp;amp;amp;amp;&amp;amp;amp;amp; $key_phrase ) {
        die
"Wrong number of arguments. Syntax: encode_lcc(CYPHERTEXT,KEYPHRASE)";
    }
    $key_phrase =~ tr/A-Z/a-z/;
    my @key_array = $key_phrase =~ /[a-z]/gi;
    my $i         = 0;
    my $output    = '';
    foreach ( split ( '', $cypher_text ) ) {
        if (/[^a-z]/i) {
            $output .= $_;
        }
        else {
            $output .= substr(
                $alpha,
                (
                    (
                        index( $alpha,   lc($_) ) +
                          index( $alpha, $key_array[$i] )
                    ) % 26
                ),
                1
              )
              ; # decoded output is the letter in the alphabet found at:
                # (letter's normal position) plus (letter-position of
                # the current keyphrase-letter), mod 26 to stop us
                # going past the end of the alphabet.
            $i = ( ( $i + 1 ) % @key_array );
        }
    }
    return $output;
}



