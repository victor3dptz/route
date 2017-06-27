#!/bin/bash

#cat route.txt
if [ -z $1 ]; then 
echo "Usage: ./importroute.sh <file>"
exit
fi
awk 'NR > 2 {
	if (match($2,/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/)) 
		{if (index($4,"H")) {
			print "route add "$1" gw "$2" "$8} 
			else {
				if (index($1,"default")) {
				print "route add default gw "$2} 
				else {
					if (index($4,"G")) {
					print "route add -net "$1" netmask "$3" gateway "$2" "$8} 
					else {next}
				    } 
			    }
		}
	    }' $1

