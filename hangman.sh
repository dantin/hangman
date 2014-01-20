#!/bin/bash

word=$1
dictionary=/usr/share/dict/american-english

keyword="^"
for (( i = 0; i < ${#word}; ++i )); do
    if [ "${word:$i:1}" == "?" ]; then
	keyword+="[a-z]"
    else
	keyword+="${word:$i:1}"
    fi
done
keyword+="$"

echo
echo "input word:  "$word
echo "reg keyword: "$keyword
echo
echo "Result(s) found in dictionary"
echo

grep -E "^$keyword$" $dictionary

echo
if [ $? -eq 0 ]; then
    echo "FOUND!"
else
    echo "NOT found!"
fi
