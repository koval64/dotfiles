#!/usr/bin/env bash

# development enviroments - terminal - 3 window splitted inside tmux
# one window with parent directory
function dev_outside_tmux_config_01() {
    cd "$1"
    tmux new \; new-session \; splitw -v \; send-keys 'cd .. && ls' Enter \; select-pane -U \; splitw -h \; resize-pane -L 2 \; select-pane -L \; resize-pane -y 50 \;
}

function dev_inside_tmux_config_01() {
    cd "$1"
    tmux splitw -v \; send-keys 'cd .. && ls' Enter \; select-pane -U \; splitw -h \; resize-pane -L 2 \; select-pane -L \; resize-pane -y 50 \;
}

# development enviroments - terminal - 3 window splitted inside tmux
# all windows the same directory
function dev_outside_tmux_config_02() {
    cd "$1"
    tmux new \; new-session \; splitw -v \; select-pane -U \; splitw -h \; resize-pane -L 2 \; select-pane -L \; resize-pane -y 50 \;
}

function dev_inside_tmux_config_02() {
    cd "$1"
    tmux splitw -v \; select-pane -U \; splitw -h \; resize-pane -L 2 \; select-pane -L \; resize-pane -y 50 \;
}

function run_one_parent_dir() {
    if [ "$TERM" == "tmux-256color" ]; then
        dev_inside_tmux_config_01 "$1"
        cd "$1"
        exec bash
    else
        dev_outside_tmux_config_01 "$1"
    fi
}

function run_all_dirs_identical() {
    if [ "$TERM" == "tmux-256color" ]; then
        dev_inside_tmux_config_02 "$1"
        cd "$1"
        exec bash
    else
        dev_outside_tmux_config_02 "$1"
    fi
}

run_rofi_menu () {

    # User defined options menu
    OPTIONS=()
    OPTIONS+=("kielbasa")
    OPTIONS+=("kielbasa translation")
    OPTIONS+=("sfx_tool")
    OPTIONS=$(IFS='|'; echo "${OPTIONS[*]}")  # convert into one string with IFS separator

    # Config
    THEME=${1:-$HOME/.config/rofi/solarized-black}

    # Action !!!
    SELECTION=$(echo -e "${OPTIONS}" | rofi -sep "|" -dmenu -theme $THEME -p "project")
    devops.sh run "${SELECTION}"
}

case "$1" in
    "run")
        st devops.sh "$2"
        ;;
    "kielbasa")
        run_all_dirs_identical  "$HOME/apps/c64 kielbasa/kielbasa"
        ;;
    "kielbasa translation")
        run_all_dirs_identical  "$HOME/apps/c64 kielbasa/kielbasa/scripts/"
        ;;
    "sfx_tool")
        run_one_parent_dir      "$HOME/apps/c64/ansic-oscar/sfxeditor/sfx_tool"
        ;;
    "menu")
        run_rofi_menu
esac



















