#!/bin/bash

# Usage:
# > sh userReg-flags.sh -f 'John Smith' -a 25 -u john
# -f    -- username
# -a    -- age
# -u    -- full name

echo "> Usage: sh userReg-flags.sh -f 'John Smith' -a 25 -u john";

while getopts u:a:f: flag
do
    case "${flag}" in
        u) username=${OPTARG};;
        a) age=${OPTARG};;
        f) fullname=${OPTARG};;
    esac
done
echo "Username: $username";
echo "Age: $age";
echo "Full Name: $fullname";


