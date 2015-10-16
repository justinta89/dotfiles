PATH=$PATH:~/Scripts

autoload -U colors && colors
autoload -U compinit

compinit
# Old prompt
# PROMPT="%{$fg[cyan]%}%n%{$reset_color%}:%~# "
# RPROMPT='%t'


# New prompt
## Powerline ##
. /Library/Python/2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# LS Configuration #
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=1

# set vi mode
bindkey -v

# VirtualEnv #
export WORKON_HOME=$HOME/.virtualenvs/
. `which virtualenvwrapper.sh`
alias mkvirtualenv3="mkdirtualenv --python=`which python3`"

###################
#      Alias      #
###################
# Server Alias #
# Need to re-key for this to work. 
# alias justinta="ssh -i /Users/justinanderson/.ssh/id_rsa2 root@justinta.com"

# VirtualEnv Aliases #
alias normal="deactivate; clear; cd"
alias saltTesting="workon saltTesting; cd ~/SaltStack; clear"

# Syntax Highlighting #
source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Evaluate system PATH
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi
