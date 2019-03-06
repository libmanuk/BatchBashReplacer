#!/bin/bash
#Batch Bash Replacer
#Copyright Eric C. Weig, 2019

# usage: bash bbreplacer.sh search_string replace_string filename.txt

# check for the appropriate number of arguments before proceeding
if (( $# != 3 )); then

echo "ERROR: Illegal number of parameters.  Please provide the 3 required paremeters."

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
else
    echo "$search not found!  Could not use replace text $replace" >> log.txt
fi

# perform the replace function
replaceCmd "$search" "$inFile" "$replace"
shopt -s extglob

# remove any files from the directory that are not of the following types; .txt, .sh, .bat, .sql
rm !(*.txt|*.sh|*.bat|*.sql)

fi
