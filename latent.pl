#!/usr/bin/perl -w
#
#  Takes 2 files, a jpeg picture and one or two "hidden" bitmask-pictures
#  (containing '@' and spaces), and creates an obfuscated-perl program which,
#  when run, displays either of the bitmask-pictures, or the original picture,
#  depending on the argument given.
#
#  050922 liverpole -- created
#  060101 liverpole -- modified to accommodate 0, 1 or 2 hidden images
#  060102 liverpole -- fixed a bug in the interpretation of xpm shades
#
 
 
####################
### User-defined ###
####################
my $black_limit    = 30;      # Less than this value is assumed black
my $white_limit    = 225;     # Greater than this value is assumed white
my $rows_per_pixel = 3;       # Increase this to make picture shorter
my $cols_per_pixel = 2;       # Increase this to make picture narrower
 
# Variable which affect what information is displayed to the user
my $verbose       = 1;      # Display verbose information?
my $timing        = 1;      # Display timing information?
my $progress      = 1;      # Display progress meter?
 
#
# The 'shades' arrays, which contain the ascii characters for
# (respectively) 0, 1 or 2 hidden images.  Note that characters
# go from darker to lighter.  Note also that the last character
# in each darkest group should be a '@'.
#
my $ppshades = [
    [   # No latent images
        [ '@' ],
        [ '#' ],
        [ 'M' ],
        [ 'E' ],
        [ '(' ],
        [ 'p' ],
        [ 'x' ],
        [ '<' ],
        [ '!' ],
        [ ';' ],
        [ "," ],
        [ "`" ],
        [ " " ],
    ],
    [   # For 1 latent image
        [ '#', '@' ],
        [ 'M', 'W' ],
        [ 'E', 'F' ],
        [ '(', ')' ],
        [ 'p', 'b' ],
        [ 'x', 'o' ],
        [ '<', '>' ],
        [ '!', '|' ],
        [ ';', ':' ],
        [ ",", "." ],
    ],
    [   # For 2 latent images
        [ 'M', 'W', '#', '@' ],
        [ 'E', 'F', 'G', 'H' ],
        [ '(', '{', ')', '}' ],
        [ 'p', 'b', 'd', 'q' ],
        [ 'x', 'o', 'a', 'c' ],
        [ '<', '>', '!', '|' ],
        [ ';', '~', '=', ':' ],
        [ "`", "'", ".", "," ],
    ]
];
 
