#!/usr/bin/perl
# normaldoors.pl

@normdoors=("Archway (open)","Automatic Door (opens if anyone approaches)","Concealed (Hidden) Door, roll again for type","Brass Door, Normal","Bronze Door, Normal","Double Door, roll again for type","False Door, roll again for type","Iron Door, Normal","Locked Door, Mechanical","Locked Door, Magic/Psi","Locked Door, Out of Phase","Revolving/Swinging Door","Secret Door, roll again for type","Sliding Door (slides left/right into wall)","Trapped Door, Mechanical","Trapped Door, Magic/Psi","Trapped Door, Out of Phase","Tricked Door","Stone Door, Normal","Wood Door, Normal");
$normcnt=int(rand($#normdoors + 1));
print "Door is a $normdoors[$normcnt]\n";
