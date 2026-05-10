{ pkgs, ... }:

pkgs.writeShellScriptBin "keybindings" ''
#!/bin/bash

CONFIG_FILE=~/.config/niri/config.kdl

awk '
function trim(s) { gsub(/^[ \t]+|[ \t]+$/, "", s); return s }
function basename(path) { n = split(path, parts, "/"); return parts[n] }

BEGIN { brace_level=0 }

/[[:space:]]*binds[[:space:]]*{/ { brace_level++; next }

brace_level > 0 {
    n_open = gsub(/{/, "{")
    n_close = gsub(/}/, "}")
    brace_level += n_open - n_close
    if (brace_level <= 0) { brace_level=0; next }

    sub(/\/\/.*/, "")

    line = trim($0)
    if (line == "" || line == "{" || line == "}") next

    gsub(/\$mainMod/, "SUPER")
    gsub(/\$modeMod/, "SHIFT")

    # Remove hotkey-overlay-title="..." or null
    while(match(line, /hotkey-overlay-title=(("[^"]*")|null)/)) {
        pre = substr(line, 1, RSTART-1)
        post = substr(line, RSTART+RLENGTH)
        line = trim(pre " " post)
    }

    # Aggressively remove flags
    while (match(line, /(allow-when-locked|allow-inhibiting|repeat|cooldown-ms)=[^ ]+/)) {
        pre = substr(line, 1, RSTART-1)
        post = substr(line, RSTART+RLENGTH)
        line = trim(pre " " post)
    }

    # Remove filter="..."
    while (match(line, /filter="[^"]*"/)) {
        pre = substr(line, 1, RSTART-1)
        post = substr(line, RSTART+RLENGTH)
        line = trim(pre " " post)
    }

    # Collapse multiple spaces
    gsub(/[[:space:]]+/, " ")
    line = trim(line)

    if (match(line, /^[^ \t{]+/)) {
        key = substr(line, RSTART, RLENGTH)
        cmd = substr(line, RSTART + RLENGTH)
        gsub(/[{}]/, "", cmd)
        cmd = trim(cmd)

        # Strip trailing semicolon (only here)
        sub(/[[:space:]]*;[[:space:]]*$/, "", cmd)

        # Only wrap Nix store scripts
        if (cmd ~ /^spawn "\/nix\/store\//) {
            split(cmd, parts, "\"")
            if (length(parts) > 1) {
                path = parts[2]
                script = basename(path)
                gsub(/\.nix$/, "", script)
                cmd = "Run " script " Script"
            }
        }

        if (cmd != "") print key " → " cmd
    }
}
' "$CONFIG_FILE" | rofi -dmenu -i -markup -eh 2 -replace -p "Keybinds"
''
