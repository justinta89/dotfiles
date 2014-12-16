autoload -U colors && colors
PROMPT="%{$fg[cyan]%}%n%{$reset_color%}:%~# "
RPROMPT='%t'

# LS Configuration #
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=1

# VirtualEnv #
# export WORKON_HOME=$HOME/.virtualenvs/
# . `which virtualenvwrapper.sh`
# alias mkvirtualenv3="mkdirtualenv --python=`which python3`"

###################
#	   Alias      #
###################

# Server Alias #
alias justinta="ssh -i /Users/justinanderson/.ssh/id_rsa2 root@justinta.com"

# VirtualEnv Aliases #
# alias justin="clear; echo 'Now working on Justin'; workon justin && cd ~/projects/flask/justin"
# alias def="clear; echo 'Now working on Default'; workon default0-py2 && cd"
# alias ctf="clear; echo 'Now working on CTF'; workon ctf && cd ~/projects/flask/ctf"
# alias normal="deactivate; clear; cd"

# Syntax Highlighting #
source /zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
