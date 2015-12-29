#!/bin/bash
# This script shall work through the worklist and call the first script
# curler.bash for each entry in the worklist. and write each sublink of the entry next to the entry

#first run
./curler.bash www.bth.se


cat list.txt | while read next
do
	# Here, we add the code which get the target information(not the source) from list.txt
	# and then call the curler script with that information.
done



exit
