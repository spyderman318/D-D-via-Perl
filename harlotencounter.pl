#!/usr/bin/perl
# harlotencounter.pl
#
@he=("slovenly troll","brazen strumpet","cheap trollop","typical streetwalker","saucy tart","wanton wench","expensive doxy","haughty courtesan","aged madam","wealthy procuress","sly pimp","rich panderer");
#
$hecnt=int(rand($#he +1));
print "Harlot encounter with $he[$hecnt]\n";
