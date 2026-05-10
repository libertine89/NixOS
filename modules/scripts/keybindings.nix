{ pkgs, lib, ... }:

pkgs.writeShellScriptBin "keybindings" ''
CONFIG_FILE=~/.config/niri/config.kdl

ROFI_THEME="''${XDG_CONFIG_HOME:-$HOME/.config}/rofi/launchers/type-2/style-2.rasi"
R_OVERRIDE="entry{placeholder:'Search Keybinds...';}listview{lines:15;}"

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

    while(match(line, /hotkey-overlay-title=(("[^"]*")|null)/)) {
        pre = substr(line, 1, RSTART-1)
        post = substr(line, RSTART+RLENGTH)
        line = trim(pre " " post)
    }

    while (match(line, /(allow-when-locked|allow-inhibiting|repeat|cooldown-ms)=[^ ]+/)) {
        pre = substr(line, 1, RSTART-1)
        post = substr(line, RSTART+RLENGTH)
        line = trim(pre " " post)
    }

    while (match(line, /filter="[^"]*"/)) {
        pre = substr(line, 1, RSTART-1)
        post = substr(line, RSTART+RLENGTH)
        line = trim(pre " " post)
    }

    gsub(/[[:space:]]+/, " ")
    line = trim(line)

    if (match(line, /^[^ \t{]+/)) {
        key = substr(line, RSTART, RLENGTH)
        cmd = substr(line, RSTART + RLENGTH)
        gsub(/[{}]/, "", cmd)
        cmd = trim(cmd)
        sub(/[[:space:]]*;[[:space:]]*$/, "", cmd)

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
' "$CONFIG_FILE" | rofi -dmenu -i -theme-str "$R_OVERRIDE" -theme "$ROFI_THEME"
''
