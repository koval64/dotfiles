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

