#!/bin/bash
# Convert the worklist file to a .dot file that we later can use to make a graph over the domain.

echo "Creating graph.dot"

# while loop which makes each line into the form 
# sourcedomain+sourcepath -- targetdomain+targetpath;

cat list.txt | while read next
do
	target=$(echo $next | awk '{print $3, $4}' | sed 's# -##')
	source=$(echo $next | awk '{print $1, $2}' | sed 's# -##')
	echo "	\""$source"\"" "->" "\""$target"\";" >>graph.dot
#	sleep 3
done


#this is to be done last so we can make it into a jpg
sed -i '1 i\digraph{' graph.dot
echo "}" >>graph.dot
sed -e '/" " -> " ";/d' graph.dot
echo "Done!"
exit
