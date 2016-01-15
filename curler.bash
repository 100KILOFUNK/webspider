#!/bin/bash
# This is the first script, in which we will curl the www.bth.se webpage,
# and from there gather all the links. By using regex to find all the anchors
# in the html, and adding the links inside to the worklist (worklist.txt)



echo 'Curling' $1$2

curl -s $1$2 | sed -n 's/.*href="\([^"]*\).*/\1/p' | sed 's/?.*//g' | sed 's/ //g' | while read next
do
if echo $next | grep 'http://www.bth.se\|^/.*/' >/dev/null
then
	if [ -z "$2" ]
	then	echo "$1$2 $next" | sed 's#=.*##' | uniq >>temp.txt
	else
		echo "$1$2 $next" | sed 's#=.*##' | uniq >>2ndlevel.txt
	fi
fi
done

if [ -z "$2" ]
then	
	cat temp.txt | sed 's/\(bth.se\)/\1 -/g' >>list.txt
else
	cat 2ndlevel.txt | sed 's/\(www.bth.se\)/\1 -/g' >2ndlist.txt
fi
exit

