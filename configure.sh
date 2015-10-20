#! /bin/sh

if [ -s "dotfiles" ]; then
    mv dotfiles .dotfiles
fi

####
# Get disto
DISTRO=`lsb_release -i | cut -d':' -f2`

####
# Install shell goodness
if [ "$DISTRO" == "Ubuntu" ]; then
    apt-get install zsh tmux vim
elif [ "$DISTRO" == "Arch" ]; then
    pacman -S zsh tmux vim
fi

chsh -s /bin/zsh

# Oh my Zsh install
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

####
# Install zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
mv zsh-syntax-highlighting ~/.dotfiles
echo "source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

####
# Create sym links
ln -s ~/.dotfiles/vimrc ~/.vimrc;
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf;

####
# source the zshrc file
. ~/.zshrc
