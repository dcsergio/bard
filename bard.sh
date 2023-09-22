#!/bin/bash

delay=100

echo "This is Sergio's Bard"
sleep $delay
echo "You can change delay (seconds) between lines"
sleep $delay
echo "using input argument. Deafult is $delay"
sleep $delay

if [[ "$1" != "" ]]; then
  delay=$1
fi

while true; do
    clear
    search_dir="poems"
    for entry in "$search_dir"/*; do
        if [[ -f "$entry" ]] ; then
            while read line; do
                echo $line
                sleep $delay
            done < $entry
            clear
        fi
    done
done
