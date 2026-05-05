{ pkgs, ... }:

pkgs.writeShellScriptBin "ide-launcher" ''
  echo "ide-launcher ran with: $1" >> /tmp/ide.log
case "$1" in
  vscode) code ;;
  code-cursor) cursor ;;
  *) echo "Unknown IDE: $1" >&2; exit 1 ;;
esac
''


