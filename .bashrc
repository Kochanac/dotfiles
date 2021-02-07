#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

purple="$(echo -en \\e[35m)"
noc="$(echo -en \\e[m)"
blue="$(echo -en \\e[36m)"

PS1='[\[${purple}\]\u@\h\[${noc}\] ${blue}\w${noc}]\$ '

# .bashrc
PS1='\[${purple}\]\w \[${blue}\]$(echo $WINDOW)\[${noc}\]> '
export LS_COLORS='di=35:fi=34:ln=31:ex=93'
PS2='\n> '
# aliases
alias shutdown='sudo shutdown -h now'
alias reboot='sudo shutdown -r now'
alias mkdir='mkdir -p -v'
alias ls='ls --color'
alias sls='ls --color=never'
#alias ncm='ncmpcpp'
alias ashex="hexdump -e 16/1\ \\\"%02x\ \\\"\ \\\"\\\n\\\""
alias digg='dig -t any'
alias pac='pikaur'

alias l='ls'
alias e='echo'

alias tr='sudo -u tor tor'
alias wifi='sudo wifi-menu'
alias q='exit'
alias pcscreen='ssh -Y 192.168.100.6 x2x -to :0'
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
# alias dmount='sudo mount -o uid=1000'
dmount(){
	sudo mount $1 $2 && sudo chown -R kochan $2
}
alias umount='sudo umount'
alias brightness='sudo brightnessctl -d int*'

xpath() {
    xmllint --xpath "$1" --html - 2>/dev/null
}

alias task='ln -sf "$PWD" /tmp/task && echo -e "Linked."'

# Костыли
#alias pacaur='pacaur --force'
alias touchinit='xinput set-prop 11 307 1 && xinput set-prop 11 309 0 && xkbset m && xkbset exp m'


#alias nmap='proxychains nmap'
#alias msf='echo run proxy first'
# alias wget='proxychains wget'
#alias wpscan='proxychains wpscan'
alias psql='proxychains psql'
#alias mysql='proxychains mysql'
alias mongo='proxychains mongo'

json (){
	cat $1 | json_reformat
}

export PATH=$HOME/.config/scripts:$HOME/.local/bin:$PATH

#eval $(thefuck --alias)
#alias f='fuck'
alias logtouch='libinput record /dev/input/event7 > /tmp/touchlog'

# color man pages
man() {
    LESS_TERMCAP_md=$'\e[01;34m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;37;40m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;35m' \
    command man "$@"
}

unarch () {
   if [ -f $1 ] ; then
      case $1 in
         *.tar.bz2)   tar xjf $1      ;;
         *.tar.gz)   tar xzf $1      ;;
         *.bz2)      bunzip2 $1      ;;
         *.rar)      rar x $1      ;;
         *.gz)      gunzip $1      ;;
         *.tar)      tar xf $1      ;;
         *.tbz2)      tar xjf $1      ;;
         *.tgz)      tar xzf $1      ;;
         *.zip)      unzip $1      ;;
         *.Z)      uncompress $1   ;;
         *)         echo "'$1' cannot be extracted via unarch()" ;;
      esac
   else
      echo "'$1' is not a valid file"
   fi
}

alias please=sudo

# wal --theme random


alias unsolved='lstasks | grep -v "SOLVED"'

alias gob='gobuster'
alias gdirb='gobuster dir'
alias px='proxychains -q'
alias urldecode='python3 -c "from urllib.parse import unquote; print(unquote(input()))"'
alias urlencode='python3 -c "from urllib.parse import quote; print(quote(input()))"'



export HISTFILE="$XDG_DATA_HOME"/bash/history



get_tg_id() {
	echo -e "resolve_username $1" | telegram-cli -CID | grep -Eo "[0-9]*" 
}

