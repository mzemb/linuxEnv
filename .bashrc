# Source global definitions
if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

alias ls='ls -F --color=tty'
alias ll='ls -alh --color=tty'
alias du='du -ch --max-depth=1'
alias df='df -h'
alias mv='mv -i'
alias rm='rm -I'
alias cp='cp -i'
alias mail='mutt'
alias claer='clear'
alias cls='clear'
alias qwerty='setxkbmap us'
alias azerty='setxkbmap fr'
alias dc='cd'
alias g='gvim'
alias givm='gvim'
alias gvom='gvim'
alias gview='gview -c "color darkblue" 2>/dev/null'
alias fdupes='find . -type f -exec md5sum '{}' \; | sort | uniq -d -w 36'
alias python='/usr/bin/python -B'
alias h='history | uniq | tail -15'
alias ps='/bin/ps --forest -F -U $USER'
alias gvim-gros='gvim -font "Fixed 20"'
alias gvim='gvim -geometry 120x70 2>/dev/null' #no idea why .bashrc sizes are ignored
alias gvimdiff='gvimdiff -c "set diffopt+=iwhite" 2>/dev/null'
alias togvim='gvim -R -'
alias r='reload_path'
alias top='htop -d 2'
alias grep2='/bin/grep --color --binary-files=without-match'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"' # use with: >sleep 10; alert
alias pdfview='evince'
alias conqueror='nautilus'
alias file-browser='nautilus --new-window &'
alias gnome-shell-restart='killall gnome-shell & gnome-shell --replace'
alias youtube2mp3='youtube-dl --audio-format mp3 --extract-audio'
alias ntpupdate='date ; sudo service ntp stop ; sudo ntpdate -s time.nist.gov ; sudo service ntp start ; date'
alias mp3play='rhythmbox'
alias files='sed 's/:.*//' | sort | uniq | xargs gvim'
alias title='echo -ne "\033]0; ${PWD##*/}\007"'
alias titleFull='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
alias meld='/usr/bin/meld 2>/dev/null'

# single tab for completion
set show-all-if-ambiguous on
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export GREP_COLORS="ms=01;34" #change grep match from red to blue
export EDITOR=vim
export HISTFILE=~/.bash_history
export HISTCONTROL=ignorespace:ignoredups
export HISTIGNORE=h:history
export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTTIMEFORMAT="%d/%m/%Y %H:%M:%S "
export PAGER=less
# create history file with every command ever typed !
PROMPT_COMMAND=
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo -ne "\033]0; ${PWD##*/}\007" ; echo "$PWD $(history 1)" >> ~/.bash_eternal_history'

export LC_ALL=en_US.UTF-8

# usefull when directory has been deleted and recreated
function reload_path (){
	mypath=`pwd`
	cd /
	cd $mypath
}


# disable altgr-space
setxkbmap -option "nbsp:none"


# convenient search fonctions 
# find base inside sources - find files which contains pattern - excludes specific path
function fbis () {                                      
	find . \( -name "\.git" -o -name "\.svn" -o -name "*\.map" \) -prune -o -type f -print0 | grep -vzZ \/build\/ | xargs -0 /bin/grep -i --color -n --binary-files=without-match $1 
}
# find base inside - find files which contains pattern
function fbi () {                                      
	find . \( -name "\.git" -o -name "\.svn" -o -name "*\.map" \) -prune -o -type f -print0 |                       xargs -0 /bin/grep -i --color -n --binary-files=without-match $1 
}
# find base sources - find files whoose names match pattern - excludes specific path
function fbs() {                                       
	find . \( -name "\.git" -o -name "\.svn" -o -name "*\.map" \) -prune -o -type f -print  | grep -v   \/build\/ |          /bin/grep -i --color --null $1
}
# find base - find files whoose names match pattern
function fb() {                                       
	find . \( -name "\.git" -o -name "\.svn"                   \) -prune -o -type f -print  |                                /bin/grep -i --color --null $1
}

# find base & open
alias ofb='fbo'
function fbo() {
	searchresult=$(fb $1)
	n=$(echo $searchresult | wc -w)
	if [ "$n" != "1" ]
	then
		echo "error: found $n files:" $searchresult
	else
		echo "opening $searchresult"
		gvim $searchresult
	fi
}


# goes back until repo root
function back () {
    if [ "$(pwd)" == "/" ]; then
        echo "back: repo root not found: stopping at /"
    else
	    if [ ! -d ".svn" ]; then
	    #if [ ! -d ".git" ]; then
	    	cd ..
	    	back
	    fi
    fi
}

# creates a file with random data (for test purposes)
function randomData () {
    if [ "$1" == "" ]; then
        echo "error: usage: randomData <MB_SIZE>" >&2
    else
        head -c ${1}M </dev/urandom
    fi
}

# enriched hh
function hh () {
	if [ $# -gt 1 ]; then
		echo "error: usage: hh [word]" >&2
    else
        if [ "$1" == "" ]; then
            tail    -1000 ~/.bash_eternal_history | uniq | tail -40
        else
            grep -i "$1"  ~/.bash_eternal_history | uniq | tail -40
        fi
    fi
}

