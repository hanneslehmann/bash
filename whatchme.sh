#!/bin/bash
# Script by Hannes Lehmann
# Use it, when you need it

if (( $# < 2 )); then
    echo "Not enough arguments passed to whatchme!"
    echo "Provide the filename as first argument,"
    echo "and the command to be executed as second argument."
    echo "example: whatchme.sh file.md 'grep something file.md'"
    exit 1
fi

while true    
do
   ATIME=`stat -c %Z $1`

   if [[ "$ATIME" != "$LTIME" ]]
   then    
	clear
       	eval $2
       	LTIME=$ATIME
   fi
   sleep 1
done
