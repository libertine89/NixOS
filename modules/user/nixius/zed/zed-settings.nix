{
  # General & Themes
  vim_mode = true;
  vim = {
    cursor_shape = {
      normal = "block";
      insert = "bar";
      visual = "hollow";
      replace = "underline";
    };
  };
  relative_line_numbers = "wrapped";
  theme = "Catppuccin Mocha";
  icon_theme = "Catppuccin Mocha";
  cursor_blink = false;
  hover_popover_enabled = true;
  hover_popover_delay = 300;
  autosave = "on_focus_change";
  format_on_save = "on";
  current_line_highlight = "all";
  remove_trailing_whitespace = true;
  extend_comment_on_newline = true;
  multi_cursor_modifier = "alt";
  active_pane_modifiers = {
    inactive_opacity = 0.8;
  };
  search = {
    case_sensitive = false;
  };
  which_key = {
    enabled = true;
  };
  session = {
    trust_all_worktrees = true;
  };
  toolbar = {
    agent_review = false;
    selections_menu = false;
    quick_actions = false;
    breadcrumbs = false;
  };
  # Brackets & Indentation Coloring
  colorize_brackets = true;
  indent_guides = {
    enabled = true;
    coloring = "indent_aware";
    background_colouring = "indent_aware";
  };
  # Font  & Sizes
  buffer_font_family = "JetBrainsMono Nerd Font";
  ui_font_size = 16;
  buffer_font_size = 12.0;
  agent_buffer_font_size = 10.0;
  agent_ui_font_size = 12.0;
  # Scrolling
  horizontal_scroll_margin = 60.0;
  vertical_scroll_margin = 10.0;
  scrollbar = {
    show = "never";
  };

  minimap = {
    current_line_highlight = "gutter";
    thumb_border = "left_open";
    thumb = "always";
    show = "always";
  };
  # Agent
  agent = {
    sidebar_side = "right";
    dock = "right";
    favorite_models = [ ];
    model_parameters = [ ];
  };

  agent_servers = {
    cursor = {
      type = "registry";
    };
  };
  # Layout
  project_panel = {
    dock = "left";
    git_status = true;
  };

  git_panel = {
    dock = "left";
    tree_view = false;
  };

  tabs = {
    file_icons = false;
    git_status = true;
  };

  title_bar = {
    show_branch_status_icon = true;
  };
  # Languages
  languages = {
    TypeScript = {
      formatter = {
        external = {
          command = "prettier";
          args = [
            "--stdin-filepath"
            "{buffer_path}"
          ];
        };
      };
    };

    TSX = {
      formatter = {
        external = {
          command = "prettier";
          args = [
            "--stdin-filepath"
            "{buffer_path}"
          ];
        };
      };
    };

    JavaScript = {
      formatter = {
        external = {
          command = "prettier";
          args = [
            "--stdin-filepath"
            "{buffer_path}"
          ];
        };
      };
    };

    JSON = {
      formatter = {
        external = {
          command = "prettier";
          args = [
            "--stdin-filepath"
            "{buffer_path}"
          ];
        };
      };
    };
  };
}
