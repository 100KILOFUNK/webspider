#!/bin/bash
# This is the first script, in which we will curl the www.bth.se webpage,
# and from there gather all the links. By using regex to find all the anchors
# in the html, and adding the links inside to the worklist (worklist.txt)


echo "" >temp.txt

echo $1$2

curl $1$2 | sed -n 's/.*href="\([^"]*\).*/\1/p' | sed 's/ //g' | while read next
do
if echo $next | grep 'http://www.bth.se\|^/.*/'
then echo "$1$2 $next -" | uniq >>temp.txt
fi
done

cat temp.txt | sed 's#\(bth.se\)#\1 -#g' >>list.txt


exit

