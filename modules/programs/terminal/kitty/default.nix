{ pkgs, ... }:
{
  home-manager.sharedModules = [
    (_: {
      programs.kitty = {
        enable = true;
        font = {
          size = 12.0;
          name = "monospace";
        };
        themeFile = "Catppuccin-Mocha";
        shellIntegration.mode = "no-title";
        settings = {
          # shell = "${getExe pkgs.tmux}";
          watch_config_files = "no";
          #allow_remote_control = "yes";
          #listen_on = "unix:/tmp/kitty.sock";
          cursor_trail = 3; # Fancy cursor movements (especially in nixvim)
          cursor_trail_decay = "0.08 0.3"; # Animation speed
          cursor_trail_start_threshold = "4";
          strip_trailing_spaces = "smart";
          macos_option_as_alt = "yes";
          macos_quit_when_last_window_closed = true;
          copy_on_select = "yes";
          confirm_os_window_close = 0;
          scrollback_lines = 10000;
          enable_audio_bell = false;
          mouse_hide_wait = 60;
          update_check_interval = 0;

          ## Tabs
          tab_title_template = "{index}";
          active_tab_font_style = "normal";
          inactive_tab_font_style = "normal";
          tab_bar_style = "powerline";
          tab_powerline_style = "round";
          active_tab_foreground = "#1e1e2e";
          active_tab_background = "#cba6f7";
          inactive_tab_foreground = "#bac2de";
          inactive_tab_background = "#313244";

          # Pane Layout
          enabled_layouts = "tall";

        };
        keybindings = {
          # Clipboard
          "ctrl+c" = "copy_or_interrupt";
          "ctrl+x" = "copy_and_clear_or_interrupt";
          "ctrl+p" = "paste_from_clipboard";

          # Tab Management
          "ctrl+return" = "new_tab";
          # "super+ctrl+q" = "close_tab"; # Aliased in ZSH.nix
          "ctrl+1" = "goto_tab 1";
          "ctrl+2" = "goto_tab 2";
          "ctrl+3" = "goto_tab 3";
          "ctrl+4" = "goto_tab 4";
          "ctrl+5" = "goto_tab 5";
          "ctrl+tab" = "next_tab";

          # Pane Management
          "ctrl+shift+return" = "launch --cwd=current";
          "ctrl+shift+v" = "launch --location=vsplit --cwd=current";
          "ctrl+shift+s" = "launch --location=hsplit --cwd=current";
          # "super+ctrl+shift+q" = "close_window"; # Aliased in ZSH.nix
          "ctrl+shift+tab" = "move_window_forward";
          "ctrl+shift+h" = "neighboring_window left";
          "ctrl+shift+l" = "neighboring_window right";
          "ctrl+shift+k" = "neighboring_window up";
          "ctrl+shift+j" = "neighboring_window down";
          "ctrl+shift+left" = "neighboring_window left";
          "ctrl+shift+right" = "neighboring_window right";
          "ctrl+shift+up" = "neighboring_window up";
          "ctrl+shift+down" = "neighboring_window down";

          # Scrolling
          "alt+up" = "scroll_line_up";
          "alt+k" = "scroll_line_up";
          "alt+down" = "scroll_line_down";
          "alt+j" = "scroll_line_down";

          "alt+shift+up" = "scroll_page_up";
          "alt+shift+k" = "scroll_page_up";
          "alt+shift+down" = "scroll_page_down";
          "alt+shift+j" = "scroll_page_down";

          # Tmux
          "ctrl+t" = "launch --cwd=current --type=overlay tmux-sessionizer";
          # "ctrl+t" = "launch --cwd=current --title tmux-sessionizer tmux-sessionizer";
        };
      };
      xdg.configFile."kitty/quick-access-terminal.conf".text = ''
      edge center
      lines 24
      columns 70
      background_opacity 0.88
      hide_on_focus_loss yes
      mouse_hide_wait 1
      enable_audio_bell no
    '';
    })
    (import ./kitty-sessions.nix)
  ];
}
