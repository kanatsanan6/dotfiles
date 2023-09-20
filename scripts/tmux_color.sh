#!/bin/bash

SESSION_NAME=$(tmux display-message -p '#S')

if [[ $SESSION_NAME == "k8s" ]]; then
    tmux select-pane -P 'bg=navy'
else
    tmux select-pane -P 'bg="#1F2A36"'
fi

