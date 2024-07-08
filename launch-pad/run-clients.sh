#!/bin/bash

num_folders=25

mode=$1

for ((i = 1; i <= num_folders; i++)); do
    folder="light${i}"
    rm -rf $folder/avail_path

    if [ -d "$folder" ]; then
        cd "$folder" || exit
        ./avail-light --config light-$mode.yml &
        echo "Started avail-light in $folder folder."
        cd ..
    else
        echo "Folder '$folder' does not exist."
    fi
done

wait

echo "All avail-light binaries started."
