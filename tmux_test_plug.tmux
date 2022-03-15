#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# tmux bind-key T run-shell "$CURRENT_DIR/scripts/tmux_list_plugins.sh"
tmux bind-key s display-popup -E "$CURRENT_DIR/scripts/tmux_sessions.sh"
