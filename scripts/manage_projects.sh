#!/bin/bash

# Change directory to your projects directory
cd ~/Documents/datawowio

# Use fzf to select a project
project=$(ls -d */ ~/dotfiles | fzf --prompt="Select a project: " | sed 's/\/$//')

# Check if a session exists with that name
tmux has-session -t $project 2>/dev/null

# $? is a special variable that holds the exit status of the last command
# If the exit status is 0, it means the session exists
# If the exit status is 1, it means the session does not exist

if [ $? != 0 ]; then
    cd $project
    # Create a new session in the background
    tmux new-session -d -s $project

    # Maybe you want to run some commands in this new session. For example:
    # tmux send-keys -t $project "cd ~/Projects/$project" C-m
fi

# Attach to the session
tmux attach -t $project
