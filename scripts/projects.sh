#!/bin/zsh

# Set PROJECT_PATH in your ENV!
# export PROJECT_PATH=~/projects/
SWITCH_TO_PATH=$(ls $PROJECT_PATH | fzf-tmux -h)

if [ -n "$SWITCH_TO_PATH" ]; then
  tmux new-window -S -c $PROJECT_PATH$SWITCH_TO_PATH -n $SWITCH_TO_PATH 
fi
