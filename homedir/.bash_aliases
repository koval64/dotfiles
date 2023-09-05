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
  tar -czf "$(date -u +"%Y%m%d_%s")_$path.tar.gz" $path
}

function searchf() {         # search for file in current directory
  find . -type f -iname "$1" 2>&1 | grep -v "Permission denied"
}

function searchd() {         # search for file in current directory
  find . -type d -iname "$1" 2>&1 | grep -v "Permission denied"
}


function images() {
  # find . -type f iname "*$1*" | grep -v .cache/" | mpv -fs --playlist=-
  # searchf "*$1*" | grep -v ".cache/" | sxiv -i -S 5 -f -sf
  # searchf "*$1*" | mpv -fs --image-display-duration=6 --playlist=-
  searchf "*$1*" | mpv -fs --image-display-duration=3 --playlist=-
}

function v() {
    if [ $# -eq 0 ]; then
        nvim -p $(ls -p | grep -v '/$' | fzf -i --multi --layout=reverse --exact --preview "cat {}")
    else
        FOLDER=$(pwd)
        echo $@
        if [ -d "$FOLDER" ];
        then
            echo "$FOLDER directory exists."
            cd "$1" && nvim -p * && cd $FOLDER
        else
            echo "$FOLDER directory does not exist."
        fi
    fi
}

