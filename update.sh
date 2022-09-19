#!/bin/bash

config_files=(
	".config/nvim/*.vimrc"	# add all files ending with vimrc from this directory
	".config/nvim/init.vim"
	".config/rofi/"
	".local/bin/app"
	".local/bin/apprun"
  	".local/bin/csr.sh"
	".local/bin/godot"
	".local/bin/layoutmenu.sh"
	".local/bin/mounting.sh"
	".local/bin/poweroff.sh"
	".local/share/csr/*"
	".local/share/applications/st.desktop"
	".tmux.conf"
	".xprofile"
  ".scripts/summary.sh"
  ".scripts/kantorcompl.py"
  ".scripts/internetowykantor.py"
  ".scripts/examples/*"
  ".bash_aliases"
  "workspace/suckless/dwm/dwm-6.3/config.def.h"
  "workspace/suckless/dwm/patches/*"
  "workspace/suckless/simple-terminal/st-0.8.5/config.def.h"
  "workspace/suckless/simple-terminal/patches/*"
	)

# first remove old backup
#echo "Deleting old backup"
#rm -rf homedir/

echo "Making fresh backup"
# now copy fresh version of files
for name in ${config_files[*]}
do
	rsync -rRi $HOME/./$name homedir/
done


echo "Done."

