#!/usr/bin/env bash

tmux new-window

tmux send-keys "cd unifize-web && npm start" C-m
