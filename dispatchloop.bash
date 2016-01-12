#!/bin/bash
# This script shall work through the worklist and call the first script
# curler.bash for each entry in the worklist. and write each sublink of the entry next to the entry

#first run
./curler.bash www.bth.se


cat list.txt | while read next
do
	# kod. 
	# do an if statement which check the first char in the column. if it is an /
	# then it is local. Else use the targetdomain+targetpath in the loop
	# initialize two variables in the beginning, the Domain and the path. 
	# send them to the curler script at the end of the loop.


if 	echo $next | awk '{print $3, $4}' | sed 's#-##' | awk '{print $1}' | cut -c 1 | grep "h" 
then 
	
	domain=$(echo $next | awk '{print $3, $4}' | sed 's#-##' | awk '{print $1}')
	path=$(echo $next | awk '{print $3, $4}' | sed 's#-##' | awk '{print $2}')
	echo $domain
	echo $path
	./curler.bash $domain $path 
elif    echo $next | awk '{print $3, $4}' | sed 's#-##' | awk '{print $1}' | cut -c 1 | grep "/"  
then
	path=$(echo $next | awk '{print $3, $4}' | sed 's#-##' | awk '{print $1}')
	domain=$(echo $next | awk '{print $1, $2}' | sed 's# -##')
	echo $domain
	echo $path
	./curler.bash $domain $path
fi

#./curler.bash $domain $path
sleep 2
done



exit

