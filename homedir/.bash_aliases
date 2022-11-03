alias wiki='vim ~/vimwiki/Home.md'
alias vim='nvim -p'
alias f='nvim -p $(fzf -i --multi --layout=reverse --exact --preview "cat {}")'
alias site='vim ~/workspace/github/marioc8.github.io/index.md'
alias grep='grep -v grep | grep'
alias mtr='mtr -t'
alias df='df -x squashfs -h'
alias 2pl='trans en:pl'
alias 2en='trans pl:en'
alias ll='ls -lha'
alias la=' ls -sh1N'
alias ls='LC_COLLATE=C ls -h --group-directories-first --color=never'
alias ffmpeg='ffmpeg -hide_banner'
alias qrencode='qrencode -s 6 -l H'
alias sd='pwd | xclip'        # store current working directory
alias rd='cd "`xclip -o`"'    # restore current working directory
alias clipdel='clipdel -d .*'
alias summary='bash ~/.scripts/summary.sh'
alias disks="lsblk | awk '\$6!=\"loop\"'"
alias x='setxkbmap -option caps:ctrl_modifier'

# backup ?
function archive(){
  path=`echo $1 | tr -d "/"`
  tar -cf "$(date -u +"%Y%m%d_%s")_$path.tar" $path
}

function searchf() {         # search for file in current directory
  find . -type f -iname $1 2>&1 | grep -v "Permission denied"
}

function searchd() {         # search for file in current directory
  find . -type d -iname $1 2>&1 | grep -v "Permission denied"
}


function images() {
  searchf "*$1*" | grep -v ".cache/" | sxiv -i
}

function v() {
    if [ $# -ne 1 ]; then
        nvim -p *
    else
        FOLDER=$(pwd)
        cd $1 && nvim -p * && cd $FOLDER
    fi
}

function d1() {
    FOLDER=$(find . -type d | fzf --layout=reverse)
    if [ $? -eq 0 ]; then
        cd "$FOLDER"
        # tmux new
        # tmux neww
        tmux splitw -v
        tmux select-pane -U
        tmux splitw -h
        tmux resize-pane -L 2
        tmux select-pane -L
        tmux resize-pane -y 50
        # if bash prompt is too long there is a bug with tmux -
        # - when resizing window new prompts appear.
        # Below does not fix this:
        # tmux send ls ENTER
    fi

    #
    # if you outside tmux session try this:

    # tmux new-session -s "mySession_01" -d
    # tmux split-window -v
    # tmux select-pane -U
    # tmux split-window -h
    # tmux -2 attach-session -d
}

