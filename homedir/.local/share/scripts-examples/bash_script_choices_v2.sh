#!/bin/bash

# immediate response; no return/enter nedeed

echo "What to do ?"
echo "1) show pid/s"
echo "2) kill app"
echo "3) exit"

read -n 1 ans;

case $ans in
  1)
    echo "show pid/s";;
  2)
    echo "kill app";;
  *)
    exit;;
esac


