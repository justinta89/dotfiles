#! /bin/python


import platform
import subprocess
import shlex
import os


def get_platform():
    return platform.system()


def get_os():
    platform = get_platform()
    if platform == 'Linux':
        cmd = ['cat', '/etc/os-release']
        p = subprocess.Popen(cmd, stdout=subprocess.PIPE)
        for line in p.stdout:
            if line.decode('UTF-8').startswith('NAME='):
                os_name = line.decode('UTF-8').split('=')[1]
                return os_name.strip('\n').strip('"')
    return platform


def install():
    os = get_os()
    tools = ['zsh', 'tmux', 'vim']
    ARCH_LINUX = True if os == 'Arch Linux' else False
    APPLE = True if os == 'Darwin' else False
    UBUNTU = True if os == 'Ubuntu' else False

    if ARCH_LINUX:
        install_cmd = ['pacman', '-S']
    if APPLE:
        install_cmd = ['brew', 'install']
    if UBUNTU:
        install_cmd = ['apt-get', 'install']

    cmd = install_cmd.extend(tools)
    subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)


def create_symlinks():
    os.symlink('~/.dotfiles/vimrc', '~/.vimrc')
    os.symlink('~/.dotfiles/tmux.conf', '~/.tmux.conf')


def install_omz():
    cmd = 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
    subprocess.Popen(shlex.split(cmd), stdout=subprocess.PIPE, stderr=subprocess.PIPE)


def setup():
    install()
    create_symlinks()
    install_omz()

if __name__ == '__main__':
    setup()

