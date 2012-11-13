#!/usr/bin/perl -w

use strict;
use Tk;

my ($puzStr, %ent, %lbl);
my $tfont = "Courier 14";
my $lfont = "Courier 12";
my @letters = qw/a b c d e f g h i j k l m n o p q r s t u v w x y z/;

my $main = MainWindow->new;
my $bg = $main->cget('-background');
my $fg = $main->cget('-foreground');

$main->Label(-text => "Type the cryptogram puzzle in this box and hit the \"Enter\" key:",
             -font => $lfont
             )->pack(-side => 'top');
my $puzzle = $main->Text(-relief => 'sunken',
                         -width => 80, -height => 3,
                         -font => $tfont,
                         -wrap => 'word',
                         -spacing1 => '5p', -spacing2 => '5p', -spacing3 => '5p'
                         )->pack(-side => 'top');

my $nxt = $main->Label(-text => "Now type a letter in each of these boxes to decode it:",
                       -font => $lfont,
                       -foreground => $bg
                       )->pack(-side => 'top');
my $frm = $main->Frame()->pack(-side => 'top', -pady => 2);

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
                           -borderwidth => 1,
                           -relief => 'flat'
                           )->grid(-row => $row,
                                   -column => $col++ );
    if ( $c eq 'n' ) {
        $row = 2, $col = 1;
    }
}
my $btn = $frm->Button(-text => "Show Counts",
             -command => \&scSub,
             -state => 'disabled',
             )->grid(-row => $row,
                     -column => $col,
                     -columnspan => 5 );

my $lst = $main->Label(-text => "The solution will appear below:", 
                       -font => $lfont,
                       -foreground => $bg
                       )->pack(-side => 'top');
my $solutn = $main->Text(-relief => 'raised',
                         -width => 80, -height => 3,
                         -font => $tfont,
                         -wrap => 'word',
                         -spacing1 => '5p', -spacing2 => '5p', -spacing3 => '5p'
                         )->pack(-side => 'top');

$main->bind( 'Tk::Entry', '<KeyRelease>', [\&krSub, Ev('K')] );
$main->bind( 'Tk::Entry', '<Enter>', \&enSub );
$puzzle->bind( "<Return>" => sub { 
    $puzStr = lc $puzzle->get('1.0','end');
    $puzStr =~ s/\s+$//;
    $puzzle->delete('1.0','end'), $puzzle->insert('1.0',$puzStr);
    foreach my $c (@letters) {
        $ent{$c}->delete(0,'end');
        if ( $puzStr =~ /$c/ ) {
            $ent{$c}->configure(-state => 'normal', -relief => 'sunken');
            $ent{$c}->insert(0,"_");
            $lbl{$c}->configure(-foreground => $fg);
        } else {
            $ent{$c}->configure(-state => 'disabled', -relief => 'flat');
            $lbl{$c}->configure(-foreground => $bg);
        }
    }
    $nxt->configure(-foreground => $fg);
    $lst->configure(-foreground => $fg);
    $btn->configure(-state => 'normal');
    &updateSlvd; 
});

MainLoop;

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

sub enSub {
    my $w = $_[0];
    $w->selectionRange(0,'end');
    $w->focus;
}

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

sub updateSlvd
{
    local $_ = $puzStr;
    my $trStr1 = my $trStr2 = "";
    foreach my $c (@letters) {
        my $t = uc $ent{$c}->get;
        if ( $t ne "" ) {
            $trStr1 .= $c;
            $trStr2 .= $t;
        }
    }
    eval "tr/$trStr1/$trStr2/";
    $solutn->delete('1.0','end'), $solutn->insert('1.0',$_);
}

