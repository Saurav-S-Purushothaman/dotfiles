#!/usr/bin/env bash

# This is the script and the explantion to start the API server.

# Create a new tmux window
tmux new-window

# Now we are in the new tmux window.

# Navigate to the unifize-server directory
# The tmux send-keys command simulates typing key-strokes into active
# tmux session. C-m (Control + m) is equivalent to pressing enter.
tmux send-keys "cd unifize-server/apps/api" C-m

# Start the unifize server
tmux send-keys "lein repl" C-m

# Wait a little bit to run `(go)`
sleep 1

# Execute the command (go) inside the REPL
tmux send-keys "(go)" C-m
