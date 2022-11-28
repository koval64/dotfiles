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
    ".local/bin/d1"
    ".local/bin/command-local-loger"
    ".local/share/csr/*"
    ".local/share/applications/st.desktop"
    ".local/share/fzf/*"
    ".local/share/scripts/*"
    ".local/share/scripts-examples/*"
    ".tmux.conf"
    ".xprofile"
    ".bashrc"
    ".bash_aliases"
    ".scripts/summary.sh"
    ".scripts/kantorcompl.py"
    ".scripts/internetowykantor.py"
    "workspace/suckless/dwm/dwm-6.3/config.def.h"
    "workspace/suckless/dwm/patches/*"
    "workspace/suckless/simple-terminal/st-0.9/config.def.h"
    "workspace/suckless/simple-terminal/patches/*"
)

# to remove old backup
# > echo "Deleting old backup"
# > rm -rf homedir/

echo "Refreshing files..."
for name in ${config_files[*]}
do
	rsync -rRi $HOME/./$name homedir/
done
echo "Done."

