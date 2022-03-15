#!/usr/bin/env bash

# target_session=$(tmux display-popup -E "tmux list-sessions | fzf | echo")
main () {
    tmuxp_dir="$HOME/.tmuxp/"
    active_sessions=$(tmux list-sessions)
    saved_sessions=$(ls $tmuxp_dir)
    all_sessions="$active_sessions"$'\n'"$saved_sessions"
    all_sessions=$(echo "$all_sessions" | grep -o "^[^:\.]*" | sort -u)
    target_session=$(echo "$all_sessions" | fzf | grep -o "^[^:\.]*")

    tmux has-session -t $target_session &>/dev/null || \
        tmuxp load "$tmuxp_dir$target_session.yaml" -d

    tmux switch-client -t $target_session
}

main
