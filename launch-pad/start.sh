#!/bin/bash

mode=$1

./init.sh $mode
./run-clients.sh $mode > run.txt