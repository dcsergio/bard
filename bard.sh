#!/bin/bash

delay=100
search_dir="poems"

clear
echo "This is Sergio's Bard"
sleep 1
echo "You can change delay (seconds) between lines"
sleep 1
echo "... using the 1st input argument. Default is $delay"
sleep 1
echo "You can change the folder of poems"
sleep 1
echo "... usig the 2nd input argument. Default is $search_dir"
sleep 5

if [[ "$1" != "" ]]; then
  delay=$1
fi

if [[ "$2" != "" ]]; then
  search_dir=$2
fi

files=("$search_dir"/*)

shuffled=($(shuf -e "${files[@]}"))

while true; do
    clear
    for entry in "${shuffled[@]}"; do
        if [[ -f "$entry" ]] ; then
            while read line; do
                echo $line
                sleep $delay
            done < $entry
            clear
        fi
    done
done
