#!/bin/bash
#Blunt Bash Replacer
#Copyright Eric C. Weig, 2019

# search and replace function
replaceCmd(){

	sed -i "s/$1/$3/g" "$2"

}

# file to perform search and replace in
inFile="<name of file to search in>"
search="$1"
replace="$2"

# check to see if the search string can be found in the file
# return true and perform the desired search and replace, or
# output unsuccessful search details to log file
if grep -lq "$search" $inFile ; then
    true
    replaceCmd "$search" "$inFile" "$replace"
    shopt -s extglob
    rm !(*.txt|*.sh|*.bat|*.sql)
else
    echo "<search_string> not found!  Could not use replace text <replace_string>" >> log.txt
fi

