#!/bin/bash

pkill -9 avail-light

num_folders=25

for ((i = 1; i <= num_folders; i++)); do
    folder="light${i}"
    rm -rf $folder
done

rm -rf run.txt
rm -rf avail-light