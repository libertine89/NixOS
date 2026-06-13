[
  {
    unbind = {
      "ctrl-`" = "terminal_panel::Toggle";
      "ctrl-h" = "buffer_search::DeployReplace";
      "ctrl-q" = "zed::Quit";
    };

    bindings = {
      "ctrl-t" = "terminal_panel::Toggle";
      "space shift-e" = "project_panel::Toggle";
      "space /" = "buffer_search::DeployReplace";
      "ctrl-q" = "pane::CloseActiveItem";
    };
  }

  {
    context = "Workspace";

    unbind = {
      "ctrl-b" = "workspace::ToggleLeftDock";
      "ctrl-shift-e" = "project_panel::ToggleFocus";
      "ctrl-p" = "file_finder::Toggle";
    };

    bindings = {
      "space e" = "project_panel::ToggleFocus";
      "space f" = "file_finder::Toggle";
      "space s c" = "git_panel::Toggle";
    };
  }

  {
    context = "vim_mode == normal || vim_mode == insert || vim_mode == visual";

    bindings = {
      "space p" = [
        "editor::Paste"
        {
          preserve_clipboard = true;
        }
      ];
    };
  }

  {
    context = "vim_mode == normal || vim_mode == visual || vim_mode == operator";

    unbind = {
      "] e" = "editor::MoveLineDown";
      "[ e" = "editor::MoveLineUp";
    };

    bindings = {
      "alt-j" = "editor::MoveLineDown";
      "alt-k" = "editor::MoveLineUp";
    };
  }

  {
    context = "VimControl && !menu";

    unbind = {
      "0" = "vim::StartOfLine";
      "$" = "vim::EndOfLine";
    };

    bindings = {
      "ctrl-b" = "vim::StartOfLine";
      "ctrl-e" = "vim::EndOfLine";
    };
  }

  {
    context = "(vim_mode == helix_normal || vim_mode == helix_select) && !menu";

    bindings = {
      "space p" = "editor::Paste";
    };
  }

  {
    context = "Editor && vim_mode == insert";

    bindings = {
      "j k" = "vim::NormalBefore";
    };
  }

  {
    context = "ProjectPanel && not_editing";

    unbind = {
      "escape" = "vim::ToggleProjectPanelFocus";
    };

    bindings = {
      "space e" = "vim::ToggleProjectPanelFocus";
    };
  }

  {
    context = "AgentPanel";

    unbind = {
      "ctrl-shift-e" = "project_panel::ToggleFocus";
    };

    bindings = {
      "space e" = "project_panel::ToggleFocus";
    };
  }

  {
    context = "BufferSearchBar";

    unbind = {
      "ctrl-h" = "search::ToggleReplace";
    };

    bindings = {
      "space /" = "search::ToggleReplace";
    };
  }
]
