#!/bin/bash

clear
echo
date

# screenfetch -p | awk 'NF'
# figlet ubuntu
screenfetch -n -d '-host;-kernel;-shell;-de;-wmtheme;-gtk;-disk;-gpu;-mem'  | awk 'NF'

echo

df -hT -x squashfs -x tmpfs -x devtmpfs | sed '1d' | awk '$7!="/boot/efi"'

echo

ncal -B1 -A1

echo

# tint genact   # jakis tetris czy cos takiego
# curl rate.sx/:help

python3 ~/.scripts/kantorcompl.py
# python3 .scripts/internetowykantor.py

echo

# other() {
#   grep -i 'ETH\|BNB\|DOT\|ADA\|ENJ\|ETC\|CHZ\|XMR\|LTC\|DOGE\|COMP\|MLN'
# }

# curl --no-progress-meter rate.sx/?n=30 | tee >(other) >(sed -n 13p) >(sed -n 11p) >(sed -n 9p) >/dev/null | awk '$5!="cryptocurrency"'
# curl --no-progress-meter rate.sx | tee >(other) >(sed -n 13p) >(sed -n 11p) >(sed -n 9p) >/dev/null | awk '$5!="cryptocurrency"'

# CoinMarketCap scrapper
python3 ~/.scripts/stablecoiny.py
python3 ~/.scripts/sewp.py

echo

