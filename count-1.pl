#!/usr/bin/perl
# count.pl
#  input argument if extension .dat then open file
#  if argument and no extension take it as name and process
#  if no argument passed then ask for std input
#  append to ouput file of namecount.dat
#
%keys= ("a" => 1,
	"b" => 2,
	"c" => 3,
	"d" => 4,
	"e" => 5,
	"f" => 6,
	"g" => 7,
	"h" => 8,
	"i" => 9,
	"j" => 10,
	"k" => 11,
	"l" => 12,
	"m" => 13,
	"n" => 14,
	"o" => 15,
	"p" => 16,
	"q" => 17,
	"r" => 18,
	"s" => 19,
	"t" => 20,
	"u" => 21,
	"v" => 22,
	"w" => 23,
	"x" => 24,
	"y" => 25,
	"z" => 26);

print "Enter Names (or QUIT)\n";
while ( $inname = <STDIN>) {
	chop $inname;
	last if uc($inname) eq "QUIT" | uc($inname) eq "Q" | uc($inname) eq "" ;
	$names[$i] = lc($inname);
	$i++;
}
for $name (@names) {	
        $nameval = 0;
        @characters = split("", $name);
        for $c (@characters) {
		$nameval = $nameval + $keys{$c};
	}
	while ( length($nameval) > 1 ) {
	        $result = 0;
#		print $nameval . "\n";
	        @members = ();
	        @members = split("", $nameval);
                for $val (@members) {
#			print $val . "\n";
			$result +=  $val;
		}
		$nameval = $result;
	} 
#	print "$name," . length($name) . ",$nameval\n";
	print "$name" . ",$nameval\n";
}
