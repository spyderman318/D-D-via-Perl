#!/bin/sh 

# Given a word or phrase, figure out its numeric equivalents 

ptr=1 

if [ -z "$1" ] ; then

  echo -n "Word or phrase: "

  read basis

else

  basis="$@"

fi 

basis="$( echo $basis | \

   tr '[A-Z]' '[a-z]' | \

   tr -Cd '[:alnum:]' )" 

basislength="$( echo $basis | wc -c )" 

echo "(Working with $basis which has \

   $basislength characters)" 

while [ $ptr -lt $basislength ] ; do

  letter="$( echo $basis | cut -c $ptr )"

  ordvalue="$(echo $letter | \

     perl -e '$a=getc(); print ord($a)-96' )"

  echo "... letter $letter has value $ordvalue"

  ptr="$(( $ptr + 1 ))"

done 

exit 0 

