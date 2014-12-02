#!/bin/bash
# Author: 	Hannes Lehmann
# Description: 	small script to count the chapters on markdown files and helping to add them
# Date:		02/12/2014	
# Usage:
# Argument 1 = filename.md
# Argument 2 (optional) = "show|complete"

REGEX_HEADING="^#"

##  Folgende 2 Zeilen sind dafür da, dass die Tab-Abstände nicht verloren gehen!
old_IFS=$IFS      # save the field separator           
    IFS=$'\n'     # new field separator, the end of line
## 

l[1]=0
l[2]=0
l[3]=0
l[4]=0
l[5]=0
empty=
actual=0

cat $1 | while read LINE ; do
	
	if [[ $LINE =~ $REGEX_HEADING ]]
	then
		lvl="$(echo "$LINE"| awk '{print $1}')"
		title=${LINE//[#]/}
		res="${lvl//[^#]}"
		no=${#res}
                output=
	
		# we need to set all sub sections to 0 if we have changed chapter level
		# e.g. going from 3.4.1 to 3.5.0
		if [ "$no" -lt "$actual" ]
		then
			tmp=5
			 while [  $tmp -gt $no ]; do	
             			let l[$tmp]=0
				let tmp=tmp-1
         		done
		fi

		let l[$no]++

		# built the chapter numbering, depending of the length
		# of the actual level, max.5 subsections supported!
		tmp=2
		output+="${l[1]}"
		while [  $tmp -le $no ]; do	
         		output+=".${l[$tmp]}"
			let tmp=tmp+1
         	done

		# a small parameter to help format the output with
		# the "#" needed by markdown
		if [ "$2" == "show" ] 
		then
			output="$lvl $output$title"
		else
			if [ "$2" == "complete" ] 
			then
				output="$LINE---$lvl $output$title"
			else
				output="$output$title"
			fi
		fi

		echo $output

		actual=$no
	fi
	
done

IFS=$old_IFS     # restore default field separator
