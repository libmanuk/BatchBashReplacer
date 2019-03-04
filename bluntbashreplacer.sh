#!/bin/bash
#Blunt Bash Replacer
#Copyright Eric C. Weig, 2019

replaceCmd(){

	sed -i "s/$1/$3/g" "$2"

}

# sql file for element_texts
inFile="<name of file to search in>"

if grep -lq "<search_string>" $inFile ; then
    true
    replaceCmd "<search_string>" "$inFile" "<replace_string>"
    shopt -s extglob
    rm !(*.txt|*.sh|*.bat|*.sql)
else
    echo "<search_string> not found!  Could not use replace text <replace_string>" >> log.txt
fi

