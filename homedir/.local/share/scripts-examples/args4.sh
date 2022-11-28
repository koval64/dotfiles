#!/bin/bash

# print all args using shift

while (( "$#" )); do
    echo $1
    shift
done

