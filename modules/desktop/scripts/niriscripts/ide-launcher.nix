{ pkgs, ... }:

pkgs.writeShellScriptBin "ide-launcher" ''
case "$1" in
  vscode) code ;;
  code-cursor) cursor ;;
  *) echo "Unknown IDE: $1" >&2; exit 1 ;;
esac
''