# ImageMagick uses 'gray1', 'gray2', etc. which need to be converted
# back to RGB values.
my $p_gray_to_rgb = {
    gray    => '7e7e7e', gray0   => '000000', gray1   => '030303',
    gray2   => '050505', gray3   => '080808', gray4   => '0a0a0a',
    gray5   => '0d0d0d', gray6   => '0f0f0f', gray7   => '121212',
    gray8   => '141414', gray9   => '171717', gray10  => '1a1a1a',
    gray11  => '1c1c1c', gray12  => '1f1f1f', gray13  => '212121',
    gray14  => '242424', gray15  => '262626', gray16  => '292929',
    gray17  => '2b2b2b', gray18  => '2e2e2e', gray19  => '303030',
    gray20  => '333333', gray21  => '363636', gray22  => '383838',
    gray23  => '3b3b3b', gray24  => '3d3d3d', gray25  => '404040',
    gray26  => '424242', gray27  => '454545', gray28  => '474747',
    gray29  => '4a4a4a', gray30  => '4d4d4d', gray31  => '4f4f4f',
    gray32  => '525252', gray33  => '545454', gray34  => '575757',
    gray35  => '595959', gray36  => '5c5c5c', gray37  => '5e5e5e',
    gray38  => '616161', gray39  => '636363', gray40  => '666666',
    gray41  => '696969', gray42  => '6b6b6b', gray43  => '6e6e6e',
    gray44  => '707070', gray45  => '737373', gray46  => '757575',
    gray47  => '787878', gray48  => '7a7a7a', gray49  => '7d7d7d',
    gray50  => '7f7f7f', gray51  => '828282', gray52  => '858585',
    gray53  => '878787', gray54  => '8a8a8a', gray55  => '8c8c8c',
    gray56  => '8f8f8f', gray57  => '919191', gray58  => '949494',
    gray59  => '969696', gray60  => '999999', gray61  => '9c9c9c',
    gray62  => '9e9e9e', gray63  => 'a1a1a1', gray64  => 'a3a3a3',
    gray65  => 'a6a6a6', gray66  => 'a8a8a8', gray67  => 'ababab',
    gray68  => 'adadad', gray69  => 'b0b0b0', gray70  => 'b3b3b3',
    gray71  => 'b5b5b5', gray72  => 'b8b8b8', gray73  => 'bababa',
    gray74  => 'bdbdbd', gray75  => 'bfbfbf', gray76  => 'c2c2c2',
    gray77  => 'c4c4c4', gray78  => 'c7c7c7', gray79  => 'c9c9c9',
    gray80  => 'cccccc', gray81  => 'cfcfcf', gray82  => 'd1d1d1',
    gray83  => 'd4d4d4', gray84  => 'd6d6d6', gray85  => 'd9d9d9',
    gray86  => 'dbdbdb', gray87  => 'dedede', gray88  => 'e0e0e0',
    gray89  => 'e3e3e3', gray90  => 'e5e5e5', gray91  => 'e8e8e8',
    gray92  => 'ebebeb', gray93  => 'ededed', gray94  => 'f0f0f0',
    gray95  => 'f2f2f2', gray96  => 'f5f5f5', gray97  => 'f7f7f7',
    gray98  => 'fafafa', gray99  => 'fcfcfc', gray100 => 'ffffff',
};
 
 
##############
### Strict ###
##############
use strict;
use warnings;
 
 
#################
### Libraries ###
#################
use Data::Dumper;
use File::Basename;
use FileHandle;
use Image::Magick;
 
 
##################
### Prototypes ###
##################
sub convert_file_to_ascii($$$$);
sub convert_image_to_grayscale_xpm($);
sub convert_xpm_to_ascii($$$);
sub create_map($$);
sub get_ascii($$$$$$$);
sub get_shade($$$$$);
sub read_file($);
sub progress($$);
sub write_code($$$$);
sub write_file($$);
sub write_html($$);
 
 
###################
### Global vars ###
###################
$| = 1;
my $iam = basename $0;
my $syntax = "
    syntax:  $iam  <image file>  [message]  [message]
 
    This program converts a .jpg or .gif <image file> to ascii, and creates
    an html file with the same basename as the original file.  If one or two
    'hidden message' files are given, a Perl script is also generated, which
    (depending on the arguments passed to it) lets the user generate both the
    original picture and any 'latent' messages as well.
 
    The format of the 'hidden message' file is simply spaces and non-spaces;
    anything which is NOT a space represents a black pixel, and all spaces
    represent white pixels.  For example:
 
            @@@  @@@  @@@@@@@  @@@      @@@       @@@@@@@    @@@
            @@@  @@@  @@@      @@@      @@@      @@@   @@@   @@@
            @@@@@@@@  @@@@@@@  @@@      @@@      @@@   @@@   @@@
            @@@  @@@  @@@      @@@      @@@      @@@   @@@
            @@@  @@@  @@@@@@@  @@@@@@@  @@@@@@@   @@@@@@@    @@@
 
    Either 'hidden message' file will be interpreted as a Perl script if it
    is preceded by '=' (eg. '=script.pl').  This allows a separate script to
    be embedded within the message instead.
 
