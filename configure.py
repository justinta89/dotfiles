#! /bin/python


import platform
import subprocess


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

    if os == 'Arch Linux':
        cmd = ['pacman', '-S', 'zsh', 'tmux', 'vim']
        subprocess.Popen(cmd)
    if os == 'Darwin':
        cmd = ['brew', 'install', 'zsh', 'tmux', 'vim']
        subprocess.Popen(cmd)


if __name__ == '__main__':
    os = get_os()
    print(os)
    install()

