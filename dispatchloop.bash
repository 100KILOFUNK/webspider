#!/bin/bash
# This script shall work through the worklist and call the first script
# curler.bash for each entry in the worklist. and write each sublink of the entry next to the entry

#first run
./curler.bash www.bth.se


cat list.txt | while read next
do
domain = "domain"
path = "path"

	# kod, local paths should be written behind sourcedomain + sourcepath. 
	# do an if statement which check the first char in the column. if it is an /
	# then it is local. Else use the targetdomain+targetpath in the loop
	# initialize two variables in the beginning, the Domain and the path. 
	# send them to the curler script at the end of the loop.
if #check for the / 
then 
	#specify the variables above
else
	#specify the variables above
fi	#finished

./curler.bash $domain $path
done



exit

