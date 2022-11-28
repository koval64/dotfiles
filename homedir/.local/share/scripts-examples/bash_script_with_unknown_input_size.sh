#!/bin/bash

### Let’s run the script:
# 
# > sh users-loop.sh john matt bill 'joe wicks' carol
#
### And we’ll see our output:
# 
# > Username - 1: john
# > Username - 2: matt
# > Username - 3: bill
# > Username - 4: joe wicks
# > Username - 5: carol

echo "> Usage: sh users-loop.sh john matt bill 'joe wicks' carol";

i=1;
for user in "$@" 
do
    echo "Username - $i: $user";
    i=$((i + 1));
done

