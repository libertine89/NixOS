#!/usr/bin/env bash
launch_pane() {
    local location="$1"
    local dir="$2"
    local cmd="$3"

    # Default directory
    if [ -z "${dir// }" ]; then
        dir="$PWD"
    fi

    # Expand ~ manually
    dir="${dir/#\~/$HOME}"

    # No command provided
    if [ -z "${cmd// }" ]; then
        kitty @ launch \
            $location \
            --cwd="$dir"
    else
        kitty @ launch \
            $location \
            --cwd="$dir" \
            bash -c "$cmd; exec bash"
    fi
}

# Pane 1
launch_pane "--type=os-window" "$1" "$2"

sleep 0.2

# Pane 2
launch_pane "--location=vsplit" "$3" "$4"

# Pane 3
launch_pane "--location=hsplit" "$5" "$6"
