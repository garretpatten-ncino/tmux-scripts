#!/bin/bash

SESSION='main'

tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION

    tmux rename-window 'home'
    tmux send-keys -t $SESSION:0 'clear && echo "" && fastfetch' C-m

    tmux new-window -t $SESSION -n 'documentation'
    tmux send-keys -t $SESSION:1 'clear && cd $HOME/Projects/product-security/product-security-docs && lls' C-m

    tmux new-window -t $SESSION -n 'license-verifier'
    tmux send-keys -t $SESSION:2 'clear && cd $HOME/Projects/product-security/license-verifier && lls' C-m

    tmux new-window -t $SESSION -n 'tinker'
    tmux send-keys -t $SESSION:3 'clear && update' C-m

    tmux set-option -t $SESSION status on
fi

tmux select-window -t $SESSION:0

tmux attach-session -t $SESSION
