#!/bin/bash
#Batch Bash Replacer
#Copyright Eric C. Weig, 2019

# usage: bash bbreplacer.sh search_string replace_string filename.txt

# check for the appropriate number of arguments before proceeding
if (( $# != 3 )); then

echo "error: Illegal number of parameters.  Please provide the 3 required paremeters."

else

# search and replace function
replaceCmd(){

	sed -i "s/$1/$3/g" "$2"

}

# use arguments to set variables
inFile="$3"
search="$1"
replace="$2"

# check to see if the search string can be found in the file
# return true and perform the desired search and replace, or
# output unsuccessful search details to log file
if grep -lq "$search" $inFile ; then
    true

# perform the replace function
    replaceCmd "$search" "$inFile" "$replace"

# remove all files beginning with 'sed' to get rid of backup files sed creates
    rm -rf sed*

else

    echo "$search not found!  Could not use replace text $replace" >> log.txt

fi

fi