";
 
 
####################
### Command-line ###
####################
(my $img = shift) or die $syntax;
(@ARGV > 2) and die "$iam:  max latent messages allowed is 2\n";
my $phidden = [ @ARGV ];
 
 
####################
### Main program ###
####################
my $start = time;
my ($pmap, $pshades) = create_map($ppshades, $phidden);
convert_file_to_ascii($pmap, $pshades, $img, $phidden);
my $end = time;
my $duration = time - $start;
my $s = (1 == $duration)? "": "s";
$verbose and print "\n";
$timing and print "Total time = $duration second$s\n";
 
 
###################
### Subroutines ###
###################
sub read_file($) {
    my ($fname) = @_;
    my $fh = new FileHandle();
    open($fh, "<$fname") or die "$iam:  cannot read file '$fname' ($!)\n";
    chomp (my @lines = <$fh>);
    close $fh;
    return \@lines;
}
 
 
sub create_map($$) {
    my ($ppshades, $phidden) = @_;
    my $nhidden = @$phidden;
    my $pshades = $ppshades->[$nhidden];
    my $nshades = @$pshades;
 
    ($black_limit < 0)   and $black_limit = 0;
    ($white_limit > 255) and $white_limit = 255;
 
    my $pmap = { };
    my $range = ($white_limit - $black_limit + 1) / $nshades;
    my $start_char = $black_limit;
    my $last_char = 0;
    my $this_char = 0;
    my $i;
 
    for ($i = 0; $i < $black_limit; $i++) {
        $pmap->{$i} = $pshades->[0];
    }
 
    for (my $idx = 1, $i = $black_limit; $i <= $white_limit; $i++) {
        while ($i - $black_limit >= $range * $idx && $idx < $nshades) {
            ++$idx;
        }
        $this_char = $pshades->[$idx - 1];
        $pmap->{$i} = $this_char;
        if ($last_char && $this_char ne $last_char) {
            $start_char = $i;
        }
        $last_char = $this_char;
    }
 
    while ($i < 256) {
        $pmap->{$i++} = $pshades->[-1];
    }
 
    return ($pmap, $pshades);
}
 
 
sub convert_file_to_ascii($$$$) {
    my ($pmap, $pshades, $fname, $phidden) = @_;
    (my $start_ext = $fname) =~ s,.*\.,.,;
    my $pxpm = &convert_image_to_grayscale_xpm($fname);
 
    my $pascii = convert_xpm_to_ascii($pmap, $pxpm, $phidden);
    while (@$pascii > 0 && $pascii->[-1] =~ /^$/) {
        pop @$pascii;
    }
 
    (my $text = $fname) =~ s/$start_ext$/.txt/;
    &write_file($text, $pascii);
 
    # Don't write the Perl script unless there's at least 1 latent message
    my $nhidden = @$phidden;
    if ($nhidden) {
        (my $code = $fname) =~ s/$start_ext$/.pl/;
        write_code($nhidden, $pshades, $code, $pascii);
    }
 
    (my $html = $fname) =~ s/$start_ext$/.html/;
    write_html($html, $pascii);
}
 
 
#
#  Returns a value from 0.0 (lightest) to 1.0 (darkest), based on the
#  pixels in the rows pointed to by $1, or undef if there is no more
#  data.
#
sub get_shade($$$$$) {
    my ($prows, $pintensity, $pixsize, $lnum, $idx) = @_;
    my @syms;
 
    my ($sum, $count);
 
    for (my $i = 0; $i < @$prows; $i++) {
        (length($prows->[$i]) >= $pixsize * $cols_per_pixel) or return -1;
        for (my $j = 0; $j < $cols_per_pixel; $j++) {
            my $sym = substr($prows->[$i], 0, $pixsize, "");
            defined($sym) or return -1;
            my $shade = $pintensity->{$sym};
            if (!defined($shade)) {
                ($prows->[$i] =~ /^(;|$)/ && $sym =~ /^}/) and return -1;
                $lnum += $i;
                my $msg = "undefined symbol '$sym', line $lnum, index $idx";
                die "\n\n$iam:  $msg\n";
            }
            $sum += $shade;
            ++$count;
        }
    }
 
    my $avg_shade = $sum / $count;
    return $avg_shade;
}
 
 
sub progress($$) {
    my ($cnt, $n) = @_;
    return unless $progress;
    my $bar_width = 64;
    my $pcnt = (0 == $n)? 0: ($cnt == $n)? 100: 100.0 * $cnt / $n;
    my $bar_size   = int($bar_width * $pcnt / 100);
    my $blank_size = $bar_width - $bar_size;
    my $blank      = '-' x $blank_size;
    my $bar        = '*' x $bar_size;
    printf " %5.1f%% [%s%s]\r", $pcnt, $bar, $blank;
}
 
 
sub get_ascii($$$$$$$) {
    my ($pmap, $nhidden, $shade, $c1, $c2, $min, $max) = @_;
    ($shade > $white_limit) and $shade = 255;
    ($shade < $black_limit) and $shade = 0;
 
    my $pasc = $pmap->{int($shade)};
    my $idx = (($c1 eq ' ')? 0: 1) + (($c2 eq ' ')? 0: 2);
    if ($idx < 0 || $idx > 3) { die "$iam:  bad index $idx\n"; }
    my $asc = $pasc->[$idx];
    if (!defined($asc)) {
        die "\n$iam:  ascii for index $idx (shade $shade) is UNDEFINED\n";
    }
    return $asc;
}
 
 
sub convert_xpm_to_ascii($$$) {
    my ($pmap, $plines, $phidden) = @_;
 
    my $line = "";
    while ($line !~ /^\s*static char.*{\s*$/) { $line = shift @$plines; }
    my ($w, $h, $nshades, $pixsize);
    while (1) {
        $line = shift @$plines;
        if ($line =~ /"(\d+)\s+(\d+)\s+(\d+)\s+(\d+)"/) {
            ($w, $h, $nshades, $pixsize) = ($1, $2, $3, $4);
            last;
        }
    }
 
    my %intensity;
    my $re = '.' x $pixsize;
    my $min = undef;
    my $max = undef;
 
    # Save symbols and the corresponding intensities
 
    # 060104 liverpole -- fixed undefined symbol bug.  Original code:
    #
    #  for (my $i = 0; $i < $nshades; $i++) {
    #       $line = shift @$plines;
    #       next unless ($line =~ /"($re).*(#([0-9a-fA-F]{2})|(gray\d*))/);
    #       my ($pixel, $color) = ($1, $2);
    #       ($color =~ /gray/) and $color = '#' . $p_gray_to_rgb->{$color};
    #       $color =~ s/^#(..).*/$1/;
    #       my $intensity = hex($color);
    #       $intensity{$pixel} = $intensity;
    #       (!defined($min) || $min > $intensity) and $min = $intensity;
    #       (!defined($max) || $max < $intensity) and $max = $intensity;
    #   }
    for (my $i = 0; $i < $nshades; $i++) {
        $line = shift @$plines;
        my ($pixel, $color, $shade);
        if ($line =~ /"($re).*(none|white|black)/i) {
            ($pixel, $color) = ($1, $2);
            $shade = ($color =~ /black/i)? 0: 255;
        } elsif ($line =~ /"($re).*(gray\d*)/) {
            ($pixel, $color) = ($1, $2);
            $color = $p_gray_to_rgb->{$color};
            $shade = hex($color);
        } elsif ($line =~ /"($re).*(#([0-9a-fA-F]{2}))/) {
            ($pixel, $color) = ($1, $2);
            $color =~ s/^#(..).*/$1/;
            $shade = hex($color);
        } else {
            my $where = sprintf "at line %d of %d", $i + 1, $nshades;
            die "$iam:  invalid shade $where:  $line\n";
        }
        $intensity{$pixel} = $shade;
        (!defined($min) || $min > $shade) and $min = $shade;
        (!defined($max) || $max < $shade) and $max = $shade;
    }
 
    while ($plines->[0] !~ /^"/) {
        shift @$plines;
    }
 
    if ($verbose) {
        my $ratio = $cols_per_pixel / $rows_per_pixel;
        print "Aspect ratio .................... $ratio\n";
        print "Image geometry (w x h) .......... $w x $h pixels\n";
        print "Total shades .................... $nshades\n";
        print "Characters per pixel ............ $pixsize\n";
        print "Minimum intensity (blackest) .... $min / 255\n";
        print "Maximum intensity (whitest) ..... $max / 255\n";
    }
 
    my $total = @$plines;
    my $count = 0;
    my (@ascii, $asc);
 
    # Read the lines from any hidden image files
    my $nhidden = @$phidden;
    map { s/^=// } (@$phidden);
    my $phidden0 = (@$phidden > 0)? read_file($phidden->[0]): [ ];
    my $phidden1 = (@$phidden > 1)? read_file($phidden->[1]): [ ];
 
    progress(0, 0);
    my ($c1, $c2);
 
    # Process N=$rows_per_pixel rows at a time
    for (my $i = 0; $i + $rows_per_pixel <= $total; $i += $rows_per_pixel) {
        progress($i, $total);
        my $hidden0 = shift @$phidden0 || "";
        my $hidden1 = shift @$phidden1 || "";
 
        # Get $rows_per_pixel rows
        my @rows;
        for (my $j = 0; $j < $rows_per_pixel; $j++) {
            $rows[$j] = shift @$plines;
            $rows[$j] =~ s/^"(.*)".*$/$1/;
        }
        $count += $rows_per_pixel;
 
        $asc = "";
        my $rowsize = length $rows[0];
 
        # Process N=$cols_per_pixel columns at a time
        for (my $j = 0; $j < $rowsize; $j += ($pixsize * $cols_per_pixel)) {
            # Get the average shade of $cols_per_pixel pixels from each row
            my $shade = get_shade(\@rows, \%intensity, $pixsize, $i, $j);
            last if ($shade < 0);
 
            $c1 = substr($hidden0, 0, 1, "") || " ";
            $c2 = substr($hidden1, 0, 1, "") || " ";
 
            $asc .= get_ascii($pmap, $nhidden, $shade, $c1, $c2, $min, $max);
        }
 
        push @ascii, $asc;
    }
 
    progress($total, $total);
    $progress and print "\n";
 
    $verbose and print "Decoded $count lines of $total\n";
 
    return \@ascii;
}
 
 
sub convert_image_to_grayscale_xpm($) {
    my ($fname) = @_;
    $verbose and print "\n";
    $verbose and print "=== File $fname ===\n";
    my $image = new Image::Magick();
    my $result = $image->Read($fname);
    $result and die "$iam:  error reading image file '$fname' ($result)\n";
    $verbose and print "Read image '$fname'\n";
    $result = $image->Quantize(colorspace=>'gray');
    $result and die "$iam:  error converting image to grayscale ($result)\n";
    $verbose and print "Converted image to grayscale\n";
    my $tmp = "$iam$$.tmp.xpm";
    $result = $image->Write($tmp);
    $result and die "$iam:  error writing .xpm file '$tmp' ($result)\n";
    my $fh = new FileHandle();
    my $plines = read_file($tmp);
    $verbose and print "Converted image to .xpm format\n";
    unlink $tmp;
    return $plines;
}
 
 
sub write_file($$) {
    my ($fname, $plines) = @_;
    my $fh = new FileHandle();
    open($fh, ">$fname") or die "$iam:  cannot write file '$fname' ($!)\n";
    my $count = @$plines;
    my $s = (1 == $count)? "": "s";
    for (my $i = 0; $i < $count; $i++) {
        my $line = $plines->[$i];
        $verbose and print $fh "$line\n";
    }
    close $fh;
    $verbose and print "Wrote output file '$fname' ($count line$s)\n";
}
 
 
sub write_code($$$$) {
    my ($nhidden, $pshades, $fname, $plines) = @_;
    my $fh = new FileHandle();
    open($fh, ">$fname") or die "$iam:  unable to write file '$fname' ($!)\n";
    print $fh "#!/usr/bin/perl -w\n";
    print $fh "\$_=q/\n";
    map { print $fh "$_\n"; } @$plines;
 
    if (2 == $nhidden) {
        my ($list0, $list1, $list2);
        foreach my $pshade (@$pshades) {
            $list0 .= $pshade->[3] || 0;
            $list1 .= $pshade->[2] || 0;
            $list2 .= $pshade->[1] || 0;
        }
        if ($verbose) {
            print "Character set 0 ... '$list0'\n";
            print "Character set 1 ... '$list1'\n";
            print "Character set 2 ... '$list2'\n";
        }
        my $text = '/;$;=(shift||0)%3;$,=q/' . $list0;
        $text .= '/.(0,q/' . $list2 . '/,q/' . $list1 . '/)[$;];$;&&s';
        print $fh "$text\n";
        print $fh '/[$,]/@/gm;$;&&s/[^\n@]/ /gm;print' . "\n";
    } else {
        # $nhidden = 1
        my ($list);
        foreach my $pshade (@$pshades) {
            $list .= $pshade->[1] || 0;
        }
        $verbose and print "Character set ..... '$list'\n";
        my $text = '/;$;=(shift||0)%2;$,=(0,q/' . $list . '/)[$;];$;&&s';
        print $fh "$text\n";
        print $fh '/[$,]/@/gm;$;&&s/[^\n@]/ /gm;print' . "\n";
    }
 
    close $fh;
    my $count = @$plines;
    my $s = (1 == $count)? "": "s";
    $verbose and print "Wrote output file '$fname' ($count line$s)\n";
}
 
 
sub write_html($$) {
    my ($fname, $plines) = @_;
    my $font = 'Courier new';
    my $fh = new FileHandle();
    open($fh, ">$fname") or die "$iam:  unable to write file '$fname' ($!)\n";
    print $fh "<html>\n";
    print $fh "<head>\n";
    print $fh "<style type=text/css>PRE {\n";
    print $fh "    FONT-SIZE:10px; COLOR: #000000;\n";
    print $fh "    FONT-FAMILY: '$font', Courier, mono\n";
    print $fh "}\n";
    print $fh "</style>\n";
    print $fh "</head>\n";
    print $fh "<body>\n";
    print $fh "  <pre>\n";
    foreach my $line (@$plines) {
        (my $new = $line) =~ s/</&lt;/g;
        $new =~ s/>/&gt;/g;
        print $fh "$new\n";
    }
    print $fh "  </pre>\n";
    print $fh "</body>\n";
    print $fh "</html>\n";
    close $fh;
    my $count = @$plines;
    my $s = (1 == $count)? "": "s";
    $verbose and print "Wrote output file '$fname' ($count line$s)\n";
}
