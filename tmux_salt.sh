#!/bin/bash


# create tmux session
tmux new-session -d -s salt

# go into salt directory and update repos
tmux select-pane -t 0
tmux send-keys 'cd ~/Saltstack/salt && update_repos.sh' C-m

# ssh to arch master
tmux new-window -n 'arch'
tmux select-pane -t 1
tmux send-keys 'ssh arch' C-m

# ssh to jenkins
tmux new-window -n 'jenkins'
tmux select-pane -t 2
tmux send-keys 'ssh jenkins' C-m

# start back and salt pane
tmux select-pane -t 0
