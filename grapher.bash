#!/bin/bash
# Convert the worklist file to a .dot file that we later can use to make a graph over the domain.

echo "Creating graph.dot"

# while loop which makes each line into the form 
# sourcedomain+sourcepath -- targetdomain+targetpath;

cat list.txt | while read next
do
	target=$(echo $next | awk '{print $3, $4}' | sed 's# -##' | sed 's#\(http\|https\)://##')
	source=$(echo $next | awk '{print $1, $2}' | sed 's# -##' | sed 's#\(http\|https\)://##')

	echo "	\""$source"\"" "->" "\""$target"\";" >>temp.dot
#	sleep 3
done


#this is to be done last so we can make it into a jpg
sed -i '1 i\digraph{' temp.dot
echo "}" >>temp.dot
sed -i '/" " -> " "/d' temp.dot 
cat temp.dot | sed -e 's#></a>\"##' >Graph.dot
rm temp.dot
echo "Done!"
exit
