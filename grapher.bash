#!/bin/bash
# Convert the worklist file to a .dot file that we later can use to make a graph over the domain.

echo "Creating graph.dot"

# while loop which makes each line into the form 
# sourcedomain+sourcepath -- targetdomain+targetpath;

cat 2ndlist.txt | while read next
do
	target=$(echo $next | awk '{print $3, $4}' | sed 's# -##' | sed 's#\(http\|https\)://##')
	source=$(echo $next | awk '{print $1, $2}' | sed 's# -##' | sed 's#\(http\|https\)://##' | sed 's/\(.nsf\).*/\1/')

	#echo $target - $source
	echo "	\"$source\" -> \"$target" | sed 's/$/";/' >>temp.dot
	#sleep 3
done


#this is to be done last so we can make it into a jpg
sed -i '1 i\digraph{' temp.dot
echo '}' >>temp.dot
sed -i '/\" \" -> \" \"/d' temp.dot
cat temp.dot | sed -e 's#>\(</a>\|</li>\)##g' | sed 's#\([0-9]*\)##g' | sed 's/.src//g'| sed 's/""/"/'| uniq  >Graph.dot
rm temp.dot temp.txt 2ndlevel.txt
echo "Creating bth.svg"
dot -Tsvg Graph.dot -o bth.svg
echo 'Done!'
exit
