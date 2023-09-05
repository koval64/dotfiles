#!/usr/bin/env bash

DEV_FOLDER=""

# development enviroments - terminal - 3 window splitted inside tmux
# one window with parent directory
function dev_outside_tmux_config_01() {
    cd "$DEV_FOLDER"
    tmux new \; new-session \; splitw -v \; send-keys 'cd .. && ls' Enter \; select-pane -U \; splitw -h \; resize-pane -L 2 \; select-pane -L \; resize-pane -y 50 \;
}

function dev_inside_tmux_config_01() {
    cd "$DEV_FOLDER"
    tmux splitw -v \; send-keys 'cd .. && ls' Enter \; select-pane -U \; splitw -h \; resize-pane -L 2 \; select-pane -L \; resize-pane -y 50 \;
}

# development enviroments - terminal - 3 window splitted inside tmux
# all windows the same directory
function dev_outside_tmux_config_02() {
    cd "$DEV_FOLDER"
    tmux new \; new-session \; splitw -v \; select-pane -U \; splitw -h \; resize-pane -L 2 \; select-pane -L \; resize-pane -y 50 \;
}

function dev_inside_tmux_config_02() {
    cd "$DEV_FOLDER"
    tmux splitw -v \; select-pane -U \; splitw -h \; resize-pane -L 2 \; select-pane -L \; resize-pane -y 50 \;
}

function run_one_parent_dir() {
    if [ "$TERM" == "tmux-256color" ]; then
        # echo "TMUX"
        # echo $TERM
        dev_inside_tmux_config_01
        cd "$DEV_FOLDER"
        exec bash
    else
        # echo "pure terminal"
        # echo $TERM
        dev_outside_tmux_config_01
    fi
}

function run_all_dirs_identical() {
    if [ "$TERM" == "tmux-256color" ]; then
        # echo "TMUX"
        # echo $TERM
        dev_inside_tmux_config_02
        cd "$DEV_FOLDER"
        exec bash
    else
        # echo "pure terminal"
        # echo $TERM
        dev_outside_tmux_config_02
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
        DEV_FOLDER="$HOME/apps/c64 kielbasa/kielbasa"
        run_all_dirs_identical
        ;;
    "kielbasa translation")
        DEV_FOLDER="$HOME/apps/c64 kielbasa/kielbasa/scripts/"
        run_all_dirs_identical
        ;;
    "sfx_tool")
        DEV_FOLDER="$HOME/apps/c64/ansic-oscar/sfxeditor/sfx_tool"
        run_one_parent_dir
        ;;
    "menu")
        run_rofi_menu
esac



















